---
title: sound wave
tags: [SHM, mechanics]

---

# Sound wave
$$v = \sqrt{\frac\tau\mu} = \sqrt{\frac{force}{inertia}}$$

* Bulk modulus : $B$
* Pressure : $P$


$$B = \frac{P}{\Delta V/V}$$

* speed of sound : $v_s$

$$v = \sqrt{\frac{B}{\rho}}$$

$$\Delta t = \frac{\Delta x}{v}$$

$$F = PA-(P+\Delta P)A = -\Delta PA$$

$$\Delta m = \rho A\Delta x = \rho Av\Delta t $$

$$a = \frac{\Delta v}{\Delta t}$$

$$F = ma = \rho Av\Delta t\frac{\Delta v}{\Delta t}$$

$$-\Delta PA = \rho Av\Delta t\frac{\Delta v}{\Delta t} = \rho v^2$$

$$-\Delta PA = \rho\frac{B}{\rho} = B = \frac{P}{\Delta V/V}$$

## Displacement
$$S(\lambda,t) = S_mcos(k\lambda-\omega t)$$
## Pressure
$$\Delta P(\lambda,t) = \Delta P_msin(k\lambda-\omega t)$$
## Pressure amplitude
$$a = \frac{\partial^2 S}{\partial t^2} = -\omega^2 S_m \cos(k\lambda - \omega t)$$

$$\Delta P = -\rho \omega^2 S_m \cos(k\lambda - \omega t)$$

$$\Delta P_m = \rho \omega^2 S_m$$

$$v = \frac{\omega}{k}$$

$$\Delta P = -\rho \omega^2 S_m \cos\left(\frac{\omega}{v}\lambda - \omega t\right)$$

$$\Delta P_m = (v \rho \omega) S_m$$

***
$$\Delta P = B\frac {\Delta V}V$$

$$ V = A\Delta \lambda$$

$$\Delta V = A\Delta s$$

$$\Delta P = B\frac {\Delta s}{\Delta \lambda} = B\frac {\partial s}{\partial \lambda}$$

$$\frac {\partial s}{\partial \lambda} = \frac {\partial}{\partial \lambda}(S_mcos(k\lambda-\omega t))$$

$$= -kS_msin(k\lambda-\omega t)$$

$$\Delta P = -BkS_msin(k\lambda-\omega t)$$

$$\Delta P_m = BkS_m = (\rho v^2k)S_m$$

$$\Delta P_m = (v \rho \omega) S_m$$

## Interference
$$S_1 = S_mcos(k\lambda-\omega t+\phi)$$

$$S_2 = S_mcos(k\lambda-\omega t)$$

$$S' = S_1(\lambda,t)+S_2(\lambda,t)$$

$$S' = S_mcos(k\lambda-\omega t+\phi)+S_mcos(k\lambda-\omega t)$$

* $cosA+cosB = 2cos(\frac{A+B}{2})cos(\frac{A-B}{2})$

$$S' = 2S_m(cos\frac\phi2)(cos(k\lambda-\omega t)) $$

$$S'_m = 2S_m(cos\frac\phi2)$$

$$\frac\phi{2\pi} = \frac{\Delta  L}\lambda$$

$$\phi = \frac{\Delta  L}\lambda2\pi$$

if $\phi = n2\pi$ and $n$ is a natural number
fully constructive interference

if $\frac{\Delta  L}\lambda =$ $0.5$ , $1.5$ , $2.5$ ...
fully destructive interference
## Acoustic resonance

|              Single open               |              Double open               |
|:--------------------------------------:|:--------------------------------------:|
|            $n = 1,3,5$...            |            $n = 1,2,3$...            |
| $$f = \frac v\lambda = \frac{nv}{4L}$$ | $$f = \frac v\lambda = \frac{nv}{2L}$$ |
|       $$\lambda = \frac{4L}{n}$$       |       $$\lambda = \frac{2L}{n}$$       |

## Sound intensity
$$I = \frac {(P)power}A = \frac P{\pi r^2}$$

$$S(\lambda, t) = S_m \cos(k\lambda - \omega t)$$

$$v(\lambda, t) = \frac{\partial S}{\partial t} = -\omega S_m \sin(k\lambda - \omega t)$$

$$a(\lambda, t) = \frac{\partial v}{\partial t} = -\omega^2 S_m \cos(k\lambda - \omega t)$$

$$\Delta P = -\rho a = \rho \omega^2 S_m \cos(k\lambda - \omega t)$$

$$I(\lambda, t) = P \cdot v(\lambda, t)$$

$$I = \frac FAv = \frac {dK}{Adt}$$

$$dK = \frac12dmv^2$$

$$dk = \frac12(\rho Adx)(\omega S_m)^2sin^2(k\lambda-\omega t)$$

$$\frac{dk}{dt} = \frac12(\rho Av)(\omega S_m)^2sin^2(k\lambda-\omega t)$$

$$P_{avg} = \frac12(\rho Av)(\omega S_m)^2$$

$$\frac PA = \frac12(\rho v)(\omega S_m)^2$$

$$I = \frac12(\rho v)(\omega S_m)^2$$

## Decibel
$$dB = 10log_{10}(\frac II_0)$$

* $I_0$ : $10^{-12}W/m^2$
## Beat
$$f_1 \simeq f_2$$

$$S_1 = S_mcos\omega_1t$$

$$S_2 = S_mcos\omega_2t$$

$$S' =S_1+S_2 = S_m(cos\omega_1t+cos\omega_2t)$$

$$S' = 2S_m(cos(\frac{\omega_1+\omega_2}2t))(cos(\frac{\omega_1-\omega_2}2t))$$

$$\omega_{avg} = \frac{\omega_1+\omega_2}2$$

$$\omega' = \frac{\omega_1-\omega_2}2$$

$$S'(t) = 2S_mcos(\omega_{avg} t)cos(\omega't)$$

$$\omega_{beat} = 2\omega' = \omega_1-\omega_2$$

$$\omega = 2\pi f$$

$$f_{beat} = f_1-f_2$$

## Doppler effect
* $v_s$ : sound speed
$$f' = f\frac{v_A\pm v_s}{-v_B\pm v_s}$$
1. Moving listener
listener velocity : $v_A$
$$f = \frac v\lambda = \frac{vt/\lambda}{t}$$

$$f' = \frac{(v_At+v_st)/\lambda}{t}$$

$$\lambda = v_s/f$$

$$f' = f\frac{v_A + v_s}{v_s}$$

2. Moving Sound Source
Sound Source velocity : $v_B$
$$f' = \frac {v_s}{\lambda} = \frac {v_s}{-v_Bt+v_st}$$

$$= \frac {v_s}{(-v_B+v_s)t} = \frac {v_s}{(-v_B+v_s)/f}$$

$$f' = f\frac {v_s}{(-v_B+v_s)}$$

## Supersonic speed & shock wave
* Mach number : $M$
$$M = \frac v{v_s}$$

* mach cone angle : $\theta$

$$sin\theta = \frac{vt}{v_st} = \frac v{v_s}$$

$$sin\theta = \frac1M$$

$$\theta = \sin^{-1}(\frac1M)$$