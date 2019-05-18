set term postscript eps enhanced color "Times-Roman" 25

set title "Numerical solution of Eq.(61) of Zocco(2015)\n {/Symbol D}a'=-0.402"

set logscale x

set xlabel "{/Symbol n}_{ei}/{/Symbol w}_T"
set ylabel "{/Symbol w}/{/Symbol w}_T"

set output "dr_nu_neg.eps"
set key top out
set size square

#set yr[-.3:.]
set xr[:100]
plot \
     "dr_nu_neg.dat" u 1:2   w p ps 2 pt 6 lc 7 title "{/Symbol w}_r of Eq.(61)",\
     "dr_nu_neg.dat" u 1:3  w p ps 2 title "{/Symbol g} of Eq.(61)",\
      "dr_nu_neg.dat" u 1:6 w l lw 2 lc 0 title "{/Symbol w}_r(theo)",\
     "dr_nu_neg.dat" u 1:7 w l lw 2 lc 7 title "{/Symbol g}(theo)"\
#     "dr_nu.dat" u 1:4 w l title "{/Symbol w}_r(zocco)",\
#    "dr_nu.dat" u 1:5 w l title "{/Symbol g}(zocco)",\

     
     