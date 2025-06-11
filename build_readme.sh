#!/bin/sh
# Build README.md from README.tex using pandoc
pandoc README.tex -f latex -t gfm -o README.md
