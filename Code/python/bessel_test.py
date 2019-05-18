from scipy.special import *
from scipy import integrate
import numpy as np
import math
import matplotlib.pyplot as plt

##
##  main function
##


tau=0.01 # real num
Z=1      # integer num
rho_i=np.sqrt(tau)

kr=0.
file=open('bess_test.dat','w')

for i in range(4000):
    n=0  ## Note that n should be choosen an integer number.

    x=kr*kr*0.5

    I0=iv(n,x)
    print('I_0=',I0)
    #
    # Gamma_0=I_0*exp(-0.5ky^2*rho_i^2)
    #
    G0=iv(n,x)*math.exp(-x)
    print('G0=',G0)

    file.write(str(x))
    file.write('\t')
    file.write(str(I0))
    file.write('\t')
    file.write(str(G0))
    file.write('\n')
    
    kr=kr+0.01
    
#plt.plot(x,I0)
#plt.show()
