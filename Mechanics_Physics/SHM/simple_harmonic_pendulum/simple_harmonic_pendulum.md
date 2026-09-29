---
layout: base
---

# simple harmonic pendulum

Pendulum motion can be approximated as simple harmonic motion for sufficiently small angular displacements. The period relationships depend on the pendulum geometry and restoring torque.

<div style="text-align: center;">
<img src="upload_6ce7667a5a969bfd18aa5e30ba9f011b.png" alt="image" width="500">
</div>

>by https://unacademy.com/content/nda/study-material/physics/pendulum/

$$\tau = -k\theta$$

$$\boxed{T = 2\pi\sqrt{\frac{I}{k}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-147"
  data-expression="2*pi*(I/k)^0.5"
  data-inputs="I:moment of inertia kg m^2,k:torsional stiffness N m/rad"
  data-result="T"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Swing motion

* $F_T = F_gcos\theta$

$(F_T)^2+(F_gsin\theta)^2 = F_g^2$

$$\tau = I\alpha = LF_gsin\theta$$

$$\alpha = \frac{mgL}{I}sin\theta$$

* if $\theta << 1$ , $sin\theta \simeq \theta$

$$\alpha = \frac{mgL}{I}\theta$$

$$\omega = \sqrt{\frac{mgL}{I}}$$

$$T = 2\pi\sqrt{\frac{I}{mgL}}$$

$$I = mr^2$$

$$T = 2\pi\sqrt{\frac{mL^2}{mgL}}$$

$$\boxed{T = 2\pi\sqrt{\frac{L}{g}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-148"
  data-expression="2*pi*(L/g)^0.5"
  data-inputs="L:pendulum length m,g:gravity m/s^2"
  data-result="T"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Gravity measurement

$$T = 2\pi\sqrt{\frac{L}{g}}$$

$$(\frac{T}{2\pi})^2 = \frac{L}{g}$$

$$\frac{4\pi^2}{T^2} = \frac{g}{L}$$

$$\boxed{g = \frac{4\pi^2L}{T^2}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-149"
  data-expression="4*pi^2*L/T^2"
  data-inputs="L:pendulum length m,T:period s"
  data-result="g"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>
