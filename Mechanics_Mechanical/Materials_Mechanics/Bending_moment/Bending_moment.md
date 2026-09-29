---
layout: base
---

# Bending moment

A beam carries transverse loads through internal shear and bending. Identify the supports and cross-section before applying the bending-stress and section-property relationships.

## Types of beams

### Statically determinate beam

<div style="text-align: center;">
<img src="upload_53022b0fc7ffe51edf6a22438b2d7853.png" alt="image" width="900">
</div>

1. Simply supported beam
1. Cantilever beam
1. Overhanging beam

### Statically indeterminate beam

<div style="text-align: center;">
<img src="upload_17c5b44d22766110c6ea893fd8421d82.png" alt="image" width="900">
</div>

1. Continuous beam
1. Fixed beam
1. Restrained beam

## Shear force & bending moment

<div style="text-align: center;">
<img src="upload_7fad4df5668df9c83da3e70ac06ebd58.png" alt="image" width="900">
</div>

$$V = \int F(x)dx$$

$$M = \int V(x)dx$$

## Bending stress in beam

<div style="text-align: center;">
<img src="upload_f698eb9c34ae9788b1df82310c15f764.png" alt="image" width="150">
</div>

$$\boxed{\sigma = \frac{My}{I}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-025"
  data-expression="M*y/I"
  data-inputs="M:bending moment N m,y:distance from neutral axis m,I:second moment of area m^4"
  data-result="sigma"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Shear stress in beam

<div style="text-align: center;">
<img src="upload_901e25b63f7ad89c93aed246e3f28d52.png" alt="image" width="350">
</div>

$$\boxed{\tau = \frac{VQ}{Ib}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-026"
  data-expression="V*Q/(I*b)"
  data-inputs="V:shear force N,Q:first moment of area m^3,I:second moment of area m^4,b:width m"
  data-result="tau"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **Rectangular beam**

<div style="text-align: center;">
<img src="upload_d3ef7e6a1c659c4c41bf634ba70e4bf4.png" alt="image" width="200">
</div>

$$\boxed{\tau_{max} = \frac{3V}{2A}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-027"
  data-expression="3*V/(2*A)"
  data-inputs="V:shear force N,A:area m^2"
  data-result="tau_max"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **Circular beam**

<div style="text-align: center;">
<img src="upload_ff883198bf80b6e03f6ae07001761036.png" alt="image" width="200">
</div>

$$\boxed{\tau_{max} = \frac{4V}{3A}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-028"
  data-expression="4*V/(3*A)"
  data-inputs="V:shear force N,A:area m^2"
  data-result="tau_max"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Complex cross section of beam

<div style="text-align: center;">
<img src="upload_bc388c15bdd5a650a8f52f657296a8be.png" alt="image" width="900">
</div>

* Strength under the same cross-sectional area
H-shaped > rectangular > square > circular
