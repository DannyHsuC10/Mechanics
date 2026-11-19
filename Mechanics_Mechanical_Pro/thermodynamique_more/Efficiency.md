---
layout: base
---

# Efficiency

Efficiency compares useful output with the required input. The notes distinguish heat-engine efficiency, refrigeration performance, and ideal cycle models.

## Exergy

$$\text{Exergy} = (E_{int}-E_{int,0})+P_0(V-V_0)-T_0(S-S_0)+\frac12mv^2+mgh$$

$$=(E-E_0)+P_0(V-V_0)-T_0(S-S_0)$$

## Efficiency

$$\eta = \frac{W_{out}}{W_{in}} = 1-\frac{W_{lose}}{W_{in}}$$

* Compression ratio : $r$

$$r = \frac{V_{max}}{V_{max}}$$

* cut off ratio : $r_c$
the ratio of the volume of the cylinder at the end of combustion to the volume at the beginning of combustion

$$r_c = \frac{V_{end}}{V_{\text{beginning}}}$$

* Pressure ratio : $r_P$

$$r_P = \frac{P_{max}}{P_{max}}$$

* Temperature ratio : $r_T$
Minimum temperature is numerator !!!

$$r_T = \frac{T_{max}}{T_{max}}$$

### Carnot cycle efficiency

$$\boxed{\eta_{\text{carnot}} = 1-\frac{T_L}{T_H}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-066"
  data-expression="1-T_L/T_H"
  data-inputs="T_L:cold temperature K,T_H:hot temperature K"
  data-result="eta_carnot"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

### Otto cycle efficiency

Isentropic compression>>Isentropic endothermic>>Isentropic expansion>>Isentropic exothermic>>

$$\gamma = \frac{C_P}{C_V}$$

$$\boxed{\eta_{\text{otto}} = 1-\frac{1}{r^{\gamma-1}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-067"
  data-expression="1-1/r^(gamma-1)"
  data-inputs="r:compression ratio,gamma:heat capacity ratio"
  data-result="eta_otto"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

### Diesel cycle  efficiency

$$\boxed{\eta_{\text{diesel}} = 1-\frac{1}{r^{\gamma-1}}(\frac{r^\gamma_c-1}{\gamma(r_c-1)})}$$

<div
  data-calculator=""
  data-boxed-id="boxed-068"
  data-expression="1-1/r^(gamma-1)*(r_c^gamma-1)/(gamma*(r_c-1))"
  data-inputs="r:compression ratio,gamma:heat capacity ratio,r_c:cutoff ratio"
  data-result="eta_diesel"
  data-unit=""
  data-constants=""
  data-note="r_c means the cutoff ratio; r_c raised to gamma is used in the numerator. Efficiency is returned as a fraction.">
</div>

### Brayton cycle efficiency

$$\boxed{\eta_{\text{brayton}} = 1-\frac{1}{r_P^{(\gamma-1)/\gamma}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-069"
  data-expression="1-1/r_P^((gamma-1)/gamma)"
  data-inputs="r_P:pressure ratio,gamma:heat capacity ratio"
  data-result="eta_brayton"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

### Regen brayton cycle efficiency

$$\boxed{\eta_{\text{regen}} = 1-r_Tr_P^{(\gamma-1)/\gamma}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-070"
  data-expression="1-r_T*r_P^((gamma-1)/gamma)"
  data-inputs="r_T:temperature ratio,r_P:pressure ratio,gamma:heat capacity ratio"
  data-result="eta_regen"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

### Compressor efficiency

$$\boxed{\eta_C = \frac{W_{C,out}}{W_{C,in}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-071"
  data-expression="W_out/W_in"
  data-inputs="W_out:output work J,W_in:input work J"
  data-result="eta_C"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

### Turbine efficiency

$$\boxed{\eta_T=  \frac{W_{T,out}}{W_{T,in}}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-072"
  data-expression="W_out/W_in"
  data-inputs="W_out:output work J,W_in:input work J"
  data-result="eta_T"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Heat pumps, Refrigerators, Heat engines

### Refrigerators COP

$$COP_R = \frac{Q_L}{W}$$

### Heat pumps COP

$$COP_{HP} = \frac{Q_H}{W}$$

### Heat engines efficiency

$$\eta = \frac{W}{Q_H}$$

## Engine MEP(Mean effective pressure)

$$W = \int PdV$$

$$MEP = \frac{W}{V_{max}-V_{max}}$$

## Engine net force

* Net force

$$F = \dot m(\Delta v)$$

* Net power

$$P = \dot W = \dot m(\Delta v)v_{\text{vehicle}}$$
