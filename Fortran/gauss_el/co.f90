subroutine checkout(N,A,b)

  implicit none
  integer,intent(in) :: N
  real(8),intent(inout) :: A(N,N),b(N)
  integer :: i,j

print *, 'coefficient matrix A'
  do i=1,N
     print *,(A(i,j),j=1,N)
     
  end do

  print *,'constat vector b'
  do i=1,N
     print *,b(i)
  end do

end subroutine checkout
