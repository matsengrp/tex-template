# LaTeX Template Repository

This repository provides a modern LaTeX template with an automated build system for academic paper writing. It follows the writing guidelines used by Erick Matsen's research group.

## Overview

This template is designed for collaborative academic writing with:
- Modern build system using `latexmk`
- GitHub Actions for automatic PDF generation
- SVG figure workflow with Inkscape conversion
- Document comparison using `latexdiff`
- LaTeX Workshop compatibility

## Quick Start

```bash
# Build the main PDF
make pdf

# Convert SVG figures to PDF (run this first if you have figures)
make pdf-figures

# Continuous compilation (watches for changes)
make cont

# Open PDF in viewer (Skim on macOS, Zathura on Linux) and run continuous compilation
make auto

# Generate diff against previous version
make diff

# Clean auxiliary files
make clean
```

## Writing Guidelines

Prose style lives in the `scientific-tex-editor` agent, installed at `~/.claude/agents/`;
source is
[`agents/scientific-tex-editor.md`](https://github.com/matsen/bipartite/blob/main/agents/scientific-tex-editor.md)
in `matsen/bipartite`. Use it when drafting or revising prose, and treat it as the source of
truth rather than restating its rules here. Two rules hold for every edit regardless:

- **One sentence per line** in TeX files, for easy reorganization and clean diffs
- **Use an em-dash only when every alternative is less elegant** (machine-written prose overuses them)

`misc/writing_with_erick.md` and the [wiki page](https://github.com/matsengrp/wiki/wiki/writing_with_erick)
it was copied from are background reading. They are not kept in sync, and they are not the
operative style.

## Build System

### Files Structure
- `main.tex` - Main document (do not split with `\input`)
- `main.bib` - Bibliography
- `prep-figures/` - Source SVG figures
- `figures/` - Generated PDF figures
- `versions/` - Previous versions for diff generation

### Available Commands
- `make pdf` - Build main PDF
- `make pdf-figures` - Convert SVG figures to PDF
- `make cont` - Continuous compilation mode
- `make auto` - Open PDF in viewer and run continuous compilation (override with `PDF_VIEWER=...`)
- `make diff` - Generate comparison with `versions/v1.tex`
- `make clean` - Remove auxiliary files
- `make cleanall` - Remove all generated files
- `make help` - Show available targets

### GitHub Actions
The repository automatically builds PDFs on push/PR and uploads them as artifacts with 30-day retention, making it easy for collaborators to review without local LaTeX installation.

## File Management
- All compiled files are ignored via `.gitignore`
- Comments marked with `%EM` or some other initials indicate reviewer feedback

## Authored comments (`%INITIALS`)

`%` comments tagged with author initials (e.g. `%XY`, `%AB`) are reviewer or collaborator feedback. Each set of initials identifies the author of that comment.

**Never remove or modify an initialed comment yourself.** Preserve every `%<initials>` comment verbatim across edits, even when the surrounding text is rewritten. When an edit addresses one, say so and offer to delete it. The comment's authors decide.

Plain `%` comments without initials (TODO notes, section markers, etc.) may be edited or removed normally.
