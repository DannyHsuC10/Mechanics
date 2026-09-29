---
layout: base
---

# Ideal gas law

Gas equations of state relate pressure, volume, and temperature. This page begins with the ideal-gas model and then introduces corrections for nonideal behavior.

$$\boxed{PV = nPT}$$

<div
  data-calculator=""
  data-boxed-id="boxed-073"
  data-expression="n*T"
  data-inputs="n:amount as written,T:temperature as written"
  data-result="V (for nonzero P)"
  data-unit=""
  data-constants=""
  data-note="The source reads PV = nPT. For nonzero P it gives V = nT; this is not the usual ideal-gas equation. Review the source before physical use.">
</div>

## Improve accuracy

$$PV = ZnRT$$

$$Z = \frac{V_\text{actual}}{V_\text{ideal}}$$

## Improve accuracy(Van der Waal)

* Critical temperature : $T_{Cr}$
* Critical pressure : $P_{Cr}$

$$\boxed{(P+\frac a{v^2})(v-b) = nRT}$$

<div
  data-calculator=""
  data-boxed-id="boxed-074"
  data-expression="n*R*T/(v-b)-a/v^2"
  data-inputs="n:amount mol,R:gas constant,T:temperature K,v:volume as defined,b:volume correction,a:attraction coefficient"
  data-result="P"
  data-unit=""
  data-constants=""
  data-note="Solves the displayed equation for P. Keep the volume and correction coefficients in a consistent unit system; v must differ from b.">
</div>

$$a = \frac{27nR^2T^2_{Cr}}{64P_{Cr}}$$

$$b = \frac{nRT_{Cr}}{8P_{Cr}}$$

## Improve accuracy(Beattie Bridgeman)

$$\boxed{P = \frac{nRT}{V^2}(1-\frac c{VT^3})(V+B)-m\frac A{V^2}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-075"
  data-expression="n*R*T/V^2*(1-c/(V*T^3))*(V+B)-m*A/V^2"
  data-inputs="n:amount,R:gas constant,T:temperature,V:volume,c:coefficient,B:coefficient,m:amount factor,A:coefficient"
  data-result="P"
  data-unit=""
  data-constants=""
  data-note="Uses every factor exactly as printed. Supply coefficients in the unit system of this equation.">
</div>

$$A = A_0(1-a/V)$$

$$B = B_0(1-b/V)$$

## Improve accuracy(Benedict Webb Rubin)

$$\boxed{P = \frac{RT}{V^2}(B_0RT-A_0-\frac{C_0}{T^2})\frac{1}{V^2}+\frac{bRT-a}{v^3}+\frac{a\alpha}{V^6}+\frac c{V^3T^2}(1+\frac{\gamma}{v^2})e^{-\gamma/V^2}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-076"
  data-expression="R*T/V^2*(B_0*R*T-A_0-C_0/T^2)/V^2+(b*R*T-a)/v^3+a*alpha/V^6+c/(V^3*T^2)*(1+gamma/v^2)*e^(0-gamma/V^2)"
  data-inputs="R:gas constant,T:temperature,V:uppercase volume,B_0:coefficient,A_0:coefficient,C_0:coefficient,b:coefficient,a:coefficient,v:lowercase volume,alpha:coefficient,c:coefficient,gamma:coefficient"
  data-result="P"
  data-unit=""
  data-constants="e=2.718281828459045"
  data-note="Uses every factor exactly as printed. Uppercase V and lowercase v are separate inputs; verify the notation and coefficient units.">
</div>
