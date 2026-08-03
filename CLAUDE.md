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

# Open PDF in viewer (Skim on macOS, Zathura on Linux) and run continuous compilation
make auto

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

### Prose self-check (run on every paragraph you draft)

All eight items below fix one underlying LLM failure mode: **the main clause goes inert and
the real content gets demoted** — into an appositive after a dash, into a subordinate clause,
into the agent slot of a passive. Check every drafted paragraph against all eight before
showing it.

- **No clefts.** These are the worst offenders, because the subject slot becomes a placeholder. Rewrite *it is because X that Y* → *because X, Y*; *what P cannot tell us is Z* → *P cannot tell us Z*; *Z is what P cannot decide* → *P cannot decide Z*; *this is what lets us do Z* → *X lets us do Z*. Also *there is/are … that*.
- **Every sentence names its actor.** The grammatical subject should be a thing under discussion — we, the model, the estimator, the data — not *This, That, Such a…, The consequence, Any difference*. At most one backward-pointing subject per paragraph. Prefer active voice: *almost all of it is carried by X* → *X carries almost all of it*.
- **The topic sentence carries the claim.** A reader skimming only first sentences should get the argument.
- **Watch inert main verbs.** *is, are, has, offers, provides, represents, constitutes* as the main verb — anywhere, not just in the topic sentence — means the real action is probably elsewhere in the sentence. Promote it. A genuine definition is fine.
- **No setup–pivot–payoff.** If a sentence pivots on a dash, colon, or semicolon, check whether the payoff stands alone. If it does, cut the setup and let it. An em-dash pair is fine when it interrupts with a list or gloss; it is not fine as the hinge before the conclusion. Never in the topic sentence.
- **Split long sentences.** Past roughly 40 words, or two independent clauses plus a subordinate one, split. Long sentences are where buried payoffs hide.
- **"Not X but Y" is a smell.** State Y. Keep the contrast only when it is the point (*small, not null*).
- **Plain register.** Prefer a plain statement to an elevated one: *the assumption has empirical warrant* → *the data support the assumption*; *organism is decisive* → *the choice of organism matters*. Cut intensifiers (*exactly, precisely, genuinely, crucially, a real X*) unless they carry technical weight. Do not editorialize about your own results (*this matters more than…*); state the finding and let it stand. Cut any sentence that restates the one before it.

Two of these are mechanically checkable — `grep -c -- " --- " main.tex` for dash density, and a
word count per line for sentence length. The rest need reading.

This operationalizes `misc/writing_with_erick.md`: *have the primary noun and the primary verb
describe the most important actor and action in that sentence.*

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

## Philosophy

Following George Orwell's advice:
- Never use a long word where a short one will do
- If it is possible to cut a word out, always cut it out
- Never use the passive where you can use the active
- Break any of these rules sooner than say anything outright barbarous

The goal is clear, engaging academic communication that respects both the reader's time and the importance of the research being presented.