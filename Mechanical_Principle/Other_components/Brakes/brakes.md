---
layout: base
---

# Brakes

A brake converts mechanical energy into heat through friction. The equations relate applied force, contact geometry, braking torque, and the heat that must be dissipated.

## Block brake

<div style="text-align: center;">
<img src="upload_3a66df00ffed3b7331d046d77b158520.png" alt="image" width="300">
</div>

$$\tau = fr = \mu Nr$$

$$\sum M_o = 0\qquad Na-fb-Fl = 0$$

$$\frac{\tau}{\mu r}a-\frac{\tau}{r}b-Fl = 0$$

$$\boxed{F = \frac{\tau(a-\mu b)}{\mu rl}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-009"
  data-expression="tau*(a-mu*b)/(mu*r*l)"
  data-inputs="tau:braking torque N m,a:normal-force lever arm m,mu:friction coefficient,b:friction-force lever arm m,r:drum radius m,l:actuation lever arm m"
  data-result="F"
  data-unit="N"
  data-constants=""
  data-note="Evaluates the stated block-brake force. Use positive mu, r and l. A zero or negative a - mu*b indicates the self-locking boundary or a change in the required force direction.">
</div>

**reverse**

$$\boxed{F = \frac{\tau(a-\mu b)}{\mu rl}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-010"
  data-expression="tau*(a-mu*b)/(mu*r*l)"
  data-inputs="tau:braking torque N m,a:normal-force lever arm m,mu:friction coefficient,b:friction-force lever arm m,r:drum radius m,l:actuation lever arm m"
  data-result="F"
  data-unit="N"
  data-constants=""
  data-note="The reverse-direction box currently repeats the forward-direction formula. This calculator preserves that expression; confirm the friction moment sign for the actual rotation direction.">
</div>

* if $a-\mu b<0$, self lock

## Band brake

<div style="text-align: center;">
<img src="upload_4d6e704eb00e99fee8d7425723f7207c.png" alt="image" width="300">
</div>

$$\frac{F_1}{F_2} = e^{\mu\theta}$$

$$\tau = (F_1-F_2)r$$

$$F_1 = \frac{\tau e^{\mu\theta}}{F(e^{\mu\theta}-1)}$$

$$F_2 = \frac{\tau}{r(e^{\mu\theta}-1)}$$

$$\sum M_o = 0\qquad F_2a-Fl = 0$$

$$\frac T{r(e^{\mu\theta}-1)}a-Fl = 0$$

$$\boxed{F = \frac{Ta}{rl(e^{\mu\theta}-1)}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-011"
  data-expression="T*a/(r*l*(e^(mu*theta)-1))"
  data-inputs="T:braking torque N m,a:band lever arm m,r:drum radius m,l:actuation lever arm m,mu:friction coefficient,theta:wrap angle rad"
  data-result="F"
  data-unit="N"
  data-constants="e=2.718281828459045"
  data-note="T denotes torque here. Enter wrap angle theta in radians; use positive r, l and mu*theta.">
</div>

**reverse**

$$\boxed{F = \frac{Tae^{\mu\theta}}{rl(e^{\mu\theta}-1)}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-012"
  data-expression="T*a*e^(mu*theta)/(r*l*(e^(mu*theta)-1))"
  data-inputs="T:braking torque N m,a:band lever arm m,r:drum radius m,l:actuation lever arm m,mu:friction coefficient,theta:wrap angle rad"
  data-result="F"
  data-unit="N"
  data-constants="e=2.718281828459045"
  data-note="Evaluate the reverse band-brake expression with theta in radians. T is braking torque and e is supplied automatically.">
</div>

## Disc brake

<div style="text-align: center;">
<img src="upload_a3958b838da480d7f147ef1ba74f1334.png" alt="image" width="300">
</div>

$$D_m = \frac{D_o+D_i}{2}$$

$$\tau = f\frac{D_m}2 = \mu F\frac{D_m}2$$

$$\boxed{F = \frac{2\tau}{\mu D_m}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-013"
  data-expression="2*tau/(mu*D_m)"
  data-inputs="tau:braking torque N m,mu:friction coefficient,D_m:mean contact diameter m"
  data-result="F"
  data-unit="N"
  data-constants=""
  data-note="Use the mean contact diameter D_m, not its radius. This evaluates the single friction-force relation shown above.">
</div>

## Brake cooling

$$W = fS = \mu FS$$

$$K = \frac12mv^2$$

## Braking power

$$\sigma = \frac FA$$

$$F = \sigma A$$

$$f = \mu F = \mu\sigma A$$

$$P = fv = \mu\sigma Av$$
