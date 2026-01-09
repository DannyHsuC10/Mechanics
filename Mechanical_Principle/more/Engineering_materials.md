---
layout: base
---

# Engineering materials

## stress & strain

$$\text{stress}(\sigma) = \frac FA$$

$$\text{strain}(\varepsilon) = \frac{\Delta l}{l_0}$$

## Elastic region
$$\sigma = \varepsilon E$$

$$E = \frac{dF}{dl}$$

$$T \propto \frac1E$$

## Poisson Ratio
$$\nu = \frac{\varepsilon_\text{axial}}{\varepsilon_\text{radial}}$$

$$\varepsilon_z = \sigma_z/E$$

$$\varepsilon_y = \varepsilon_x = -\nu\frac{\sigma_z}{E}$$

## Resilience
$$U_r = \int^{\varepsilon_r}_0\sigma\ d\varepsilon \sim \frac12\sigma\varepsilon$$

## Ductility
$$EL = \frac{\Delta l}{l_0}$$

$$RA = \frac{\Delta A}{A_0}$$
## Toughness
$$\int F\ dl$$
## Engineering stress & True stress
* engineering stress : $\sigma = \frac{F}{A_0}$
* ture stress : $\sigma_T = \frac{F}{A_i}$
* engineering strain : $\varepsilon = \frac{l}{l_0}$
* ture strain : $\varepsilon_T = \ln(\frac{l_i}{l_0}) = \ln(1+\varepsilon)$

$$\sigma_T = k\varepsilon_T^n$$

$$\ln(\sigma_T) = \ln(K)+n\ln(\varepsilon_T)$$

$$\sigma = \sigma_0+kd^{-\frac12}$$

$$\sigma \propto \frac1{\sqrt{d}}$$
## Hardness
$$HB = \frac{2P}{\pi D(D-\sqrt{D^2-d^2})}$$

$$TS = 3.45 HB$$

## safety factor
$$SF = \frac{\sigma}{\sigma_\text{work}}$$
## fracture
* Fracture stress : $\sigma_\max$

$$\sigma_\max = 2\sigma_0(\frac a2)^{\frac12}$$

* Critical stress : $\sigma_c$

$$\sigma_c = (\frac{2Er_s}{\pi a})^{\frac12}$$

* Stress intensity : $K$

$$K = Y\sigma\sqrt{\pi a}$$

* fracture toughness : $K_c$

$$K_c = Y\sigma_c\sqrt{\pi a}$$
## Creep

$$\varepsilon_s = k\sigma^ne^{(-\frac{Qc}{RT})}$$

* miller constant : $m$
* time : $t_r$

$$m = T(C+\log(t_r))$$
