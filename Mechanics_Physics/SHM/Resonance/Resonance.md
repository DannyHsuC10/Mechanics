---
layout: base
---

# Resonance

A driven oscillator responds strongly when the forcing frequency is near a natural frequency. These notes relate the forcing model to displacement, power, and stored energy.

when $\omega = \omega_0$ resonance will occur

$$F = kx_{m0}$$

$$F_0cos(\omega t) = m\ddot x+kx$$

$$x_{m0} = \frac Fk$$

$$\omega_0^2 = \frac km$$

$$\boxed{x_{m0} = \frac{F_0}{m\omega_0^2}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-144"
  data-expression="F_0/(m*omega_0^2)"
  data-inputs="F_0:force amplitude N,m:mass kg,omega_0:natural angular frequency rad/s"
  data-result="x_m0"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Power

Power measures the rate of energy transfer. Use the translational or rotational expression that matches the mechanism.

$$P(t) = FV = F_0cos(\omega t)(-x_{m0}\omega_0sin(\omega t))$$

$$= F_0cos(\omega t)(-x_{m0}\omega_0sin(\omega t))$$

$$P(t) = \frac12x_{m0}\omega_0F_0sin(\omega t)$$

$$P = \frac{1}{T}\int_0^T P(t) dt = 0$$

## Energy

Identify the energy stored in each part of the system and the transfers across its boundary.

$$\frac 12kx_{m0}^2$$
