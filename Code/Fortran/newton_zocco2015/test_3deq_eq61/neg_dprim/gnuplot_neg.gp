set term postscript eps enhanced color "Times-Roman" 25

set title "Numerical solution of Eq.(61) of Zocco(2015)\n {/Symbol D}'{/Symbol r}_i=-0.08"

set logscale x

set xlabel "{/Symbol n}_{ei}/{/Symbol w}_T"
set ylabel "{/Symbol w}/{/Symbol w}_T"

set output "num_theory.eps"
set key top out
set size square

#set yr[-.3:.]
set xr[:100]
plot \
     "dr_nu_neg.dat" u 1:2  w p ps 1 pt 6 lc 7 title "{/Symbol w}_r of Eq.(61)",\
     "dr_nu_neg.dat" u 1:3  w p ps 1 title "{/Symbol g} of Eq.(61)",\
     "theory.dat" u 1:2 w l lw 2 lc 1 title "sol 1 {/Symbol w}_r",\
     "theory.dat" u 1:3 w l lw 2 lc 2 title "sol 1 {/Symbol g} ",\
     "theory.dat" u 1:4 w l lw 2 lc 3 title "sol 2 {/Symbol w}_r",\
     "theory.dat" u 1:5 w l lw 2 lc 4 title "sol 2 {/Symbol g} ",\
     "theory.dat" u 1:6 w l lw 2 lc 8 title "sol 3 {/Symbol w}_r",\
     "theory.dat" u 1:7 w l lw 2 lc 7 title "sol 3 {/Symbol g} "
     

     
     