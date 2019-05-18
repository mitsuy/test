  !
  !  How not to begin a new line
  !   with Fortran
  !

program advance
  implicit none

  integer :: i

  integer,parameter :: n=7

  do i=1,n
     write(*,fmt='(i4)',advance='no')i
  end do
  write(*,*)

end program advance
