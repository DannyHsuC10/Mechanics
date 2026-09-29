---
layout: base
---

# Oscillation

Oscillatory motion repeats around an equilibrium position. The sinusoidal model connects amplitude, phase, frequency, velocity, and acceleration.

<div style="text-align: center;">
<img src="upload_f81f78af4be5bd7435163ec595d8ffbf.png" alt="image" width="500">
</div>

* equation Displacement versus time : $x(t)$
* amplitude : $x_m$
* angular frequency : $\omega$
* Phase : $\phi$

$$x(t) = x_mcos(𝜔t+\phi)$$

* $x_{max} = x_m$
* $x_{min} = -x_m$

## Cycle VS Frequency

$$T = \frac{1}{f}$$

## Place

$$x(t) = x_mcos(𝜔t+\phi)$$

* if $\phi = 0$ , then $x(t) = x_mcos(𝜔t)$

$$x(t) = x_mcos(𝜔t) = x_mcos𝜔(t+T)$$

$$𝜔(t+T) = 𝜔t+2\pi$$

$$𝜔T = 2\pi$$

$$\boxed{𝜔 = \frac{2\pi}{T} = 2\pi f}$$

<div
  data-calculator=""
  data-boxed-id="boxed-143"
  data-expression="2*pi/T"
  data-inputs="T:period s"
  data-result="omega"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Uses the period-based equality. The period T must be positive.">
</div>

## Velocity

Velocity is the time derivative of position. Its direction distinguishes it from scalar speed.

$$v(t) = \frac{dx(t)}{dt} = \frac{d}{dt}(x_mcos(𝜔t+\phi))$$

$$v(t) = -𝜔x_msin(𝜔t+\phi)$$

## Acceleratiion

$$a(t) = \frac{dv(t)}{dt} = \frac{d}{dt}(-𝜔x_msin(𝜔t+\phi))$$

$$a(t) = -𝜔^2x_mcos(𝜔t+\phi)$$

$$a(t) = -𝜔^2x(t)$$

## Graph

<div style="text-align: center;">
<img src="upload_cafc64f07b95a81de0bbc7256920aa9a.png" alt="image" width="500">
</div>
