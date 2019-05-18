set term postscript eps enhanced color "Times-Roman" 25

set title "Numerical solution of Eq.(61) of Zocco(2015)\n {/Symbol D}{/Symbol r}_i'=-0.02"

set logscale x

set xlabel "{/Symbol n}_{ei}/{/Symbol w}_T"




set size square

#set yr[-.3:.]
#set xr[100:]


set key top left
set ylabel "{/Symbol w}_r/{/Symbol w}_T"
set output "dr_nu_neg_r.eps"
plot \
     "dr_nu_neg.dat" u 1:2   w p ps 1 pt 6 lc 7 title "Eq.(61)",\
      "dr_nu_neg.dat" u 1:6 w l lw 2 lc 0 title "Eq.(A)"\


set key bottom left
set ylabel "{/Symbol g}/{/Symbol w}_T"
set output "dr_nu_neg_i.eps"
plot \
     "dr_nu_neg.dat" u 1:3  w p ps 1 title "Eq.(61)",\
     "dr_nu_neg.dat" u 1:7 w l lw 2 lc 7 title "Eq.(A)"


     