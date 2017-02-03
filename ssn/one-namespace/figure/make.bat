echo off
del "*.aux"
del "*.log"
del "*.out"
del "*.fdb_latexmk"
del "*.fls"
del "*.dvi"
for %%f in (*.tex) do (
  set "N=%%f"
  latexmk %%~nf
  dvipdfm %%~nf.dvi
  magick -density 300 %%~nf.pdf -quality 90 %%~nf.png

)
del "*.aux"
del "*.log"
del "*.out"
del "*.fdb_latexmk"
del "*.fls"
del "*.dvi"
