---
layout: base
---

# Linear motion

Straight-line motion is described by position as a function of time. The equations and graphs connect displacement, velocity, and acceleration, including the constant-acceleration case.

## Moving distance

* Stationary or moving

The object moved　: $x_{initial} \not= x_{final}$

The object is not moving : $x_{initial} = x_{final}$

<div style="text-align: center;">
<img src="upload_e6cc7269e2fbbc205478da3ac05a506f.png" alt="image" width="300">
</div>

* Displacement  & path

Displacement  : Displacement  is the magnitude (length) of the displacement vector.

Path : Path length is how far the object moved as it traveled from its initial position to its final position.

## Velocity

<div style="text-align: center;">
<img src="upload_eefcf40b3fa5e555de723c0dff95d902.png" alt="image" width="300">
</div>

Velocity is slope of position versus time.

$$v_{avg} = \frac{Δx}{Δt} = \frac{x_f-x_i}{t_f-t_i}$$

$$v = \lim_{Δt \to 0}\frac{Δx}{Δt} = \frac{dx}{dt}$$

* Speed & Velocity
Velocity is a vector but speed is a scalar.

$$\boxed{speed = \frac{path}{time} \qquad velocity = \frac{displacement}{time}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-097"
  data-expression="path/time"
  data-inputs="path:distance m,time:elapsed time s"
  data-result="speed"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

<div
  data-calculator=""
  data-boxed-id="boxed-097-extra"
  data-expression="displacement/time"
  data-inputs="displacement:signed displacement m,time:elapsed time s"
  data-result="velocity"
  data-note="Velocity uses signed displacement; speed uses the total path length.">
</div>

## Acceleration

Acceleration is slope of velocity versus time.

$$a_{avg} = \frac{Δv}{Δt} = \frac{v_f-v_i}{t_f-t_i}$$

$$a = \lim_{Δt \to 0}\frac{Δv}{Δt} = \frac{dv}{dt} = \frac{d^2x}{dt^2}$$

## Relationship between position, velocity and acceleration

* if a is a constant

$$v = v_i+at$$

$$x_f-x_i = v_it+\frac{1}{2}at^2$$

$$v_f^2 = v_i^2+2a(X_f-X_i)$$

$$x_f-x_i = \frac{1}{2}(v_i+v_f)⋅t$$

$$x_f-x_i = v_ft-\frac{1}{2}at^2$$

$$a = \frac{v_f-v_i}{t}$$

* When free falling
$x_i = 0 \qquad v_i = 0 \qquad a = g$

$$x_f = x_i+v_it+\frac{1}{2}at^2 ⇒ h = \frac{1}{2}gt^2$$

## Graph

<div style="text-align: center;">
<img src="upload_1ad05b31dda77dc6a8125e31edbf2f49.png" alt="image" width="300">
</div>

## Differentiation and Integration

The integral of acceleration with respect to time is velocity.

The integral of velocity with respect to time is position.

$$a = \frac{dv}{dt} \qquad v = ∫adt$$

$$\boxed{v = at+v_i}$$

<div
  data-calculator=""
  data-boxed-id="boxed-098"
  data-expression="a*t+v_i"
  data-inputs="a:acceleration m/s^2,t:time s,v_i:initial velocity m/s"
  data-result="v"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

$$x = \frac{dV}{dt} \qquad x = ∫vdt = ∫(at+v_i)dt$$

$$\boxed{x =  x_i+v_it+\frac{1}{2}at^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-099"
  data-expression="x_i+v_i*t+0.5*a*t^2"
  data-inputs="x_i:initial position m,v_i:initial velocity m/s,t:time s,a:acceleration m/s^2"
  data-result="x"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>
