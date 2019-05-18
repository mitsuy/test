set term postscript eps enhanced color "Times-Roman" 25

set title "Collison frequency dependence:{/Symbol D}a'=0.405"

set logscale x


set xlabel "{/Symbol n}_{ei}/{/Symbol w}_T"
set ylabel "{/Symbol w}/{/Symbol w}_T"

set key top out
set size square


set output "dr_nu_smallpos.eps"

set yr[-.1:1]
set xr[:200]
plot \
     "dr_nu_pos.dat" u 1:2   w p ps 2 pt 6 lc 7 title "{/Symbol w}_r of Eq.(61)",\
     "dr_nu_pos.dat" u 1:3  w p ps 2 title "{/Symbol g} of Eq.(61)",\
     "dr_nu_pos.dat" u 1:4 w l lw 2 lc 0 title "{/Symbol w}_r of Eq.(65)",\
     "dr_nu_pos.dat" u 1:5 w l lw 2 lc 7 title "{/Symbol g} of Eq.(64)"\




     
     
     