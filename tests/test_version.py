# -*- coding: utf-8 -*-
from __future__ import unicode_literals, print_function
import re
import sys
from io import StringIO
from onixcheck.__main__ import main
from onixcheck import __version__


def test_version_command(monkeypatch):
    # type: (object) -> None
    """Test that the --version command outputs the correct version."""
    # Capture stdout
    captured_output = StringIO()
    monkeypatch.setattr(sys, "stdout", captured_output)

    # Run the command with --version flag
    exit_code = main(["--version"])

    # Get the output
    output = captured_output.getvalue().strip()

    # Check that the version is in the output
    assert re.search(r"onixcheck version \d+\.\d+\.\d+", output)
    assert __version__ in output

    # Check that the exit code is 0
    assert exit_code == 0
