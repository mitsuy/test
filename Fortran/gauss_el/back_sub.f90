subroutine backward_substitution(temp,A,b,x,N)
  implicit none
  integer,intent(in) :: N
  real(8),intent(out) :: temp
  real(8),intent(inout) :: A(N,N),b(N),x(N)
  integer :: i,j

  do i=N-1,1,-1
     temp=0.d0
     do j=i+1,N
        temp=temp + A(i,j)*x(j)
     end do
     x(i)=(b(i) - temp) / A(i,i)
  end do

end subroutine backward_substitution
