set size square
set pm3d map interpolate 4,4 # Uses heatmaps and interpolate the data
set palette rgbformulae 22,13,-31 # Changes the colormap
set ylabel 'omega emission'
set xlabel 'omega abs'
set title "A 2D spectrum"
splot "<awk -f addblanks.awk  main_out" u (-$1):2:(asinh($3)) notitle
pause -1
