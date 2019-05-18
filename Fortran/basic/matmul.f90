!
!   Matrix multiplication
!
!   Written by M.Yagyu
!

program matmal
!  use random_num
  
  implicit none
  
  real,allocatable,dimension(:,:) :: a,b,c
  integer :: i,j,k,tmp
  integer(4) :: n

  print*,''
  write(*,fmt='(a35)',advance='no')'Please input dimension number N : '
  read(*,*)n
  write(*,*)''
  write(*,'(a10,i2,a2,i2,a40)')'Calculate' ,n,'*',n, 'matrix multiplication (regular matrix).'
  write(*,*)''

  allocate(a(n,n),b(n,n),c(n,n))
  
100 format(a2,i1,a1,i1,a2)
  
!!! Initializaiton of array a and b.
  do i=1,n
     do j=1,n
        write(*,100,advance='no')'a(',i,',',j,')='
        read(*,*)a(i,j)
     end do
  end do
  
  write(*,*)''
  
  do i=1,n
     do j=1,n
        write(*,100,advance='no')'b(',i,',',j,')='
        read(*,*)b(i,j)
     end do
  end do


!!! Display components of array a and b !!!
!  do i=1,n
!     do j=1,n
!        write(*,*)a(i,j),b(i,j)
!     end do
!  end do



!!! Display the result !!!
  write(*,*)''
  write(*,*)'Calculate c_{ij}=Sigma_{k} (a_{ik}*b_{kj})'
  write(*,*)''

  write(*,*)'Results of calculation'
  write(*,*)''




  do i=1,n
    
     do j=1,n
        
        c(i,j)=0.
        
        do k=1,n
           c(i,j)=a(i,k)*b(k,j)+c(i,j)

        end do
        write(*,'(a3,i1,a1,i1,a2,f6.2)',advance='no')' c(',i,',',j,')=',c(i,j)

     end do
     write(*,*)''
  end do

  write(*,*)''
end program matmal
