!
!  dy/dx = -y - 5z  ...(i)
!  dz/dx = 4y - 3z  ...(ii)
!
!  This program is the code which numerically solve
!  the Eqs (i) and (ii) by explicit Euler method.
!
!  Written by M.Yagyu, 5 June 2018 15:52
! 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

!!              !!
!! Equation (i) !!
!!              !!
real(8) function f(x0,y0,z0)
  implicit none
  real(8),intent(in) :: x0,y0,z0
  f=-y0-5.*z0
end function f

!!               !!
!! Equation (ii) !!
!!               !!
real(8) function g(x0,y0,z0)
  implicit none
  real(8),intent(in) :: x0,y0,z0
  g=4.*y0-3.*z0
end function g

!!   
!!   Main
!!
program exp_euler_main
  implicit none
  integer :: mode=0
  real(8) :: x0,y0,z0
  real(8) :: dx    !!! delta width delta_x

  !! Initialization
  x0=0;y0=1;z0=0
  dx=.1e0

  print *,'WHICH METHODS DO YOU USE?'
  print *,'EXPLICIT EULER => 1'
  print *,'   RUNGE-KUTTA => 2'
  read *,mode

  !!
  !!  variation of numerical methods
  !!
  if(mode == 1)then
     call exp_euler(x0,y0,z0,dx)
  else if(mode == 2)then
     call runge_kutta(x0,y0,z0,dx)
  end if

contains

  !-----------------------------------------------!
  !-----------------------------------------------!
  !!
  !!  Explicit Euler method(mode==1)
  !!
  
  subroutine exp_euler(x0,y0,z0,dx)
      implicit none
      integer :: i,nmax=30
      real(8),intent(inout) :: x0,y0,z0
      real(8),intent(in) :: dx
      real(8) :: xn=0.,yn=0.,zn=0.
      real(8) :: f,g

      !! File operator
      open(10,file='expEuler.dat',status='replace')

      !! Main calculations
      do i=1,nmax

         yn=y0+dx*f(x0,y0,z0)
         zn=z0+dx*g(x0,y0,z0)
         xn=x0+dx
         
         !! Display caluculated data
         write(10,*)x0,y0,z0
         write(*,'(3e15.2)')x0,y0,z0
         
         !! Update
         y0=yn;z0=zn;x0=xn
      end do
    end subroutine exp_euler

    !-----------------------------------------------!
    !-----------------------------------------------!
    !
    !   Runge-Kutta method (mode==2)
    !
    subroutine runge_kutta(x0,y0,z0,dx)
      implicit none
      integer :: j,nmax=30
      real(8),intent(inout) :: x0,y0,z0
      real(8),intent(in) :: dx
      real(8) :: xn=0.,yn=0.,zn=0.
      real(8) :: k1(2),k2(2),k3(2),k4(2)
      real(8) :: f,g
      
      !! File operator
      open(20,file='rk4.dat',status='replace')

      !! Main caluculations
      do j=1,nmax
         k1(1)=f(x0,y0,z0)
         k1(2)=g(x0,y0,z0)

         k2(1)=f(x0+0.5*dx,y0+0.5*dx*k1(1),z0+0.5*dx*k1(2))
         k2(2)=g(x0+0.5*dx,y0+0.5*dx*k1(1),z0+0.5*dx*k1(2))

         k3(1)=f(x0+0.5*dx,y0+0.5*dx*k2(1),z0+0.5*dx*k2(2))
         k3(2)=g(x0+0.5*dx,y0+0.5*dx*k2(1),z0+0.5*dx*k2(2))

         k4(1)=f(x0+dx,y0+dx*k3(1),z0+dx*k3(2))
         k4(2)=g(x0+dx,y0+dx*k3(1),z0+dx*k3(2))

         yn=y0+dx*(k1(1)+2*k2(1)+2*k3(1)+k4(1))/6
         zn=z0+dx*(k1(2)+2*k2(2)+2*k3(2)+k4(2))/6
         xn=x0+dx
         
         !! Display caluculated data
         write(20,*)x0,y0,z0
         write(*,'(3e15.2)')x0,y0,z0

         !! Update
         y0=yn;z0=zn;x0=xn
      end do
    end subroutine runge_kutta
    
end program exp_euler_main
