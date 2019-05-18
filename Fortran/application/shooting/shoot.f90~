!
!     
!     ODE: y" - 6y^2 + x = 0
!  

!!              !!
!! Equation (i) !!
!!              !!
real(8) function f(x0,y0,z0)
  implicit none
  real(8),intent(in) :: x0,y0,z0
  f=6*y0*y0-x0
end function f

!!               !!
!! Equation (ii) !!
!!               !!
real(8) function g(x0,y0,z0)
  implicit none
  real(8),intent(in) :: x0,y0,z0
  g=z0
end function g




program shoot
  implicit none

  integer :: i,n,l
  real(8) :: x0=0.
  real(8) :: y0=1.,y_out=5.,x_out=1.
  real(8) :: z0(2)
  real(8) :: x_old,x_new,y_old,y_new,z_old,z_new
  real(8),parameter :: eps=1.e-3,eps2=1.e-8
  real(8) :: dx,phi_old=0.,phi_new=0.

!     delta x
 !   dx=1./3
  dx=0.001
 ! print *,dx
  
!  l=int(x_out / dx)+1

  
!     Initial values
  z0(1)=1.2
  z0(2)=1.5

  open(10,file='test4.dat',status='replace')
   
  do i=1,2
     
     
     z_old=z0(i)
     x_old=x0
     y_old=y0

     x_new=0.
     x_old=0.
     
     do n=1,1000

        write(10,*)x_old,y_old

        if(abs(x_new-x_out)<eps)then
           
           phi_new=y_new-y_out
           print *,'phi=',phi_new
           print *,'yn=',y_new
           exit
           phi_old=phi_new                   
        end if
        
        ! Explicit Euler method
!        z_new=z_old+dx*(6*y_old*y_old-x_old)
!        y_new=y_old+dx*z_old

        call runge_kutta(x_old,y_old,z_old,dx)
        
  !      print *,'x=',x_new
                
        x_new=dx+x_new
        
!        x_old=x_new
!        y_old=y_new
!        z_old=z_new
 !       n=n+1
     end do
     write(10,*)''
  end do
  

  n=0
  
  z_old=z0(1)
  z_new=z0(2)
 
 ! print *,'phi_0=',phi_new
  
  !  do while(abs(phi_new-y_out)<eps2)
  do 

     x_new=0.
     x_old=x0
     y_old=y0
     
     write(*,*)' '

     z_new=z_new-(z_new-z_old)/(phi_new-phi_old)*phi_new
     print *, 'z0=',z_new
     
     z0(1)=z0(2)
     z0(2)=z_new
     

     phi_old=phi_new
     z_old=z_new

     do 

        ! output to file
        write(10,*)x_old,y_old
        if(abs(x_new-x_out)<eps)then

           phi_new=y_new-y_out
           print *,'phi_0=',phi_old
           print *,'yn=',y_new
           
           exit
        end if

! ******  EEM ***********************
        
!        z_new=z_old+dx*(6*y_old*y_old-x_old)
!        y_new=y_old+dx*z_old
!        print *,'yn=',y_new
        call runge_kutta(x_old,y_old,z_old,dx)
!        x_new=dx+x_new

!        x_old=x_new
!        y_old=y_new
!        z_old=z_new

        n=n+1
        
     end do
     
     write(10,*)''
     
     if(abs(y_new-y_out)<eps2)then
        print *,'y_out_ext=',y_out
        print *,'y_out_num=',y_new
        !        stop
        exit
     end if
     

     z_old=z0(1)
     z_new=z0(2)
     
  end do
  

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  z_old=z_new
  x_new=0.
  x_old=x0
  y_old=y0
  open(30,file='ode.dat',status='replace')
  n=0
  do n=1,2000


     ! output to file
     write(30,*)x_old,y_old
     
     z_new=z_old+dx*(6*y_old*y_old-x_old)
     y_new=y_old+dx*z_old
!        print *,'yn=',y_new

!     x_new=dx+x_new

     x_old=x_new
     y_old=y_new
     z_old=z_new


  end do

  close(10)
  close(30)

end program shoot
