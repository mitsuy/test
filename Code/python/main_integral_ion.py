from scipy.special import *
from scipy import integrate
import numpy as np
import math


# Initialization
tau=1.
Z=1.
zt=Z/tau
rho_i=np.sqrt(tau)
ky=37.42/np.sqrt(tau)
kr=ky*rho_i

###########  Ion integral part #####################
from integral_ion import *

s,sol=integrate.quad(prim_func,0,kr)
#s2,sol2=integrate.quad(prim_func2,0,kr)
#s3,sol3=integrate.quad(prim_func3,0,kr)
print('sol=',s)
#print('sol2=',s2)
#print('sol3=',s3)
solution=s  
s_ex,sol_ex=integrate.quad(prim_func_ex,0,kr)
print'I(tau)',s_ex
print 'hat{I(tau)}=',solution

############ Dispersin relation Eq(55) #############################

from equation import *

# for example, when consider a+bx+cx*x+d*x*x*x,
# you have to  input such as vec=np.array([a,b,c,d]).

## Initialization
beta_e=0.024
me=1./1836
ls=50
lt=0.2
omega_t=0.5*ky/lt
v_th=np.sqrt(2./me)
delta_prime=23.2*1.41/ls
beta_t=beta_e*0.5*(ls*ls/(lt*lt))
delta_t=omega_t*ls/(ky*v_th)
l=np.log(rho_i/delta_t)


a=delta_prime*rho_i/(np.pi*beta_t)
c=solution-zt/(zt+1)**2*1/np.sqrt(np.pi)*l

disper_eq=np.array([-a/c,0])
print(solve(disper_eq))
