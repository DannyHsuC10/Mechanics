---
layout: base
---

# Axial Loaded Members

Axial loads stretch or shorten members along their length. The formulas account for geometry, elastic stiffness, temperature change, and the energy stored in deformation.

$$\delta = \varepsilon L = \frac{\sigma L}{E} = \frac{PL}{AE}$$

* stiffness (spring constant) : $k$
* flexibility (compliance) : $f$

$$fk = 1$$

$$\boxed{k = \frac{EA}{L}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-049"
  data-expression="E*A/L"
  data-inputs="E:Young modulus Pa,A:area m^2,L:length m"
  data-result="k"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

$$\boxed{f = \frac{L}{EA}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-050"
  data-expression="L/(E*A)"
  data-inputs="L:length m,E:Young modulus Pa,A:area m^2"
  data-result="f"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Stress and Deformation

$$\sum F = 0$$

$$\delta = \sum_i\delta_i = \int_0^L\frac{N(x)\ dx}{EA(x)}$$

## Tapered bar

<div style="text-align: center;">
<img src="upload_4a240dc6050045932a3cf86b8ef94ba2.png" alt="image" width="500">
</div>

$$d(x) = \frac{d_Ax}{L_A}$$

$$A(x) = \frac{\pi(dx)^2}{4} = \frac{\pi d_A^2x^2}{4L_A^2}$$

$$\delta = \int\frac{N(x)dx}{EA(x)} = \int^{L_B}_{L_A}\frac{P\ dx(4L_A^2)}{E\pi d_A^2x^2} = \frac{4PL_A^2}{\pi Ed^2_A}\int^{L_B}_{L_A}\frac{dx}{x^2}$$

$$= \frac{4PL_A^2}{\pi Ed^2_A}(\frac{1}{L_A}-\frac{1}{L_B}) = \frac{4PL_A^2}{\pi Ed^2_A}\frac{L_B-L_A}{L_AL_B}$$

$$= \frac{4PL}{\pi Ed^2} = \frac{PL}{AE}$$

## Thermal Effects, Misfits and Prestrains

$$\varepsilon_T = a\Delta T$$

$$\delta_T = \varepsilon_TL = a(\Delta T)L$$

## Stresses on Inclined Sections

<div style="text-align: center;">
<img src="upload_e26ef0760fee32626bc2ef18214ad5b0.png" alt="image" width="500">
</div>

$$N = P\cos\theta V = P\sin\theta$$

$$A_1 = A/\cos\theta$$

$$\sigma_\theta = \frac{P\cos\theta}{A/\cos\theta} = \sigma_x\cos^2\theta = \sigma_x(1+\cos2\theta)/2$$

$$\tau_\theta = -\frac{V}{A_t} = \frac{P\sin\theta}{A/\cos\theta} = -\sigma_x\sin\theta\cos\theta = -\frac{\sigma_x}{2}\sin2\theta$$

$$\sigma_{max} = \sigma_x$$

$$\tau_{max} = \sigma_x/2$$

## Strain Energy

$$dW = Pd\delta$$

$$U = W = \int P\ d\delta$$

### in linear elastic range

$$U = W = \frac{P\delta}{2}$$

$$\boxed{U = \frac{P^2L}{2EA} = \frac{EA\delta^2}{2L}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-051"
  data-expression="P^2*L/(2*E*A)"
  data-inputs="P:axial force N,L:length m,E:Young modulus Pa,A:area m^2"
  data-result="U"
  data-unit=""
  data-constants=""
  data-note="Uses the force-based equality; enter axial load P.">
</div>
