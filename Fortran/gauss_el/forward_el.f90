subroutine forward_eliminaiton(N,x,b,A)

  implicit none
  integer, intent(in) :: N
  real(8),intent(inout) :: x(N),b(N),A(N,N)
  integer :: i,j,k,maxline,l
  real(8) :: res,al
  res=0.d0
  al=0.d0

  do k=1,N-1
     !Pivoting-------------------
     maxline=k
     do i=k+1,N
        if(abs(A(i,k)) > abs(A(maxline,k)))then
           maxline=i
        end if
        do l=1,N
           res=A(k,l)
           A(k,l)=A(maxline,l)
           A(maxline,l)=res
        end do
        res=b(k)
        b(k)=b(maxline)
        b(maxline)=res
     end do
!finished Pivoting-----------------
     do i=k+1,N
        al = A(i,k) / A(k,k)
        do j=k+1,N
           A(i,j) = A(i,j) - al*A(k,j)
        end do
        b(i) = b(i) - al*b(k)
     end do
  end do

  x(N) = b(N) / A(N,N)

end subroutine forward_eliminaiton
