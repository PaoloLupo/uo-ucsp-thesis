set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

root := justfile_directory()
export TYPST_ROOT := root
python := if os() == "macos" { "python3" } else if os() == "windows" { "py" } else { "python" }

[private]
default:
    @just --list --unsorted

# Package the library into the specified directory
package target:
    {{ python }} ./scripts/package.py {{ target }}

# Install the library with the "@local" prefix
install: (package "\"@local\"")

# Install the library with the "@preview" prefix
install-preview: (package "\"@preview\"")

[private]
remove target:
    {{ python }} ./scripts/uninstall.py {{ target }}

# Uninstalls the library with the "@local" prefix
uninstall: (remove "\"@local\"")

# Uninstalls the library with the "@preview" prefix
uninstall-preview: (remove "\"@preview\"")

# Compiles the template to check if installation works
check: install
    typst compile template/main.typ --root .

# Removes build artifacts (Windows/PS)
clean:
    if (Test-Path template/main.pdf) { Remove-Item template/main.pdf }
