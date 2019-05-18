set term postscript eps enhanced color "Times-Roman" 30

set title "Ordinary Differential Equation solver"

set xlabel "x"
set ylabel "y"

set output "shoot1.eps"
set key top left
set title'{/Symbol D}x=0.1'

plot \
     "test1.dat"  every :::0::0 w lp ps 2 notitle,\
     "test1.dat"  every :::1::1 w lp ps 2 notitle,\
     "test1.dat"  every :::2::2 w lp ps 2 notitle,\
     "test1.dat"  every :::3::3 w lp ps 2 notitle,\
     "test1.dat"  every :::4::4 w lp ps 2 notitle,\
     "test1.dat"  every :::5::5 w lp ps 2 notitle,\
     5 dt(10,3) title'y=5'

set output "shoot2.eps"
set key top left
set title'{/Symbol D}x=1/3'

plot \
     "test2.dat"  every :::0::0 w lp ps 2 notitle,\
     "test2.dat"  every :::1::1 w lp ps 2 notitle,\
     "test2.dat"  every :::2::2 w lp ps 2 notitle,\
     "test2.dat"  every :::3::3 w lp ps 2 notitle,\
     "test2.dat"  every :::4::4 w lp ps 2 notitle,\
     "test2.dat"  every :::5::5 w lp ps 2 notitle,\
     5 dt(10,3) title'y=5'

set output "shoot3.eps"
set key top left
set title'{/Symbol D}x=0.01'
set xr[0.5:1.2]

plot \
     "test3.dat"  every 10:::0::0 w lp ps 2 notitle,\
     "test3.dat"  every 10:::1::1 w lp ps 2 notitle,\
     "test3.dat"  every 10:::2::2 w lp ps 2 notitle,\
     "test3.dat"  every 10:::3::3 w lp ps 2 notitle,\
     "test3.dat"  every 10:::4::4 w lp ps 2 notitle,\
     "test3.dat"  every 10:::5::5 w lp ps 2 notitle,\
     "test3.dat"  every 10:::6::6 w lp ps 2 notitle,\
     "test3.dat"  every 10:::7::7 w lp ps 2 notitle,\
     "test3.dat"  every 10:::8::8 w lp ps 2 notitle,\
     "test3.dat"  every 10:::9::9 w lp ps 2 notitle,\
     5 dt(10,3) title'y=5'

set output "shoot4.eps"
set key top left
set title'{/Symbol D}x=0.001'
set xr[0.5:1.2]

plot \
     "test4.dat"  every 10:::0::0 w lp ps 2 notitle,\
     "test4.dat"  every 10:::1::1 w lp ps 2 notitle,\
     "test4.dat"  every 10:::2::2 w lp ps 2 notitle,\
     "test4.dat"  every 10:::3::3 w lp ps 2 notitle,\
     "test4.dat"  every 10:::4::4 w lp ps 2 notitle,\
     "test4.dat"  every 10:::5::5 w lp ps 2 notitle,\
     "test4.dat"  every 10:::6::6 w lp ps 2 notitle,\
     "test4.dat"  every 10:::7::7 w lp ps 2 notitle,\
     "test4.dat"  every 10:::8::8 w lp ps 2 notitle,\
     "test4.dat"  every 10:::9::9 w lp ps 2 notitle,\
     5 dt(10,3) title'y=5'