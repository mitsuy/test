!############################################################
!       The code for solving the Eq.(61) of zocco(2015)     #
!       with  Newton method.                                #
!                                                           #
!             7 Aug 2018  20:26                             #
!            Written by M.Yagyu                             #
!                                                           #
!        Modified:                                          #
!                  8 Aug 2018 11:15  by M.Yagyu             #
!                 13 Aug 2018 15:20  by M.Yagyu             #
!                 22 Aug 2018 15:01  by M.Yagyu             #
!                                                           #
!############################################################




!##################################################################
!     fx is the devivated func based on Eq.(61) of Zocco(2015).   #
!##################################################################
function fx(omega,xi)
  implicit none
  complex(8) :: fx
  complex(8) ::omega,xi

  fx=4*omega**3 -4*omega**2 + omega - xi
  return
end function fx

!###########################################################
!     gx is the derivative func of fx for newton method.   #
!###########################################################
function gx(omega)

  implicit none
  complex(8) :: gx
  complex(8) ::omega

  gx=12*omega**2 - 8*omega + 1
  return
end function gx



!#############################################
!        Main program                        #
!#############################################

program main

  implicit none
  integer :: i=0,j,l,mode
  complex(8) :: f,g,fx,gx  ! function
  complex(8) :: omega_old,omega_new,xi
  real(8) :: omega_t,pi,nu_e,delta_st,beta_t
  real(8) :: Dprim
  real(8) :: ls,lt,dlt,ky,beta_e,v_th
  real(8) :: me,mi,delt_nu,temp_e,temp_i,rho_e,rho_i
  real(8) :: omega_r,gamma,S_eta,rho_s,va,tau,de,eta,omega_a,omega_test
  real(8),parameter :: eps=1.e-6
  complex(8),parameter :: ic=cmplx(0d0,1d0)
  complex(8) :: omega1,omega2

  ! Input parameter
  namelist/params/me,mi,temp_e,temp_i,nu_e,ls,lt,beta_e,ky,omega_old
  open(11,file="params.in")
  read(11,nml=params)
  close(11)

  
  pi=4.*atan(1.)
  delt_nu=0.001
  
  ! Initial values
!  nu_e=18.       !  collision freq. for electron-ion.
!  ls=1.         ! plasma scale length.
!  lt=1.e-3         ! electron temp. gradient scale length.
!  beta_e=0.1    ! the electron plasma beta.
!  ky=1.e-4       ! the wave number for y direction.
!  me=.01        ! electron mass  
!  temp_e=1.     ! electron temperature
  
  de=sqrt(me/beta_e)           ! the electron inertia length
  tau=temp_i/temp_e            ! temp. ratio. 
  v_th=sqrt(2*temp_e/me)       ! the electron thermal speed.
  rho_e=sqrt(me*temp_e)        ! the electron Larmor radius.
  rho_i=sqrt(mi*temp_i)        ! the ion Larmor radius.
  rho_s=sqrt(1./tau)*rho_i    ! Ion sound Larmor radius.
  va=v_th/sqrt(beta_e)         ! Alfven speed.
  omega_a=va*ky                ! Alfven freq.
 


  print *,'va=',va
  print *,'omega_a=',omega_a

  
  ! Initialization
 ! omega_old=(1,0)
  !  print*,'Input initial value of omega'
  ! read *, omega_old

  
  


  ! File open
  open(10,file='dr_nu_neg.dat',status='replace')
  write(10,'(7a20)')'nu_e/omega_T','omega_r','omega_i','omega1_r','omega1_i','omega2_r','omega2_i'

  open(20,file='dr_nu_pos.dat',status='replace')
  write(20,'(5a20)')'nu_e/omega_T','omega_r','omega_i','omega1_r','omega1_i'



  
  ! Definition
  omega_t=0.5*ky*v_th*rho_e / lt               ! the diamag. drift freq. by the ele. temp. grad. .
  print *,'omega_T=',omega_t
  beta_t=.5*beta_e*(ls*ls/(lt*lt))  
  delta_st=omega_t/(ky*v_th)*ls     ! delta_*



  
  if(ky*ls<1)then
     Dprim=2*sqrt(1-ky*ls*ky*ls)*tan(0.5*pi*sqrt(1-ky*ls*ky*ls))/ls
  else
!          Dprim=-2*ky  
     Dprim=-2*sqrt(ky*ls*ky*ls-1)/ls
  end if


  
  l=(nu_e)/delt_nu+1

  
  
  do j=1,l


     eta=de*de*nu_e               ! Spiter ? resistivity.
     S_eta=va*ls/eta              ! the Lundquist number    


     

     xi=exp(-ic*0.5*pi)*2.*nu_e/omega_t * delta_st**2/(pi**2*beta_t**2)*6*Dprim**2
 !    print *,'xi=',xi
 !    print*, ''

        
     
     do

        ! function
        f=fx(omega_old,xi)
        g=gx(omega_old)


        
 !       print *,'omega',i,'=',omega_old
        omega_new=omega_old-f/g


        
        if(abs((omega_new-omega_old)/omega_new) < eps)then
 !          print *,''
           print *,'The solution is omega=',omega_new
           exit
        end if

        
        omega_old=omega_new
        i=i+1  ! For what ?

     end do

     if(Dprim > 0)then


        !########### Eq.(64),(65),(66) of Zocco(2015)##########
        gamma=(nu_e/omega_t)**(1./3) * delta_st**(2./3)*(Dprim/(pi*beta_t))**(2./3)
        omega_r=1./3
        !        gamma=3**(1./3)*(ky*ls)**(2./3)*S_eta*(Dprim*rho_s*0.5/pi)**(2./3)
!        gamma=3.**(1./3)*(ky*ls)**(2./3)*S_eta**(-1./3)*(Dprim*rho_e*0.5/pi)**(2./3)


        
!        omega_test=imag(omega_new)*(omega_t/omega_a)

        
        write(20,'(5f20.5)')nu_e/omega_t,real(omega_new),imag(omega_new),omega_r,gamma

        
     else

        
        !########## Eq.(A)' of my note (2018-8-6). ##########
        !    omega1=0.5+2./pi*sqrt(3.)*(ky*delta_st/beta_t)*sqrt(2.*nu_e/omega_t)*exp(-ic*pi/4.)*(1/omega_t)
        !########### Eq.(f)' of my note(2018-8-6) ##########
        omega2=0.5+2./pi*sqrt(3.)*(ky*delta_st/beta_t)*sqrt(2.*nu_e/omega_t)*exp(-ic*pi/4.)

        
        write(10,'(7f20.5)')nu_e/omega_t,real(omega_new),imag(omega_new),real(omega1),imag(omega1),real(omega2),imag(omega2)


        
     end if
        

     nu_e=nu_e+delt_nu*1000

     
  end do


  
    print *,'Da=',Dprim*ls

  
  close(10)
  close(20)

end program main


