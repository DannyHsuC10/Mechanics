---
layout: base
---

# Volumetric strain

Volumetric strain measures the fractional change in volume. This derivation connects small strains in three directions with the bulk modulus under uniform pressure.

$$\frac{dV+V}{V} = (\frac{x+dx}{x})(\frac{y+dy}{y})(\frac{z+dz}{z})$$

$$= (1+\frac{dx}{x})(1+\frac{dy}{y})(1+\frac{dz}{z})$$

$$= 1+\frac{dx}{x}+\frac{dy}{y}+\frac{dz}{z}+\frac{dxdy}{xy}+\frac{dydz}{yz}+\frac{dxdz}{xz}+\frac{dxdydz}{xyz}$$

* $\frac{dxdy}{xy} \to 0$
* $\frac{dydz}{yz} \to 0$
* $\frac{dxdz}{xz} \to 0$
* $\frac{dxdydz}{xyz} \to 0$

$$= 1+\frac{dx}{x}+\frac{dy}{y}+\frac{dz}{z}$$

$$\frac{dV+V}{V} = 1+dV = 1+\frac{dx}{x}+\frac{dy}{y}+\frac{dz}{z}$$

$$dV = \frac{dx}{x}+\frac{dy}{y}+\frac{dz}{z}$$

## Uniform stress

$$\frac{P_x}{A_{\perp x}} = \frac{P_y}{A_{\perp y}} = \frac{P_z}{A_{\perp z}}$$

$$\boxed{\frac{dV}{V} = 3\frac{P}{A}\frac1E_V(1-2\mu)}$$

<div
  data-calculator=""
  data-boxed-id="boxed-045"
  data-expression="3*(P/A)/E_V*(1-2*mu)"
  data-inputs="P:force N,A:area m^2,E_V:modulus Pa,mu:Poisson ratio"
  data-result="dV/V"
  data-unit=""
  data-constants=""
  data-note="Evaluates the displayed factors literally; confirm the definition of E_V before physical use.">
</div>

## Volume elastic modulus

$$\frac{F}{A} = E_V\frac{dV}{V}$$

$$E_V = \frac{\frac{P}{A}}{\frac{dV}{V}}$$

$$= \frac{\frac{P}{A}}{ 3\frac{P}{A}\frac1E_V(1-2\mu)}$$

$$\boxed{E_V = \frac{E}{3(1-2\mu)} = \frac{E}{3-6\mu}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-046"
  data-expression="E/(3*(1-2*mu))"
  data-inputs="E:Young modulus Pa,mu:Poisson ratio"
  data-result="E_V"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>


