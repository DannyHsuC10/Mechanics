---
layout: base
---

# Rotation of rigid bodies

Rigid-body rotation links angular motion to torque, angular momentum, and kinetic energy. Keep the rotation axis and corresponding moment of inertia consistent throughout a calculation.

## Rotation

* 1 revolution $= 2\pi$ rad $=360^o$

$$\omega = \dot \theta$$

$$\dot\theta = d\theta/dt$$

$$\alpha = \dot\omega = \ddot\theta$$

$$\dot\omega = d\omega/dt = d^2\theta/dt^2$$

$$v = dr/dt = \omega r$$

$$a = dv/dt = \alpha r$$

***

$$\theta = \theta_i+\omega t$$

$$\omega = \omega_i+\alpha t$$

$$\omega^2 = \omega_i^2+2\alpha\Delta\theta$$

$$\boxed{\theta = \theta_i+\omega_i t+\frac12\alpha t^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-020"
  data-expression="theta_i+omega_i*t+0.5*alpha*t^2"
  data-inputs="theta_i:initial angle rad,omega_i:initial angular speed rad/s,t:time s,alpha:angular acceleration rad/s^2"
  data-result="theta"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Centripetal acceleration

$$a_r = \frac{v^2}{r}$$

$$a_r = \ddot\omega r = \omega\times(\omega\times r)$$

## Momentum and Angular Momentum

$$p = mv$$

$$L = I\omega$$

$$L = mr^2\omega = rmv$$

$$\boxed{L = rp}$$

<div
  data-calculator=""
  data-boxed-id="boxed-021"
  data-expression="r*p"
  data-inputs="r:radius m,p:linear momentum kg m/s"
  data-result="L"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Rotational Energy

$$\boxed{K_\omega = \frac12I\omega^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-022"
  data-expression="0.5*I*omega^2"
  data-inputs="I:moment of inertia kg m^2,omega:angular speed rad/s"
  data-result="K_omega"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>
