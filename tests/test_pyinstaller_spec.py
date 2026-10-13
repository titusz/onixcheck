# -*- coding: utf-8 -*-
"""Check that pyinstaller.spec bundles every schema file the frozen app loads (see issue #11)."""

from pathlib import Path
from types import SimpleNamespace

import pytest
from PyInstaller.building.datastruct import Tree
from PyInstaller.config import CONF

from onixcheck import schema

ROOT = Path(__file__).resolve().parents[1]
SCHEMA_DIR = Path(schema.basedir)


@pytest.fixture
def bundled(monkeypatch, tmp_path):
    """Run pyinstaller.spec with stubbed build steps and return the data file names passed to EXE."""
    monkeypatch.chdir(ROOT)
    monkeypatch.setitem(CONF, "workpath", str(tmp_path))
    analysis = SimpleNamespace(pure=[], zipped_data=[], scripts=[], binaries=[], zipfiles=[], datas=[])
    exe_args = []
    namespace = {
        "Analysis": lambda *args, **kwargs: analysis,
        "PYZ": lambda *args, **kwargs: None,
        "EXE": lambda *args, **kwargs: exe_args.extend(args),
        "Tree": Tree,
    }
    exec((ROOT / "pyinstaller.spec").read_text(encoding="utf-8"), namespace)
    return {Path(name).as_posix() for toc in exe_args if isinstance(toc, Tree) for name, _, _ in toc}


def test_spec_bundles_all_schema_files(bundled):
    expected = {
        path.relative_to(SCHEMA_DIR).as_posix()
        for path in SCHEMA_DIR.rglob("*")
        if path.is_file() and path.suffix != ".py" and "__pycache__" not in path.parts
    }
    assert bundled == expected


def test_spec_bundles_schema_constants(bundled):
    constants = [value for name, value in vars(schema).items() if name.isupper() and isinstance(value, str)]
    assert schema.O31_XSD_REFERENCE in constants
    for path in constants:
        assert Path(path).relative_to(SCHEMA_DIR).as_posix() in bundled
