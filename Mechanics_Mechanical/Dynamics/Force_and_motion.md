---
layout: base
---

# Force & motion

These notes apply force balances to common mechanical situations such as pulleys, springs, and curved motion. Draw a free-body diagram and choose positive directions before substituting into the equations.

## Newton's laws of motion

1. if $F = 0$ , then $v_i = v_f$
2. $F = ma$
3. $F_{ab} = -F_{ba}$

## Pulley

<div style="text-align: center;">
<img src="upload_fa3511de6a9d41f19fe4d451a1edffe0.png" alt="image" width="400">
</div>

**Fixed pulley**

$$T = w$$

$$F_{fix} = 2T$$

**Movable pulley**

$$T = \frac w2$$

$$F_{fix}= T$$

## Circular motion

**Horizontal**

<div style="text-align: center;">
<img src="upload_66e3ee8c938a888d9da75914c8751d09.png" alt="image" width="400">
</div>

$$F = ma = m\frac{v^2}{r}$$

**Vertical**

<div style="text-align: center;">
<img src="upload_601bbcb89ca0236af61a995115c2335e.png" alt="image" width="200">
</div>

$$T_{top} = F+w = ma+mg$$

$$T_{top} = m(\frac{v^2}{r}+g)$$

$$\boxed{v_{top} = \sqrt{gr}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-004"
  data-expression="(g*r)^0.5"
  data-inputs="g:gravity m/s^2,r:radius m"
  data-result="v_top"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

$$T_{mid} = F = ma$$

$$T_{mid} = \frac{mv^2}{r}$$

$$\boxed{v_{mid} = \sqrt{3gr}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-005"
  data-expression="(3*g*r)^0.5"
  data-inputs="g:gravity m/s^2,r:radius m"
  data-result="v_mid"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

$$T_{bottom} = F-w = ma-mg$$

$$T_{bottom} = m(\frac{v^2}{r}-g)$$

$$\boxed{v_{bottom} = \sqrt{5gr}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-006"
  data-expression="(5*g*r)^0.5"
  data-inputs="g:gravity m/s^2,r:radius m"
  data-result="v_bottom"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Spring

<div style="text-align: center;">
<img src="upload_3db0d70afb2b13002564da260e2a7a3e.png" alt="image" width="200">
</div>

$$F = k\Delta x$$

$$mg = k\Delta x$$

$$x = \frac{mg}{k}$$

* consider Spring height : $x_i$

$$\boxed{x = x_i+\frac{mg}{k}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-007"
  data-expression="x_i+m*g/k"
  data-inputs="x_i:initial position m,m:mass kg,g:gravity m/s^2,k:stiffness N/m"
  data-result="x"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* consider spring mass : $m_s$

$$\boxed{x = x_i+\frac{mg}{k}+\frac{m_sg}{2k}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-008"
  data-expression="x_i+m*g/k+m_s*g/(2*k)"
  data-inputs="x_i:initial position m,m:mass kg,g:gravity m/s^2,k:stiffness N/m,m_s:spring mass kg"
  data-result="x"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Vehicle turning

<div style="text-align: center;">
<img src="upload_4a6261b4d0e2ecb41b75b75eac385195.png" alt="image" width="300">
</div>

$$F = f$$

$$w = N$$

$$\mu N = ma$$

$$\mu mg = m\frac{v^2}{r}$$

$$\boxed{v = \sqrt{\mu gr}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-009"
  data-expression="(mu*g*r)^0.5"
  data-inputs="mu:friction coefficient,g:gravity m/s^2,r:radius m"
  data-result="v"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Superelevation

<div style="text-align: center;">
<img src="upload_cea9aa83fbc8b2ad8a03a08afa4f95a2.png" alt="image" width="400">
</div>

$$\frac{F}{sin(\theta)} = \frac{w}{sin(90^o-\theta)}$$

$$\frac{ma}{sin(\theta)} = \frac{mg}{sin(90^o-\theta)}$$

* when $\theta >> 1$ , then $cos(\theta) \simeq 1$

$$a = gsin(\theta)$$

$$\frac{v^2}{r} = g\frac{h}{d}$$

* height : $h$
* Track : $d$

$$\boxed{h = \frac{dv^2}{gr}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-010"
  data-expression="d*v^2/(g*r)"
  data-inputs="d:track width m,v:speed m/s,g:gravity m/s^2,r:radius m"
  data-result="h"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>
