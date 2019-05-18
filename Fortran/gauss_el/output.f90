subroutine output(N,x)
  implicit none
  integer, intent(in) :: N
  real(8),intent(inout) :: x(N)
  integer :: i

  open(12,file='x.dat',status='replace')
  do i=1,N
     write(12,*)x(i)
  end do
  close(12)

end subroutine output
