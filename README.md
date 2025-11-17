# LaTeX Template Repository

This repository provides a modern LaTeX template for academic paper writing with an automated build system and comprehensive writing guidelines.

## Quick Start

```bash
# Build the main PDF (this is the only command needed unless you are fiddling with figures)
make pdf

# Convert SVG figures to PDF (when needed)
make pdf-figures

# Continuous compilation (watches for changes)
make cont

# Generate diff against previous version
make diff

# Clean auxiliary files
make clean
```

## Writing Guidelines

This repository follows comprehensive writing guidelines documented in [`misc/writing_with_erick.md`](misc/writing_with_erick.md). Key principles include:

- **One sentence per line** in TeX files for easy reorganization and clean diffs
- Write complete introduction first to ensure proper motivation
- Use understatement over overstatement - substantial advances speak for themselves
- Make direct statements with parenthetical figure references
- Follow hierarchical revision: section → paragraph → sentence → word level

## Responses to reviewers

When writing a response to reviewers, continue to edit the `main.tex`. 
We will have a separate response file: either Markdown or TeX.

See [Bill Noble's Ten simple rules for writing a response to reviewers](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005730) for excellent advice.

## File Organization

- `main.tex` - Main document (always the most up-to-date file)
- `main.bib` - Bibliography
- `prep-figures/` - Source SVG figures
- `figures/` - Generated PDF figures (commit these)
- `versions/v1.tex` - Previous version for diff generation

## Build System

The repository uses `latexmk` with a `Makefile` wrapper for common tasks:

- `make pdf` - Build main PDF document
- `make pdf-figures` - Convert SVG figures to PDF using Inkscape
- `make cont` - Continuous compilation mode (watches for file changes)
- `make diff` - Generate comparison PDF against `versions/v1.tex`
- `make clean` - Remove auxiliary files (keep PDFs)
- `make cleanall` - Remove all generated files including PDFs

## GitHub Actions

The repository automatically builds PDFs on every push and pull request. You can:

1. **View compiled PDFs**: Go to the **Actions** tab in GitHub
2. **Download artifacts**: Click on any workflow run and download the `paper-pdf` artifact
3. **No local LaTeX needed**: Collaborators can review PDFs without installing LaTeX

PDFs are timestamped with format `{repo-name}_{YYYY-MM-DD@HH-MM}.pdf` in Pacific timezone (e.g., `tex-template_2025-08-07@14-23.pdf`).

The CI uses a pre-built Docker container for fast, reliable builds.

## Development Workflow

1. Edit `main.tex` and other source files
2. Run `make pdf-figures` if you've added/modified SVG figures
3. Run `make pdf` to build locally
4. Commit changes (including any new PDF figures)
5. Push to GitHub - PDF will be automatically built and available in Actions tab

## Requirements

**Local development:**
- LaTeX distribution (TeX Live, MikTeX, etc.)
- [`latexmk`](https://www.cantab.net/users/johncollins/latexmk/) command
- [`latexdiff`](https://ctan.org/pkg/latexdiff) for document comparison
- `inkscape` (only if you are mucking with SVG figures)

## File Management

- All compiled files are ignored via `.gitignore`
- Commit PDF figures to the repository
- Use `%EM` or similar initials to mark reviewer comments in TeX files