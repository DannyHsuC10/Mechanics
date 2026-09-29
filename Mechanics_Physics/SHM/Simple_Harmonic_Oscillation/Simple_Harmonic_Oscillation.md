---
layout: base
---

# Simple Harmonic Oscillation

Simple harmonic motion occurs when the restoring force is proportional to displacement from equilibrium. The spring–mass model shows how kinetic and potential energy alternate during a cycle.

$$F = ma = m\frac{v^2}{r} = m\omega^2r$$

$$F = kr$$

$$m\omega^2r = kr$$

$$k = m\omega^2$$

$$\boxed{\omega = \sqrt{\frac{k}{m}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-145"
  data-expression="(k/m)^0.5"
  data-inputs="k:stiffness N/m,m:mass kg"
  data-result="omega"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* [How to solve SHM by ODE ?](../../../Special/SHM_ODE.md)

$$T = 2\pi/\omega = 2\pi\sqrt{\frac{m}{k}}$$

* Consider the mass of the spring ($m_s$):
[why ??](../../../Special/spring.md)

$$\boxed{T = 2\pi\sqrt{\frac{m+\frac{1}{3}m_s}{k}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-146"
  data-expression="2*pi*((m+m_s/3)/k)^0.5"
  data-inputs="m:attached mass kg,m_s:spring mass kg,k:stiffness N/m"
  data-result="T"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Energy

Identify the energy stored in each part of the system and the transfers across its boundary.

$$U(t) = \frac{1}{2}kx^2 = \frac{1}{2}kx_m^2cos^2(\omega t+\phi)$$

$$K(t) = \frac{1}{2}mv^2 = \frac{1}{2}m\omega^2x_m^2sin^2(\omega t+\phi)$$

$$K(t) = \frac{1}{2}kx_m^2sin^2(\omega t+\phi)$$

$$E = K+U$$

$$E = \frac{1}{2}kx_m^2sin^2(\omega t+\phi)+\frac{1}{2}kx_m^2cos^2(\omega t+\phi)$$

$$= \frac{1}{2}kx_m^2(sin^2(\omega t+\phi)+cos^2(\omega t+\phi))$$

* because $sin^2x+cos^2x = 1$

so $E = U+K = \frac{1}{2}kx_m^2$

## Graph

<div style="text-align: center;">
<img src="upload_6fea7e8f383b8d35d78b45fc6869f1d6.png" alt="image" width="500">
</div>
