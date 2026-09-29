---
layout: base
---

# Second moment of area

The second moment of area measures how cross-sectional area is distributed about an axis. Specify the axis before using shape formulas, the parallel-axis theorem, or a section modulus.

## Common formulas

* Second moment of area : $I =\int r^2dA$
* parallel axis theorem : $I_s = I_x+AL^2$
* Section Modulus : $Z = \frac{I_x}{y_{max}}$
* Radius of Gyration : $K = \sqrt{\frac{I}{A}}\ ,I = AK^2$
* Polar Second moment of area : $J = I_x+I_y$
* Polar Radius of Gyration : $K_J = \sqrt{\frac{J}{A}}$

## Second moment of area of different shapes

* **rectangle**

<div style="text-align: center;">
<img src="upload_05cbc595cf50ee99d2fff6ba41e084c0.png" alt="image" width="250">
</div>

$$I_x = \frac{bh^3}{12}$$

$$I_y = \frac{hb^3}{12}$$

$$\boxed{I_a = \frac{bh^3}{3}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-033"
  data-expression="b*h^3/3"
  data-inputs="b:width m,h:height m"
  data-result="I_a"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **triangle**

<div style="text-align: center;">
<img src="upload_518a1123b265964ad082eb32e5ec24a0.png" alt="image" width="250">
</div>

$$I_x = \frac{bh^3}{36}$$

$$I_y = \frac{hb^3}{36}$$

$$\boxed{I_a = \frac{bh^3}{12}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-034"
  data-expression="b*h^3/12"
  data-inputs="b:width m,h:height m"
  data-result="I_a"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

$$\boxed{I_b = \frac{bh^3}{4}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-035"
  data-expression="b*h^3/4"
  data-inputs="b:width m,h:height m"
  data-result="I_b"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **circle**
<div style="text-align: center;">
<img src="upload_648398fd49063ec0b3b924dac1449c8b.png" alt="image" width="250">
</div>

$$I_x = I_y = \frac{\pi R^4}{4}$$

$$\boxed{I_a = \frac54\pi R^4}$$

<div
  data-calculator=""
  data-boxed-id="boxed-036"
  data-expression="1.25*pi*R^4"
  data-inputs="R:radius m"
  data-result="I_a"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **half circle**
<div style="text-align: center;">
<img src="upload_7cf28dc9968176944a457f29d9f53eb3.png" alt="image" width="250">
</div>

$$\boxed{I_x = I_y = \frac{\pi R^4}{8}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-037"
  data-expression="pi*R^4/8"
  data-inputs="R:radius m"
  data-result="I_x = I_y"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **Quarter circle**
<div style="text-align: center;">
<img src="upload_65589c35a8c62c8c5f0d3edc580c6886.png" alt="image" width="250">
</div>

$$\boxed{I_x = I_y = \frac{\pi R^4}{16}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-038"
  data-expression="pi*R^4/16"
  data-inputs="R:radius m"
  data-result="I_x = I_y"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>
