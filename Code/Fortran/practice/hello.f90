!
! Test for fortran compiler
!

program hello

  implicit none
  
  integer :: i

  do i=1,10
     print *,"hello,world"
  end do

end program hello
