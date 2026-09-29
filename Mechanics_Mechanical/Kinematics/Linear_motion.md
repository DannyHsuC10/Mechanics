---
layout: base
---

# Linear motion

Straight-line motion is described by position as a function of time. The equations and graphs connect displacement, velocity, and acceleration, including the constant-acceleration case.

* time : $t$
* height : $h$
* velocity : $v$
* acceleration : $a$

## Velocity & Speed

$$v_{avg} = \frac{Δx}{Δt} = \frac{x_f-x_i}{t_f-t_i}$$

$$v = \dot x = \frac{dx}{dt}$$

$$speed = \frac{path}{time}$$

$$velocity = \frac{displacement}{time}$$

## Acceleration

Acceleration is the time derivative of velocity. A change in direction can produce acceleration even at constant speed.

$$a_{avg} = \frac{Δv}{Δt} = \frac{v_f-v_i}{t_f-t_i}$$

$$a = \ddot x = \dot v = \frac{d^2x}{dt^2}$$

## Linear motion with constant acceleration

$$v = v_i+at$$

$$x = x_i+v_it+\frac12at^2$$

$$\boxed{v = \sqrt{(v_i^2+2a\Delta x)}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-023"
  data-expression="(v_i^2+2*a*delta_x)^0.5"
  data-inputs="v_i:initial speed m/s,a:acceleration m/s^2,delta_x:displacement m"
  data-result="v"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Free fall

$$v = gt$$

$$h = \frac12gt^2$$

$$\boxed{v = \sqrt{2gh}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-024"
  data-expression="(2*g*h)^0.5"
  data-inputs="g:gravity m/s^2,h:height m"
  data-result="v"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## slope

$$a = gsin(\theta)$$

$$sin(\theta) = \frac hx$$

$$t = \sqrt{\frac{2
h}{g}}\frac{1}{sin(\theta)}$$
