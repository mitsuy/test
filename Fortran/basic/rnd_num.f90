module random_num
  implicit none
  double precision,allocatable :: rnd(:,:)  ! scalor or array
  integer :: n=2,i,j


!  read(*,*)n
  allocate(rnd(n,n))
  call random_number(rnd)

  do i=1,n
     do j=1,n
        write(*,*)rnd(i,j)
     end do
  end do
end module random_num
