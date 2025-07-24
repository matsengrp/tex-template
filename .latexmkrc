# LaTeX build configuration for latexmk

# PDF generation via pdflatex
$pdf_mode = 1;  # 1 = pdflatex
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Bibliography handling
$bibtex_use = 2;  # Run bibtex when .bib file changes

# Default file to compile
@default_files = ('main.tex');
$recorder = 1;  # Use .fls file for better dependency tracking

# Clean up auxiliary files (in addition to standard ones)
$clean_ext = 'synctex.gz nav snm vrb bbl blg fls fdb_latexmk';

# Settings for continuous preview mode (only when -pvc is used)
$sleep_time = 1;               # Check for changes every 1 second