from scipy.special import *
from scipy import integrate
import numpy as np
import math

# Initialization
tau=0.01
Z=1.
zt=Z/tau
rho_i=np.sqrt(tau)
ky=37.42/np.sqrt(tau)
kr=ky*rho_i

##############################################################
#
# prim_func, prim_func2 and prim_func3 caluculate the integral of
# the equations (58) in Zocco2015.
#

def prim_func(kr):
            
    n=0  
    x=kr*kr*0.5
    #
    # Gamma_0=I_0*exp(-0.5ky^2*rho_i^2)
    #
    G0=iv(n,x)*math.exp(-x)

    F=zt*(G0-1)

    G=F-1

    Q=F/G
    R=zt/(zt+1)**2 * 1/np.sqrt(np.pi) * 1/(kr+1)
    
    P=Q-zt/(zt+1)+R
    return P
#end function



############################################################
#
# prim_func_ex calculates the equation (59) in Zocco2015
#
def prim_func_ex(kr):
    # Modified Besselc funciton of the first kind of real order.
    # n : order number, ky : variable number
    n=0  ## Note that n should be choosen an integer number.
    x=kr*kr*0.5
    I0=iv(n,x)
    # print('I_0=',I0)
    
    #
    # Gamma_0=I_0*exp(-0.5ky^2*rho_i^2)
    G0=I0*math.exp(-x)
    #  print('G_0=',G0)
        
    F=zt*(G0-1)
    G=F-1

    L=F/G * 1/kr**2
    return L

#end function
