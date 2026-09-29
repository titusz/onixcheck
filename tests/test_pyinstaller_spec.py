# -*- coding: utf-8 -*-
"""Check that the frozen build packages every schema tree the app loads."""

from __future__ import unicode_literals

import ast
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC_PATH = ROOT / "pyinstaller.spec"

# Directories the frozen app resolves under sys._MEIPASS (see onixcheck.schema).
REQUIRED_PREFIXES = (
    "biblon",
    "google",
    "rng3.0",
    "rng3.1",
    "xsd2.1",
    "xsd3.0",
    "xsd3.1",
)

# Main ONIX 3.1 schema the Windows binary failed to locate (issue #11), plus includes.
O31_XSD_FILES = (
    "ONIX_BookProduct_3.1_reference.xsd",
    "ONIX_BookProduct_3.1_short.xsd",
    "ONIX_BookProduct_CodeLists.xsd",
    "ONIX_XHTML_Subset.xsd",
)


def _const_str(node):
    assert isinstance(node, ast.Constant) and isinstance(node.value, str)
    return node.value


def test_pyinstaller_spec_bundles_schema_trees():
    """Every schema Tree() must be passed to EXE, including xsd3.1.

    Defining ``xsd31`` without handing it to EXE leaves
    ``xsd3.1/ONIX_BookProduct_3.1_reference.xsd`` out of the onefile archive,
    which is the path ONIX 3.1 validation loads under ``sys._MEIPASS``.
    """
    module = ast.parse(SPEC_PATH.read_text(encoding="utf-8"), filename=str(SPEC_PATH))

    trees = {}
    exe_names = []

    for stmt in module.body:
        if not isinstance(stmt, ast.Assign) or len(stmt.targets) != 1:
            continue
        target = stmt.targets[0]
        if not isinstance(target, ast.Name) or not isinstance(stmt.value, ast.Call):
            continue
        func = stmt.value.func
        if not isinstance(func, ast.Name):
            continue

        if func.id == "Tree":
            source = _const_str(stmt.value.args[0])
            prefix = None
            for keyword in stmt.value.keywords:
                if keyword.arg == "prefix":
                    prefix = _const_str(keyword.value)
            assert prefix, "Tree() is missing a prefix"
            source_path = (ROOT / source).resolve()
            assert source_path.is_dir(), source
            trees[target.id] = (prefix, source_path)
        elif func.id == "EXE" and target.id == "exe":
            exe_names = [arg.id for arg in stmt.value.args if isinstance(arg, ast.Name)]

    assert exe_names, "EXE() assignment not found"

    omitted = sorted(name for name in trees if name not in exe_names)
    assert omitted == [], "schema trees not passed to EXE: " + ", ".join(omitted)

    bundled = {trees[name][0] for name in exe_names if name in trees}
    missing_prefixes = [prefix for prefix in REQUIRED_PREFIXES if prefix not in bundled]
    assert missing_prefixes == [], "schema prefixes missing from EXE: " + ", ".join(missing_prefixes)

    xsd31_dirs = [path for prefix, path in trees.values() if prefix == "xsd3.1"]
    assert len(xsd31_dirs) == 1
    for filename in O31_XSD_FILES:
        assert (xsd31_dirs[0] / filename).is_file(), filename
