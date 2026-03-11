import numpy as np
import number_relation as nr
g = 9.8
#=====================================================(motion)
def length_lrth (l,r,th):#(length,radius,angle)
    ans = nr.multiplication(l,r,th)
    return(ans)

def length_Sat (S,a,t):#(length,acceleration,time)
    ans = nr.twe_times_integral(S,a,t)
    return(ans)

def high_ht(h,t):#(height,time)
    ans = nr.twe_times_integral(h,9.8,t)
    return(ans)

def theta_thAt (th,A,t):#(angle,angular acceleration,time)
    ans = nr.twe_times_integral(th,A,t)
    return(ans)

def sumlength_lxyz (l,x,y,z):#(length,x,y,z)
    ans = nr.sum_of_squares(l,x,y,z)
    return(ans)    

def velocity_StV (S,t,V):#(distance,time,velocity)
    ans = nr.multiplication(S,t,V)
    return(ans)

def velocity_Vwr (V,w,r):#(velocity,angular velocity,radius)
    ans = nr.multiplication(V,w,r)
    return(ans)

def sumvelocity_Vxyz (V,x,y,z):#(velocity,x,y,z)
    ans = nr.sum_of_squares(V,x,y,z)
    return(ans)

def Angularvelocity_wt (w,t):#(angular velocity,period)
    ans = nr.multiplication(2*np.pi,w,t)
    return(ans)

def acceleration_Vta (V,t,a):#(velocity,time,acceleration)
    ans = nr.multiplication(V,t,a)
    return(ans)

def acceleration_aAr (a,A,r):#(acceleration,angular acceleration,radius)
    ans = nr.multiplication(a,A,r)
    return(ans)

def centripetalacceleration_acDw (ac,D,w):#(acceleration,circular motion diameter,angular velocity)
    ans = nr.twe_times_integral(ac,D,w)
    return(ans)

def sumacceleration_axyz(a,x,y,z):#(acceleration,x,y,z)
    ans = nr.sum_of_squares(a,x,y,z)
    return(ans)
#=====================================================(force)
def force_FMa (F,M,a):#(force,mass,acceleration)
    ans = nr.multiplication(F,M,a)
    return(ans)

def sumforce_Fxyz (F,x,y,z):#(force,x,y,z)
    ans = nr.sum_of_squares(F,x,y,z)
    return(ans)

def torque_TFr (T,F,r):#(torque,force,radius)
    ans = nr.multiplication(T,F,r)
    return(ans)

def torque_TIA (T,I,A):#(torque,rotational inertia,angular acceleration)
    ans = nr.multiplication(T,I,A)
    return(ans)

def momentum_PMV (P,M,V):#(momentum,mass,velocity)
    ans = nr.multiplication(P,M,V)
    return(ans)

def Angularmomentum_LIw (L,I,w):#(angular momentum,rotational inertia,angular velocity)
    ans = nr.multiplication(L,I,w)
    return(ans)
#=====================================================(energy)
def work_WFx (W,F,x):#(work,force,deplacement)
    ans = nr.multiplication(W,F,x)
    return(ans)

def energy_EhMg (E,h,Mg):#(energy,height,weight)
    ans = nr.multiplication(E,h,Mg)
    return(ans)

def energy_EMV (E,M,V):#(energy,mass,velocity)
    ans = nr.multiplication(E,M,V)
    return(ans)

def energy_Ekx (E,k,x):#(energy,spring constant,displacement)
    ans = nr.twe_times_integral(E,k,x)
    return(ans)

def power_PFV (P,F,V):#(power,force,velocity)
    ans = nr.multiplication(P,F,V)
    return(ans)

def power_PTw (P,T,w):#(power,torque,angular velocity)
    ans = nr.multiplication(P,T,w)
    return(ans)

def power_EPt (E,P,t):#(energy,power,time)
    ans = nr.multiplication(E,P,t)
    return(ans)
#=====================================================(stress)
def deformation_Fkx (F,k,x):#(force,elastic modulus,deformation)
    ans = nr.multiplication(F,k,x)
    return(ans)

def avgstress_FPA (F,P,A):#(force, pressure, area)
    ans = nr.multiplication(F,P,A)
    return(ans)
    
def avgshear_FVA (F,V,A):#(force, shear force, area)
    ans = nr.multiplication(F,V,A)
    return(ans)
#=====================================================(other)
def friction_fuN (f,u,N):#(friction,friction coefficient,normal force)
    ans = nr.multiplication(f,u,N)
    return(ans)

def density_MVD (M,D,V):#(mass,density,volume)
    ans = nr.multiplication(M,D,V)
    return(ans)