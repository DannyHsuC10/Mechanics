---
layout: base
---

# Particle probability dynamics

## Single-particle distribution function

* Position : $x$
* velocity : $v$
* acceleration : $a$
* time　: $t$

$$f(x,v,t)$$

$$\frac{\partial f}{\partial t}+v\cdot \nabla_x f+a\cdot\nabla_vf = (\frac{\partial f}{\partial t})$$
* Particle motion along a trajectory (Liouville-like) : $\frac{\partial f}{\partial t}+v\cdot \nabla_x f+a\cdot\nabla_vf$
* Statistical changes caused by collisions : $\frac{\partial f}{\partial t}$

## Molecular chaos（Stosszahlansatz)

$$f_2(v_1,v_2)\simeq f(v_1)f(v_2)$$

* H-theorem
* One-way time
* Increase in entropy

## BBGKY hierarchy
Liouville equation
* Single-particle distribution : $f_1$
* Two-particle distribution : $f_2$
* Multi-particle distribution : $f_n$

$$f_1 = f(x,v,t)$$

$$f_2 \simeq f_1f_1$$

****
Advance to the Three-Body Problem
$$f_3 \not= f_1f_1f_1$$

$$f_n\not=f_1^n$$

## Chapman–Enskog expansion
* Knudsen number : $\varepsilon = \frac{\lambda}{L}$
* Mean free path : $\lambda$
* Macro scale : $L$

$$f = f^{(0)}+\varepsilon f^{(1)}+\varepsilon^2f^{(2)}+...$$

* Local thermal equilibrium : $f^{(0)}$
* Viscosity and heat transfer : $f^{(1)}$
* Burnett correction : $f^{(2)}$
### The equilibrium state is Maxwellian
$$Cf^{(0)}$$

$$f^{(0)}\propto e^{-\frac{m(v-u)^2}{2k_BT}}$$

## Navier–Stokes
integral by Boltzmann equation

| physical quantity |        definition         |
|:-----------------:|:-------------------------:|
|   mass density    |    $\rho = m\int fdv$     |
| momentum density  |   $\rho u = m\int vfdv$   |
|  Energy density   | $e = \frac12\int mv^2fdv$ |

more equation : 
* Shear stress : $\mu\nabla u$
* Heat flux : $\kappa\nabla T$



