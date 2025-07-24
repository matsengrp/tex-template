# Makefile wrapper for latexmk
# Provides simple commands for common LaTeX build tasks

.PHONY: all pdf pdf-figures continuous cont clean cleanall cleanfigs diff help

# Default target - build the PDF
all: pdf

# Build the main PDF (without building figures)
pdf:
	latexmk

# Build PDF figures from SVG sources
pdf-figures:
	@echo "Converting SVG figures to PDF..."
	@mkdir -p figures
	@for svg in prep-figures/*.svg; do \
		if [ -f "$$svg" ]; then \
			pdf="figures/$$(basename $$svg .svg).pdf"; \
			echo "Converting $$svg to $$pdf"; \
			inkscape --export-area-drawing --export-type=pdf --export-filename="$$pdf" "$$svg"; \
		fi \
	done

# Continuous compilation mode - watch for changes and rebuild
continuous: cont
cont:
	latexmk -pvc

# Clean auxiliary files (keep PDF)
clean:
	latexmk -c

# Clean everything including PDF
cleanall:
	latexmk -C
	rm -f diff.tex diff.pdf

# Clean figure PDFs
cleanfigs:
	rm -f figures/*.pdf

# Generate diff against previous version
# Usage: make diff
# Assumes versions/v1.tex exists
diff:
	@if [ ! -f versions/v1.tex ]; then \
		echo "Error: versions/v1.tex not found"; \
		echo "Please create this file to generate diffs"; \
		exit 1; \
	fi
	latexdiff --config="PICTUREENV=(?:figure|DIFnomarkup|align)[\w\d*@]*" \
		--floattype=FLOATSAFE --math-markup=off -t CTRADITIONAL \
		versions/v1.tex main.tex > diff.tex
	latexmk diff.tex

# Help message
help:
	@echo "LaTeX Makefile - Available targets:"
	@echo "  make [pdf]      - Build the main PDF"
	@echo "  make pdf-figures - Convert SVG figures to PDF"
	@echo "  make cont       - Continuous compilation (watch for changes)"
	@echo "  make clean      - Remove auxiliary files (keep PDF)"
	@echo "  make cleanall   - Remove all generated files including PDF"
	@echo "  make cleanfigs  - Remove generated figure PDFs"
	@echo "  make diff       - Generate diff PDF against versions/v1/main.tex"
	@echo "  make help       - Show this help message"