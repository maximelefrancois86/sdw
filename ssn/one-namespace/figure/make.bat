echo off
for %%f in (*.tex) do (
  set "N=%%f"
  pdflatex %%~nf.tex
  magick -density 300 %%~nf.pdf -quality 90 %%~nf.png
)
