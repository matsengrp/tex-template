# LaTeX Template Repository

This repository provides a modern LaTeX template with an automated build system for academic paper writing. It follows the writing guidelines established by Erick Matsen's research group.

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

# Generate diff against previous version
make diff

# Clean auxiliary files
make clean
```

## Writing Guidelines

This repository follows the comprehensive writing guidelines documented in `misc/writing_with_erick.md`. Key principles include:

### Structure and Organization
- **One sentence per line** in TeX files for easy reorganization and clean diffs
- Write a complete introduction first to ensure proper motivation
- Follow hierarchical revision: section → paragraph → sentence → word level
- Begin each methods section with "we have data of this form"

### Content Guidelines
- Use understatement over overstatement - substantial advances speak for themselves
- Keep readers engaged and avoid annoying/boring/confusing them
- Make direct statements with parenthetical figure references: "Unicorns are generous (Figure 1)"
- Avoid nominalizations and "zombie nouns" - use active voice with clear subjects and verbs

### Technical Requirements
- Spell-check and read every word aloud before submission
- Define acronyms once each in: abstract, main text, figures, and tables
- Use present tense for widely accepted facts, past tense for specific experiments
- Refer to equations with `\eqref{}`, not "Equation \eqref{}"

### Figures and Visualization
- Base designs on [Fundamentals of Data Visualization](http://serialmentor.com/dataviz/) by Claus O. Wilke
- Use SVG as default line-art format
- Maintain consistent, readable text across figures
- Prefer ColorBrewer colors for consistency

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
- `make diff` - Generate comparison with `versions/v1.tex`
- `make clean` - Remove auxiliary files
- `make cleanall` - Remove all generated files
- `make help` - Show available targets

### GitHub Actions
The repository automatically builds PDFs on push/PR and uploads them as artifacts with 30-day retention, making it easy for collaborators to review without local LaTeX installation.

## File Management
- All compiled files are ignored via `.gitignore`
- Comments marked with `%EM` or some other initials indicate reviewer feedback

## Philosophy

Following George Orwell's advice:
- Never use a long word where a short one will do
- If it is possible to cut a word out, always cut it out
- Never use the passive where you can use the active
- Break any of these rules sooner than say anything outright barbarous

The goal is clear, engaging academic communication that respects both the reader's time and the importance of the research being presented.