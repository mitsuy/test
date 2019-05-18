import numpy as np

# Initialization
tau=1.
Z=1.
zt=Z/tau
rho_i=np.sqrt(tau)
ky=37.42/np.sqrt(tau)
kr=ky*rho_i

def solve(vec,is_complex=False):
    dim=len(vec)
    if is_complex:
        A=np.zeros((dim,dim),dtype=complex)
    else:
        A=np.zeros((dim,dim))
    A[np.arange(dim-1),1+np.arange(dim-1)]=1
    A[-1,:]=-vec
    ans,vec=np.linalg.eig(A)
    return ans
#end def
