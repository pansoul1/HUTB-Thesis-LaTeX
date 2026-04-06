#!/bin/bash
echo "====== HUTB Thesis Compile Script ======"
echo ""
echo "[1/4] XeLaTeX pass 1: collecting citations and labels..."
xelatex -synctex=1 -interaction=nonstopmode main.tex
echo ""
echo "[2/4] Biber: processing references.bib..."
biber main
echo ""
echo "[3/4] XeLaTeX pass 2: inserting bibliography..."
xelatex -synctex=1 -interaction=nonstopmode main.tex
echo ""
echo "[4/4] XeLaTeX pass 3: resolving cross-references..."
xelatex -synctex=1 -interaction=nonstopmode main.tex
echo ""
echo "====== Done! Output: main.pdf ======"
