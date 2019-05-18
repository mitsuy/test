!*****************
!2016.12.09 
!*****************

! subroutine function : calculation of elapsed time
subroutine cpu_time(time)
  real, intent(inout) :: time
end subroutine cpu_time

! Main function : gauss eliminaition
program gauss_eliminaiton
  implicit none

  integer :: i,j,k,N,maxline,l
  real(8), allocatable :: A(:,:)
  real(8), allocatable,dimension(:) :: b,x
  real(8) :: temp,al,res
  real(8) :: time_start,time_end

  print *, 'Input a Dimension:'
  read *, N
  allocate(A(N,N),b(N),x(N))

! Intialization
  A = 0.d0
  b = 0.d0
  x = 0.d0
! Measurement of calculation time
  call cpu_time(time_start)

! Input a file
  call input(N,A,b)

! Check out the input num
  call checkout(N,A,b)

! forward elimination after Pivoting
  call forward_eliminaiton(N,x,b,A)

! Backward substitution
  call backward_substitution(temp,A,b,x,N)

! Output solution on x.dat
  call output(N,x)
  
  call cpu_time(time_end)    !finished measurement of calculaiton time

  print *, 'Elapsed time was',time_end-time_start,'seconds'  !display calc time

end program gauss_eliminaiton
