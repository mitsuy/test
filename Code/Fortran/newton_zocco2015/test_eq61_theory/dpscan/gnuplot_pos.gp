set term postscript eps enhanced color "Times-Roman" 25

set title "Numerical solution of Eq.(61) of Zocco(2015)\n {/Symbol D}a'=14"

set logscale 
set format  "10^{%L}"

set xlabel "{/Symbol D}'{/Symbol r}_i"
set ylabel "{/Symbol w}/{/Symbol w}_T"

set key top out
set size square


set output "dr_nu_pos.eps"

#set yr[:5]
#set xr[0.01:10000]
plot \
     "Dprimscan_pos.dat" u 1:2   w p ps 2 pt 6 lc 7 title "{/Symbol w}_r(Eq.(61))",\
     "Dprimscan_pos.dat" u 1:3  w p ps 2 title "{/Symbol g}(Eq.(61))",\
     "Dprimscan_pos.dat" u 1:4 w l lw 2 lc 0 title "{/Symbol w}_r(Eq.(A))",\
     "Dprimscan_pos.dat" u 1:5 w l lw 2 lc 7 title "{/Symbol g}(Eq.(A))",\
     0.5 w l dt(10,3) lc 1 lw 2 title"1/2"
#     "dr_nu.dat" u 1:4 w l title "{/Symbol w}_r(zocco)",\
#    "dr_nu.dat" u 1:5 w l title "{/Symbol g}(zocco)",\



     
     
     