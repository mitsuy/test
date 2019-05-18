'''
 The dispersion relation of Zocco2015 (Eq.(55))
'''

from scipy.special import *
import numpy as np
import math
import sys
import matplotlib.pyplot as plt



tau=1.

if tau==1.:
    file=open('eq_test.dat','w') # File open
    if file=='\n':
        print'cant open file'
    #end if
elif tau==0.5:
    file=open('eq_test2.dat','w') # File open
    if file=='\n':
        print'cant open file'
    #end if
elif tau==1.5:
    file=open('eq_test4.dat','w') # File open
    if file=='\n':
        print'cant open file'
    #end if
#end if

file.write('#ky')
file.write('\t')
file.write('Q')
file.write('\n')

# Modified Besselc funciton of the first kind of real order.
# n : order number, ky : variable number
n=0
k_y=0.
Z=1.
rho_i=np.sqrt(tau)
zt=Z/tau



for i in range(0,10001):

    ky=k_y*k_y
    ri=rho_i*rho_i

    
    F=-zt
    '''
    else:
        I0=iv(n,0.5*ky*ri)
        #    print('I_0=',I0)

        
        G0=I0*math.exp(-0.5*ky*ri)
        #  print('G_0=',G0,'k_y=',k_y)
        
        F=zt*(G0-1)
    #end
    '''
    G=F+1
    eps=1.e-10
    if G0<eps:
        print('I0,G0,ky',I0,G0,ky)
        print('F=',F,'G=',G)
        sys.exit()
    #end if
        
    Q=F/G-zt/(zt+1)+zt/(zt+1)**2 * 1/math.sqrt(math.pi) * 1/(1+ky)

    if i%10==0:
        print('Q=',Q)
    #end if

    
    k_y=k_y+0.1


    
    file.write(str(k_y))
    file.write('\t')
    file.write(str(Q))
    file.write('\n')
#    plt.plot(k_y,Q)
#end for
file.close()
    
