---
title: wave
tags: [SHM, mechanics]

---

# Wave7

1. Electromagnetic Wave
* travel without medium and can travel through a vacuum.
* Vacuum speed = $c$: 

2. Matter Wave
* describe the wave-like properties of particles.
* Small mass and high speed cause significant wave properties.

3. Mechanical Wave
* follow Newton's laws of motion.
* mechanical waves require a medium to travel.

#### Types of mechanical waves.
1. shear wave
2. longitudinal wave

## Wavelength & Frequency
* $k =$ wave number
* $x =$ position
* $\omega =$ angular frequency
* $t =$ time
* $y_m =$ amplitude
$$y(x,t) = y_msin(kx-\omega t)$$

where $\omega t$ t is the phase

$$k = \frac{2\pi}{\lambda}$$
## Cycle & Angle Frequency & Frequency
* when $x = 0$
$$y(0,t) = y_msin(-\omega t)$$

$$y(0,t) = y_msin(-\omega t_i-\omega \Delta t)$$

$$f = \frac1T = \frac\omega {2\pi}$$ 

$$\omega = \frac{2\pi}{T}$$
## Velocity of travel wave
$$kx-\omega t = constant$$

$$k\frac{dx}{dt} = \omega$$

$$v = \frac{dx}{dt} = \frac\omega k$$

$$v = \frac{2\pi}{k}\cdot\frac\omega{2\pi}$$

$$v = \lambda f$$

## Wave analysis
$$v \Longrightarrow LT^{-1}$$

$$\tau = MLT^{-2}$$

linear density : $\mu = \frac{m}{l}$ , when $R<<1$

$$\mu \Longrightarrow  ML^{-1}$$

$$v = \sqrt{\frac \tau\mu}$$

## Using Newton's Second Law to Derive Waves

$$F = \tau2sin\theta \simeq \tau2\theta = \tau\frac{\Delta l}R$$

$$\Delta m = \mu \Delta l$$

$$a = \frac{v^2}{R}$$

$$F = ma \Longrightarrow \tau\frac{\Delta l}R = \mu \Delta l\frac{v^2}{R}$$

$$\tau = \mu v^2$$

$$v = \sqrt{\frac \tau\mu}$$

$$\lambda = \frac vf = 
\sqrt{\frac \tau{\mu T^2}}$$

## Wave equation
$$F_{2y}-F_{1y} = dm\cdot a_y$$

$$dm = \mu dx$$

$$a_y = \frac{d^2y}{dt^2}$$

$$F_{2y}-F_{1y} = \mu dx\cdot \frac{d^2y}{dt^2} \quad -(1)$$
***
when $F_{1y}$ & $F_{2y} \simeq 0$

$$S_1 = \frac{F_{1y}}{F_{1x}} = tan\theta_1 \simeq sin\theta_1$$

$$S_2 = \frac{F_{2y}}{F_{2x}} = tan\theta_2 \simeq sin\theta_2$$

$$F_1 = \sqrt{F_{1x}^2+F_{1y}^2}$$

$$F_2 = \sqrt{F_{2x}^2+F_{2y}^2}$$

$$\tau = \sqrt{F_{x}^2+F_{y}^2}/S = \sqrt{F_{y}^2+(F_{y}^4/F_{x}^2)} \simeq F_{y}$$

$$F_{1y} = \tau S_1	\quad -(2)$$

$$F_{2y} = \tau S_2 \quad -(3)$$
***
$$(2),(3)\Longrightarrow(1)$$

$$\tau S_2-\tau S_1 = \mu dx\cdot \frac{d^2y}{dt^2}$$

$$\frac{S_2-S_1}{dx} = \frac{dS}{dx} = \frac\mu\tau\frac{d^2y}{dt^2}$$

$$S = \frac{dy}{dx}$$

$$\frac{\partial^2 y}{\partial x^2} = \frac\mu\tau\frac{\partial^2y}{\partial t^2}$$

$$\frac{dt^2}{
dx^2} = \frac\mu\tau$$

$$\frac{dt}{
dx} = \sqrt{\frac\mu\tau}$$

$$\frac{dx}{
dt} = \sqrt{\frac\tau\mu}$$

$$v = \sqrt{\frac\tau\mu}$$

## Wave energy transmission rate
$dK = \frac12dmv^2$ the kinetic energy of thw $(dm)$ area is $(dK)$

$$dK = \frac12dmv^2$$

$$v = \frac{\partial{y}}{\partial{t}} = -\omega y_mcos(kx-\omega t)$$

$$dm = \mu dx$$

$$dk = \frac12(\mu dx)(-\omega y_m)^2cos^2(kx-\omega t)$$

$$\frac{dK}{dt} = \frac12(\mu v)(\omega y_m)^2cos^2(kx-\omega t)$$

$$(\frac{dK}{dt})_{avg} = \frac14\mu v\omega^2 y_m^2$$

$$P_{max} = 2(\frac{dK}{dt})_{avg} = \frac12\mu v\omega^2 y_m^2$$
