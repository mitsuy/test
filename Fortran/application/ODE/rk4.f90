!-----------------------------------------------!
!-----------------------------------------------!
!   Written by M.Yagyu, 5 June 2018 15:52
!
!   Runge-Kutta method
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
     write(*,*)x0,y0,z0

     !! Update
     y0=yn;z0=zn;x0=xn
  end do
end subroutine runge_kutta
