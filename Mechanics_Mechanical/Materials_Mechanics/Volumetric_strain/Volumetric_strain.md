---
layout: base
---

# Volumetric strain

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

$$\frac{dV}{V} = 3\frac{P}{A}\frac1E_V(1-2\mu)$$

## Volume elastic modulus

$$\frac{F}{A} = E_V\frac{dV}{V}$$

$$E_V = \frac{\frac{P}{A}}{\frac{dV}{V}}$$

$$= \frac{\frac{P}{A}}{ 3\frac{P}{A}\frac1E_V(1-2\mu)}$$

$$= \frac{E}{3(1-2\mu)} = \frac{E}{3-6\mu}$$
