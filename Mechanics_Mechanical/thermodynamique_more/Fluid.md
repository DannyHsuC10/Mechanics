---
layout: base
---

# Fluid

## Velocity of flow

$$\dot m = \rho VA$$

$$\dot V = VA = \dot m/\rho$$

## Liquid pressure

$$P = \rho gh+P_{1atm}$$

$$\frac{P_1}{A_1} = \frac{P_2}{A_2}$$

## Flow work

$$W/m = H+E_{int}+K=Q+PV+\frac{v^2}2+gh $$

## Humidity

* mass of water vapor : $m_v$
* mass of air : $m_a$
* Maximum water vapor mass capacity : $m_g$
* Absolute humidity : $\omega$
* Air saturation humidity : $\omega_2$
* Relative humidity : $\phi$
$$\omega = \frac{m_v}{m_a} = \frac{0.622P_v}{P-P_v}$$

$$\omega_2 = \frac{C_P(\Delta T)+\omega H_v}{H_a-H_v}$$

$$\phi = \frac{m_v}{m_g} = \frac{P_v}{P_g} = \frac{\omega P}{(0.622+\omega)P_g}$$

## Enthalpy(air)

* dry
$$H_{\text{dryair}} = C_P\Delta T = 1.005kJ/kg\cdot^oC\Delta T $$
* humid
$$H_{\text{humidair}} = H_{\text{dryair}}+\omega H_v$$

## Stagnant fluid

Convert all kinetic energy into heat
$$H_0 = H+\frac{v^2}{2}$$

$$T_0 = T+\frac{v^2}{2C_P}$$

$$\frac{P_0}{P} = (\frac{T_0}{T})^{1/(\gamma-1)}$$

## Speed of sound

The speed of a very small pressure wave in a medium is the speed of sound.

* Static density : $\rho_0$
* Particle moving speed : $u$
* Conservation of mass(Density and velocity remain constant)
$$\frac{\partial \rho}{\partial t}+\rho_0\frac{\partial u}{\partial x} = 0$$
* Conservation of Momentum(Acceleration equals gradient pressure)
$$\rho_0\frac{\partial u}{\partial t} = -\frac{\partial P}{\partial x}$$

$$\frac{\partial \rho}{\partial t}-\frac{\partial^2 P}{\partial x^2}dt = 0$$

$$\frac{\partial \rho}{\partial t} = \frac{\partial^2 P}{\partial x^2}dt$$

$$\frac{\partial x^2}{\partial t^2} = \frac{\partial^2 P}{\partial \rho}$$

$$v_s = \sqrt{(\frac{\partial P}{\partial \rho})_s}$$

$$P = C\rho^\gamma$$

$$\gamma = \frac{C_P}{C_V}$$

$$(\frac{\partial P}{\partial \rho})_s = \gamma\frac P\rho$$

$$PV = nRT$$

$$P = \rho RT$$

$$(\frac{\partial P}{\partial \rho})_s = \gamma\frac {\rho RT}\rho$$

$$(\frac{\partial P}{\partial \rho})_s  = \gamma RT$$

$$v_s = \sqrt{(\frac{\partial P}{\partial \rho})_s} = \sqrt{\gamma RT}$$

## Mach

$$Ma = \frac v{v_s}$$

$$\frac{T}{T_0} = 1+(\frac{\gamma-1}{2})Ma^2$$

$$\frac{P}{P_0} = (1+(\frac{\gamma-1}{2})Ma^2)^{\gamma/(\gamma-1)}$$

$$\frac{\rho}{\rho_0} = (1+(\frac{\gamma-1}{2})Ma^2)^{1/(\gamma-1)}$$

* when $Ma = 1$

$$\frac{T'}{T_0} = \frac2{\gamma+1}$$

$$\frac{P'}{P_0} = (\frac{\gamma+1}{2})^{\gamma/(\gamma-1)}$$

$$\frac{\rho'}{\rho_0} = (\frac{\gamma+1}{2})^{1/(\gamma-1)}$$

## Shockwave

* Before the shock wave : $_1$
* after the shock wave : $_2$

$$Ma_2 = \sqrt{\frac{(k\gamma-1)Ma_1^2+2}{2\gamma Ma^2_1-\gamma+1}}$$

$$\frac{T_1}{T_2} = \frac{1+Ma_1^2(\gamma-1)}{1+Ma_2^2(\gamma-1)}$$

$$\frac{P_2}{P_1} = \frac{1+\gamma Ma^2_1}{1+\gamma Ma^2_2} = \frac{2\gamma Ma^2_1-\gamma+1}{\gamma+1}$$

## Rayleigh fluid

$$q = C_P(T_1-T_2)+\frac{v_2^2v_1^2}{2}$$

## Quality

### specific volume

$$m = m_f + m_g$$

$$V = m_f v_f + m_g v_g$$

$$v_{\rm avg} \equiv \frac{V}{m}=\frac{m_f v_f + m_g v_g}{m_f + m_g}$$

$$x = \frac{m_g}{m}$$

so $m_g = x m$ , $m_f = (1-x)m$

$$v_{\rm avg}=\frac{(1-x)m\,v_f + x m\,v_g}{m}=(1-x)v_f + x v_g$$

$$v_{\rm avg}=v_f + x(v_g - v_f)$$

$$x=\frac{v_{\rm avg}-v_f}{v_g - v_f}$$

$${\,x=\dfrac{v_{\rm avg}-v_f}{v_{fg}}}$$

### Physical explanation

* if $v_{\rm avg}=v_f$, then $x=0$(all liquid)
* if $v_{\rm avg}=v_g$, then $x=1$(all steam)
* if $0<x<1$ liquid-vapor mixture, where x is the fraction by mass (not by volume) of vapor.
