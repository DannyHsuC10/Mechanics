---
layout: base
---

# Fluid properties

Real fluids exhibit viscosity and surface effects that ideal-fluid models omit. The sections compare flow profiles, dimensionless flow measures, and forces associated with fluid motion.

## Viscous foece

<div style="text-align: center;">
<img src="upload_ed617eef255ff5628bf87f5498c2bf8e.png" alt="image" width="400">
</div>

$$\boxed{F = \mu A\frac uy}$$

<div
  data-calculator=""
  data-boxed-id="boxed-113"
  data-expression="mu*A*u/y"
  data-inputs="mu:dynamic viscosity Pa s,A:area m^2,u:velocity m/s,y:gap m"
  data-result="F"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* velocity of the fluid : $u$
* viscosity : $\mu$ , $(\frac{M}{TL})$

$$\tau = \frac FA$$

$$\tau = \mu\frac{𝜕u}{𝜕y}$$

* Kinematic viscosity : $\nu$

$$\boxed{\nu = \frac{\mu}{\rho}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-114"
  data-expression="mu/rho"
  data-inputs="mu:dynamic viscosity Pa s,rho:density kg/m^3"
  data-result="nu"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Turbulent power-law

* velocity of the fluid : $u$
* Location radius : $r$

$$\frac{u}{u_{\max}} = (1-\frac{r}{R})^{1/n}$$

## Raynolds number

<div style="text-align: center;">
<img src="upload_9401ab8b88b13ac32ffd1b30d90d5852.png" alt="image" width="400">
</div>

* Raynolds number : $Re$

$$Re = \frac{inertial force}{viscous force}$$

* length (e.g., diameter of a pipe) : $L$

$$Re = \frac{\rho uL}{\mu} = \frac{uL}{\nu}$$

The higher the viscosity $\mu$, the more easily the fluid is affected by the pipe wall.

## Velocity of the fluid

$$\boxed{u = \frac{1}{4\mu}\frac{dP}{dx}(r_o^2-r^2)}$$

<div
  data-calculator=""
  data-boxed-id="boxed-115"
  data-expression="pressure_gradient*(r_o^2-r^2)/(4*mu)"
  data-inputs="pressure_gradient:dP/dx Pa/m,r_o:outer radius m,r:radial position m,mu:dynamic viscosity Pa s"
  data-result="u"
  data-unit=""
  data-constants=""
  data-note="Supply the signed numerical pressure gradient dP/dx; this calculator does not differentiate a function.">
</div>

* Pressure gradient : $\frac{dP}{dx}$
This is the main force that propels the fluid to flow along the pipe
* Dynamic viscosity : $𝜇$
viscosity represents the friction inside the fluid.
* Velocity distribution :  $r_0^2−r^2$
velocity changes with radial distance.

## Hagen-Poiseuille equation

$$Q = \int_{0}^{r_0}u(r)2\pi rdr$$

* viscous flow rate : $Q$

$$= \int_{0}^{r_0}\frac{1}{4\mu}\frac{dP}{dx}(r_o^2-r^2)2\pi rdr$$

$$= \frac{2\pi}{4\mu}\frac{dP}{dx}\int_{0}^{r_0}(r_o^2r-r^3) r dr$$

$$\frac{2\pi}{4\mu}\frac{dP}{dx}\int_{0}^{r_0}(r_o^2r-r^3) r dr$$

$$= \frac{2\pi}{4\mu}\frac{dP}{dx}(\int_{0}^{r_0}r_o^2rdr-\int_{0}^{r_0}r^3dr)$$

$$=\frac{2\pi}{4\mu}\frac{dP}{dx}(\frac{r_0^4}{2}-\frac{r_0^4}{4})$$

$$=\frac{2\pi}{4\mu}\frac{dP}{dx}\frac{r_0^4}{4}$$

$$\boxed{Q = \frac{\pi r^4_0}{8\mu}(\frac{dP}{dx})}$$

<div
  data-calculator=""
  data-boxed-id="boxed-116"
  data-expression="pi*r_0^4*pressure_gradient/(8*mu)"
  data-inputs="r_0:pipe radius m,pressure_gradient:dP/dx Pa/m,mu:dynamic viscosity Pa s"
  data-result="Q"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Supply the signed numerical pressure gradient dP/dx; this calculator does not differentiate a function.">
</div>

## Surface Tension

<div style="text-align: center;">
<img src="upload_1d63c7a1edf88f0340de8c654e1631d8.png" alt="image" width="300">
</div>

$$2\gamma L = F_y$$

* suface tension per unit lenght : $\gamma$
* perimeter of the Object : $L$

<div style="text-align: center;">
<img src="upload_aa2167159f81dbc86eac8ffeb1038cf1.png" alt="image" width="200">
</div>

$$2\gamma L+V\rho = F_y+F_b = w$$

* The weight of an object supported by surface tension : $w$

$$\boxed{\gamma = \frac{2L}F}$$

<div
  data-calculator=""
  data-boxed-id="boxed-117"
  data-expression="2*L/F"
  data-inputs="L:length m,F:force N"
  data-result="gamma"
  data-unit=""
  data-constants=""
  data-note="Evaluates 2L/F exactly as printed, with result in m/N. Review the source before interpreting this as surface tension.">
</div>

## Lift and Drag

* **Lift**

$$\boxed{F_L = C_L(\frac12\rho A_N)u^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-118"
  data-expression="C_L*0.5*rho*A_N*u^2"
  data-inputs="C_L:lift coefficient,rho:density kg/m^3,A_N:reference area m^2,u:speed m/s"
  data-result="F_L"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* **Drag**

$$\boxed{F_D = C_D(\frac12\rho A_N)u^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-119"
  data-expression="C_D*0.5*rho*A_N*u^2"
  data-inputs="C_D:drag coefficient,rho:density kg/m^3,A_N:reference area m^2,u:speed m/s"
  data-result="F_D"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Coandă effect

<div style="text-align: center;">
<img src="upload_41a66533a23672fa27d624c24e2db346.png" alt="image" width="400">
</div>

The Coandă effect is the tendency of a fluid jet to stay attached to a surface of any form.

## Magnus Effect

<div style="text-align: center;">
<img src="upload_f4853887b3f56868c5fd388e111f9db2.png" alt="image" width="400">
</div>

* Linear motion

$$F_L =C_L(
\frac12\rho A_N)u^2 =  C_L(\frac12\rho A_N)v^2$$

* Linear motion and rotation

$$\boxed{F_L' = C_L(\frac12\rho A_N)(v+\omega r)^2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-120"
  data-expression="C_L*0.5*rho*A_N*(v+omega*r)^2"
  data-inputs="C_L:lift coefficient,rho:density kg/m^3,A_N:reference area m^2,v:speed m/s,omega:angular speed rad/s,r:radius m"
  data-result="F_L_prime"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

<div style="text-align: center;">
<img src="upload_6e8a7861124cbab3368c795dc379c8bb.png" alt="image" width="400">
</div>
