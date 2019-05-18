subroutine input(N,A,b)
  implicit none
  integer,intent(in) :: N
  real(8),intent(inout) :: A(N,N),b(N)
  integer :: i


  open(10,file='a.dat',status='old')
  open(20,file='b.dat',status='old')
  
  do i=1,N
     read(10,*)A(i,1:N)
  end do

  do i=1,N
     read(20,*)b(i)
  end do
  close(10)
  close(20)


end subroutine input
