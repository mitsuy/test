# Compiling Gaussian eliminaiton

FC = gfortran

TARGET = ./gauss.out

$(TARGET):	gauss.f90 back_sub.f90 co.f90 forward_el.f90 input.f90 output.f90
	$(FC) -o gauss.out gauss.f90 input.f90 co.f90 forward_el.f90 back_sub.f90 output.f90

clean:
	rm  *.out *~
