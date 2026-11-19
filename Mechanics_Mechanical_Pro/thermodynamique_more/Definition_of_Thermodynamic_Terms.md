---
layout: base
---

# Definition of Thermodynamic Terms

This reference introduces quantities used to describe heat transfer and thermodynamic state. Distinguish energy stored in a system from energy transferred as heat or work.

* Heat (a form of energy transfer) : $Q$

$$\Delta E = Q$$

* Latent heat (heat absorbed or released by a unit mass of a substance when a phase change occurs, without changing the temperature) : $L$

$$\boxed{Q = mL}$$

<div
  data-calculator=""
  data-boxed-id="boxed-063"
  data-expression="m*L"
  data-inputs="m:mass kg,L:latent heat J/kg"
  data-result="Q"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* Specific heat (the ease with which a unit mass of a substance changes its temperature by the amount of heat absorbed or released without a phase change) : $C$

$$\boxed{Q = mC\Delta T}$$

<div
  data-calculator=""
  data-boxed-id="boxed-064"
  data-expression="m*C*delta_T"
  data-inputs="m:mass kg,C:specific heat J/(kg K),delta_T:temperature change K"
  data-result="Q"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* Enthalpy (internal energy and mechanical energy generated, is the ability of the system to store energy) : $H$
if $\Delta P = 0$ then $\Delta H = Q$

$$\boxed{H = E_{int}+PV}$$

<div
  data-calculator=""
  data-boxed-id="boxed-065"
  data-expression="E_int+P*V"
  data-inputs="E_int:internal energy J,P:pressure Pa,V:volume m^3"
  data-result="H"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* Internal energy (the sum of the kinetic energy and potential energy of the molecules in the entire system, and the change in internal energy is the amount of heat added to the system minus the work done by the system) : $E_{int}$

* Potential Energy : $U$
* Kinetic energy : $K$

$$E_{int} = K+U$$

$$\Delta E_{int} = Q-W$$

| system |   Closed   |    Open    |
|:------:|:----------:|:----------:|
|  $Q$   | $Q = H+PV$ | $Q = H+PV$ |

* If it's an open system, it needs to increase the energy used for flow.

* Entropy (how much energy changes affect the temperature of a system, and also a measure of the degree of energy disorder) : $S$

$$dS = dQ/T$$

* Isochoric specific heat (all heat enters the system and becomes internal energy at equal volumes) : $C_V$

$$C_V = (\frac{\partial Q}{\partial T})_V= (\frac{\partial E_{int}}{\partial T})_V$$

$$C_V = T(\frac{\partial S}{\partial T})_V$$

* Isobaric specific heat (because at constant pressure, part of the heat input will become work (expansion) rather than internal energy) : $C_P$

$$C_P = (\frac{\partial Q}{\partial T})_P$$

$$C_P = T(\frac{\partial S}{\partial T})_P$$
