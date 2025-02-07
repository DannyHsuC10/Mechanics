---
title: wave interference
tags: [SHM, mechanics]

---

# Wave interference
## Principle of superposition of waves
$$y'(x,t) = y_1(x,t)+y_2(x,t)$$

$$y_1(x,t) = y_msin(kx-\omega t)$$

$$y_2(x,t) = y_msin(kx-\omega t+\phi)$$

$$y'(x,t) = y_msin(kx-\omega t)+y_msin(kx-\omega t+\phi)$$

* $\sin A + \sin B = 2 \sin \left( \frac{A + B}{2} \right) \cos \left( \frac{A - B}{2} \right)$

$$y'(x,t) = 2y_m\sin\left( \frac{kx-\omega t+kx-\omega t+\phi}{2} \right) \cos \left( \frac{kx-\omega t-(kx-\omega t+\phi)}{2} \right)$$
:::success
$$y'(x,t)= 2y_m\sin(kx-\omega t+\frac{\phi}{2})\cos(-\frac{\phi}{2})$$

$$y'_m = 2y_mcos(-\frac{\phi}{2})$$
:::
if $\phi = 0$

$$y'(x,t) = 2y_m2\sin(kx-\omega t)$$

if $\phi = n\pi$ and $n$ is a natural number

$$y'(x,t) = 0$$
## Wave graph
![Wave_superposition](https://hackmd.io/_uploads/S1eFzad981l.jpg)

## Phase and offset
$$y_1(x,t) = y_msin(kd_1-\omega t)$$

$$y_2(x,t) = y_msin(kd_2-\omega t)$$

$$y'(x,t) = y_msin(kx-\omega t+\phi)$$

$$y'(x,t) =2y_mcos(k\frac{d_1-d_2}{2})sin(-\omega t+k\frac{d_1+d_2}{2})$$

$$k = \frac{2\pi}{\lambda} \qquad f = \frac{\omega}{2\pi}$$

$$y'(x,t) =2y_mcos(\pi\frac{d_1-d_2}{\lambda})sin(-2\pi f t+\pi\frac{d_1+d_2}{\lambda})$$

$$\phi = \pi\frac{d_1-d_2}{\lambda}$$
:::success
* strongest $d_1-d_2 = nk\lambda$ and $n$ is a natural number 
* weakest $d_1-d_2 = n(k+\frac12)\lambda$ and $n$ is a natural number
:::
## stationary wave
$$y_1(x,t) = y_msin(kx-\omega t)$$

$$y_2(x,t) = y_msin(kx+\omega t)$$

$$y'(x,t) = y_1(x,t)+y_2(x,t)$$

$$= y_msin(kx-\omega t)+y_msin(kx+\omega t)$$
:::success
$$y'(x,t) = 2y_msin(kx)cos(\omega t)$$

Node :  A node is a point along a standing wave where the wave has minimum amplitude.
$kx = n\pi$ and $n$ is a natural number
$\lambda = n\frac\lambda2$ and $n$ is a natural number
:::
## Border reflection
* fixed : opposite direction
* moveable : same direction

## standing wave resonance
$$f = \frac v\lambda = n\frac v{2L}$$
* $n$ is a natural number
