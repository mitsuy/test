set term x11 dashed
set term postscript enhanced color eps "Times-Roman" 25
set output "dipersion.eps"


set tics font "Helvetica,18"
#set xrange[:1.8]
set yrange[:0]
set ylabel"Q"
set xlabel"k_y"

set key left bottom
#set size square

#### Title #########

plot \
     "eq_test4.dat" w lp title  "{/Symbol t}=1.5",\
     "eq_test.dat" w lp title"{/Symbol t}=1"\
#     "eq_test2.dat" w lp title "{/Symbol t}=0.5"
#     "eq_test3.dat" w lp title "{/Symbol t}=0.01"	
