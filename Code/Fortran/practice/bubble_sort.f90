!
!  Bubble sort
!   Written by m.yagyu
!


program bubble

  implicit none

  integer :: i,j
  real :: height(5)
  real :: dammy,max,min
  
  !  Initialization
  do i=1,5
     height(i)=0.e0
  end do
  ! Input height data  
  print *,'Input height data.'
  do i=1,5
     read(*,*)height(i)
  end do
  write(*,*)'---------------'
  ! Data of before sorting.
  write(*,*)'Before sort.'
  do i=1,5
     write(*,'(f6.1)')height(i)
  end do

  !max=height(1)
  !min=height(1)
  dammy=0.e0
  ! Place data in descending order in height
  do i=1,5
     do j=1,5
        if(height(j+1)>height(j))then
           dammy=height(j+1)
           height(j+1)=height(j)
           height(j)=dammy           
        end if
     end do
  end do
    ! Data of after sorting.
  write(*,*)'after sort.'
  do i=1,5
     write(*,'(f6.1)')height(i)
  end do
  
end program bubble
