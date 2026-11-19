---
layout: base
---

# Ideal gas law

Gas equations of state relate pressure, volume, and temperature. This page begins with the ideal-gas model and then introduces corrections for nonideal behavior.

$$\boxed{PV = nRT}$$

<div
  data-calculator=""
  data-boxed-id="boxed-073"
  data-expression="n*R*T/P"
  data-inputs="n:amount mol,R:gas constant J/(mol K),T:absolute temperature K,P:absolute pressure Pa"
  data-result="V"
  data-unit="m^3"
  data-constants=""
  data-note="Solves the ideal-gas equation for volume V. Use positive absolute temperature and pressure; R is approximately 8.314462618 J/(mol K).">
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

This equation uses molar volume $V_m=V/n$ throughout. Its leading ideal-gas term is $RT/V_m$; the remaining terms are additive density corrections with fluid-specific coefficients.

$$\boxed{P = \frac{RT}{V_m}+\frac{B_0RT-A_0-C_0/T^2}{V_m^2}+\frac{bRT-a}{V_m^3}+\frac{a\alpha}{V_m^6}+\frac{c}{V_m^3T^2}\left(1+\frac{\gamma}{V_m^2}\right)e^{-\gamma/V_m^2}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-076"
  data-expression="R*T/V_m+(B_0*R*T-A_0-C_0/T^2)/V_m^2+(b*R*T-a)/V_m^3+a*alpha/V_m^6+c/(V_m^3*T^2)*(1+gamma/V_m^2)*e^(-gamma/V_m^2)"
  data-inputs="R:gas constant J/(mol K),T:temperature K,V_m:molar volume m^3/mol,B_0:coefficient m^3/mol,A_0:coefficient Pa m^6/mol^2,C_0:coefficient Pa m^6 K^2/mol^2,b:coefficient m^6/mol^2,a:coefficient Pa m^9/mol^3,alpha:coefficient m^9/mol^3,c:coefficient Pa m^9 K^2/mol^3,gamma:coefficient m^6/mol^2"
  data-result="P"
  data-unit="Pa"
  data-constants="e=2.718281828459045"
  data-note="Original eight-parameter Benedict-Webb-Rubin equation. V_m is molar volume (total volume divided by amount), not total volume. Use a consistent SI coefficient set for the fluid and its valid temperature/density range.">
</div>
