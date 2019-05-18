  !
  !  Multiplication table program
  !  Written by M.yagyu
  !

program multi
  implicit none
  
  integer :: i,j
  integer :: n

  print*,'Input a integer number;'
  read(*,*)n
  
  do i=1,n
     do j=1,n
        write(*,fmt='(i4)',advance='no')i*j
     end do
     write(*,*)''
  end do
  

end program multi
  
