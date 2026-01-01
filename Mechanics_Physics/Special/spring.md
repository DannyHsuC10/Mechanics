---
layout: base
---


# Spring

## Hooke's Law

<div style="text-align: center;">
<img src="upload_412f797991cf63a5ce1198f36ccf8f15.png" alt="image" width="300">
</div>

$$F = kx$$

$$F = mg = kx$$

$$\frac{mg}{k} = x$$

## total length

$$L = x_i+x_s+x_M$$

* Original length of spring: $x_i$
* Extension of the spring due to its own weight: $x_s$
* Elongation caused by the weight: $x_M$

## Integral solution
$$\frac{mg}{k} = x$$

$$\frac{x_i}{L}+\frac{(dm+dm_s)g}{k'} = dx$$

$$k' = k\frac Lx$$

$$\lambda = \frac{m_s}{L}$$

$$dm = \frac{M}{x}$$

$$dm_s = \lambda dx = \frac{m_s}{L}dx$$

$$\frac{x_i}{L}+\frac{(\frac{M}{x}+\frac{m_s}{L}dx)g}{k\frac Lx} = dx$$

$$\frac{x_i}{L}+\frac{g}{k}(\frac ML+\frac{m_sx}{L^2}dx) = dx$$

$$\int_0^L \frac{x_i}{L}+\frac{g}{k}(\frac ML+\frac{m_sx}{L^2}dx)= \int_0^L dx$$

$$\frac{x_iL}{L}+\frac{gML}{kL}+\frac{gm_sL^2}{k2L^2} = L$$

$$x_i+\frac{gM}{k}+\frac{gm_s}{k2} = L$$

* Original length of spring: $x_i$
* Extension of the spring due to its own weight: $\frac{gm_s}{k2}$
* Elongation caused by the weight: $\frac{gM}{k}$

$$m' = m_s/2$$

## Simple Harmonic Oscillation

$$K = \frac{1}{2}mv^2$$

$$\int_0^L \frac{1}{2} \left( \frac{m_s}{L} \right) \left( \frac{x}{L} v \right)^2 dx = \frac{m_s v^2}{2L^3} \int_0^L x^2 dx$$

$$K_s = \frac{1}{6} m_s v_m^2$$

$$\frac12kr^2 = K+K_s = \frac12Mv^2+\frac16m_sv^2$$

$$\frac{v^2}{r^2} = \omega^2 = \frac{k}{\frac{1}{3}m_3+M}$$

$$T = 2\pi/\omega$$

$$T = 2\pi\sqrt{\frac{M+\frac{m_s}{3}}{k}}$$
