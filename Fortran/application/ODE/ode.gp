set term postscript eps enhanced color "Times-Roman" 30

set title "Ordinary Differential Equation solver"

set xlabel "x"
set ylabel "y"

set output "ode.eps"
set key top right


plot \
     "expEuler.dat" w p pt 2 ps 2 lc 2title"expEuler",\
     "rk4.dat" w p pt 6 ps 2 lc 7 title"Runge-Kutta"