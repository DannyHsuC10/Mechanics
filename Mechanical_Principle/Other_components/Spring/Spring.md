---
layout: base
---

# Spring

Springs store elastic energy and provide a restoring force or torque. These notes relate spring geometry and stiffness, then compare the effect of connecting springs in series or parallel.

## Diameter

* Outer diameter : $D_o$
* inner diameter : $D_i$
* Middle diameter : $D_m$
* Wire diameter : $d$

$$\boxed{D_m  = \frac{D_i+D_o}2}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-016"
  data-expression="(D_i+D_o)/2"
  data-inputs="D_i:inner diameter mm,D_o:outer diameter mm"
  data-result="D_m"
  data-unit="mm"
  data-constants=""
  data-note="Enter both diameters in mm with D_o &gt; D_i &gt;= 0 to obtain the mean coil diameter.">
</div>

$$D_m = D_o-d$$

$$D_m = D_i+d$$

$$\boxed{d = \frac{D_o-D_i}2}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-017"
  data-expression="(D_o-D_i)/2"
  data-inputs="D_o:outer diameter mm,D_i:inner diameter mm"
  data-result="d"
  data-unit="mm"
  data-constants=""
  data-note="The wire diameter is half the difference between outer and inner coil diameters. Use D_o &gt; D_i &gt;= 0.">
</div>

## Spring index and spring constant

* Spring index : $C$
* spring constant : $k$

$$C=  \frac{D_m}{d} = \frac{D_o}{d}-1 = \frac{D_i}{d}+1$$

$$k = \frac Fx$$

## series and parallel Springs

### In Series

* **2 spring**

$$\boxed{k_\text{total} = \frac{k_1k_2}{k_1+k_2}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-018"
  data-expression="k_1*k_2/(k_1+k_2)"
  data-inputs="k_1:first spring stiffness N/mm,k_2:second spring stiffness N/mm"
  data-result="k_total"
  data-unit="N/mm"
  data-constants=""
  data-note="Equivalent stiffness of two positive linear spring stiffnesses connected in series.">
</div>

* **n spring**

$$k_\text{total} = \frac1{\frac1{k_1}+\frac1{k_2}+\frac1{k_3}+...\frac1{k_n}} = (\sum\frac1{k_i})^{-1}$$

### In Parallel

* **2 spring**

$$\boxed{k_\text{total} = k_1+k_2}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-019"
  data-expression="k_1+k_2"
  data-inputs="k_1:first spring stiffness N/mm,k_2:second spring stiffness N/mm"
  data-result="k_total"
  data-unit="N/mm"
  data-constants=""
  data-note="Equivalent stiffness of two linear springs in parallel with equal displacement.">
</div>

* **n spring**

$$k_\text{total} = k_1+k_2+k_3+...k_n = \sum k_i$$

## Something special?

[Click it](../../../Special/spring.md)
