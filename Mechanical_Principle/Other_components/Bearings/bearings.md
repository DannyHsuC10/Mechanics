---
layout: base
---

# Bearings

Bearings support rotating components while allowing relative motion. The notes distinguish sliding, rolling, journal, and thrust-contact models used to estimate friction.

## Friction

Choose the contact model and direction of impending or actual sliding before assigning the friction force.

### Sliding friction

$$f_s = \mu_kN$$

### Rolling friction

* rolling resistance constant : $C_{rr}$

$$f_r = C_{rr}N$$

* Surface subsidence : $Z$
* Roller diameter : $d$

$$\boxed{C_{rr} = \sqrt{Z/d}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-005"
  data-expression="(Z/d)^0.5"
  data-inputs="Z:surface subsidence m,d:roller diameter m"
  data-result="C_rr"
  data-unit=""
  data-constants=""
  data-note="Evaluate the stated rolling-resistance model using Z &gt;= 0 and d &gt; 0 in the same length unit.">
</div>

## Axle friection (journal bearings)

<div style="text-align: center;">
<img src="upload_3976adf43d01150918dc44e89c53db21.png" alt="image" width="400">
</div>

$$\sum F_y = 0$$

$$N = W$$

$$\sum M = 0$$

$$\boxed{M = Nd}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-006"
  data-expression="N*d"
  data-inputs="N:normal force N,d:offset distance m"
  data-result="M"
  data-unit="N m"
  data-constants=""
  data-note="Here d is the force offset from the shaft center; it is not the roller diameter used above.">
</div>

* offset position : $d$

## Disk friction (thrust bearing)

<div style="text-align: center;">
<img src="upload_6e99615ad7835ef52eba842d68a54a33.png" alt="image" width="400">
</div>

$$\Delta N = (F/A)\Delta A$$

$$= (F/\pi(R^2_1-R^2_2))\Delta A$$

$$\Delta f = \mu_k\Delta N$$

$$\Delta M = r\Delta f = r\mu_kF\Delta A/\pi(R^2_1-R^2_2)$$

$$M = \int dM = \frac{\mu_kF}{\pi(R^2_1-R^2_2)}\int dA$$

$$= \frac{\mu_kF}{\pi(R^2_1-R^2_2)}\int_0^{2\pi}\int_{R_1}^{R_2r}r^2\ dr\ d\theta$$

$$= \frac{\mu_kF}{\pi(R^2_1-R^2_2)}\int_0^{2\pi}1/3(R_1^3-R_2^3)\ d\theta$$

$$\boxed{M = \frac{2\mu_kF(R^3_1-R^3_2)}{3\pi(R^2_1-R^2_2)}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-007"
  data-expression="2*mu_k*F*(R_1^3-R_2^3)/(3*pi*(R_1^2-R_2^2))"
  data-inputs="mu_k:kinetic friction coefficient,F:axial force N,R_1:outer radius m,R_2:inner radius m"
  data-result="M"
  data-unit="N m"
  data-constants="pi=3.141592653589793"
  data-note="Evaluates the boxed formula exactly, including pi in the denominator. That factor is inconsistent with the solid-disk limit printed below; the source formula needs review. Use R_1 &gt; R_2 &gt;= 0.">
</div>

if $R_2 = 0$ and $R_2 = R$

$$M = 2/3\mu_kFR$$

$$\boxed{M_{max} = 2/3\mu_sFR}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-008"
  data-expression="2/3*mu_s*F*R"
  data-inputs="mu_s:static friction coefficient,F:axial force N,R:disk radius m"
  data-result="M_max"
  data-unit="N m"
  data-constants=""
  data-note="The printed 2/3 mu_s F R is evaluated as (2/3) multiplied by mu_s, F and R.">
</div>
