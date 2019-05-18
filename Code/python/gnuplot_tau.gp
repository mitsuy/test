set term x11 dashed
set term postscript enhanced color eps "Times-Roman" 25
set output "tau_depend.eps"

set format x "10^{%L}"
set tics font "Helvetica,18"
#set xrange[:1.8]
set yrange[-1:1]
set ylabel"~I{0.8-}({/Symbol t})"
set xlabel"{/Symbol t}"
set logscale x
set key left  top
set size square

#### Title #########

plot \
     "tau_dp.dat" u 1:3 w p ps 2 pt 3 lc 1 \
     notitle "",\
     sqrt(x) w l dt(10,3) lc 7 title"{/Symbol t}^{1/2}",\
     -sqrt(x) w l dt(30,15) lc 4 title"{/Symbol t}^{-1/2}"



