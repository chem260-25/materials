# A small gnuplot example script
set term pngcairo fontscale 2 linewidth 3 size 1680,1050
set output 'example.png'
set xlabel 'x-axis'
set ylabel 'y-axis'
set title 'A Plot'
set key top right  # Legend at top right
set label 'Hello' at 5,0.004
set label 'Hi!' at 5.15,0.004 textcolor "blue"
set xrange [4.3:6]
set yrange [-0.006:0.012]
set grid  # Sets grid in the background
plot 'data' using 1:($2 * 2) with linespoints linewidth 2 pointtype 4 title 'Data points',\
     'data' using 1:(-$2) with linespoints linewidth 1 pointtype 7 title 'Modified data points',\
     log(x)/exp(x) title 'log_{10}(x)/e^x'
#pause -1
