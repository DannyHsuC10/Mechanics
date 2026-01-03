---
layout: base
---

# Efficiency

## Exergy

$$\text{Exergy} = (E_{int}-E_{int,0})+P_0(V-V_0)-T_0(S-S_0)+\frac12mv^2+mgh$$

$$=(E-E_0)+P_0(V-V_0)-T_0(S-S_0)$$

## Efficiency

$$\eta = \frac{W_{out}}{W_{in}} = 1-\frac{W_{lose}}{W_{in}}$$

* Compression ratio : $r$
$$r = \frac{V_\max}{V_\min}$$
* cut off ratio : $r_c$
the ratio of the volume of the cylinder at the end of combustion to the volume at the beginning of combustion
$$r_c = \frac{V_{end}}{V_{\text{beginning}}}$$
* Pressure ratio : $r_P$
$$r_P = \frac{P_\max}{P_\min}$$
* Temperature ratio : $r_T$
Minimum temperature is numerator !!!

$$r_T = \frac{T_\min}{T_\max}$$

### Carnot cycle efficiency

$$\eta_{\text{carnot}} = 1-\frac{T_L}{T_H}$$

### Otto cycle efficiency

Isentropic compression>>Isentropic endothermic>>Isentropic expansion>>Isentropic exothermic>>
$$\gamma = \frac{C_P}{C_V}$$

$$\eta_{\text{otto}} = 1-\frac{1}{r^{\gamma-1}}$$

### Diesel cycle  efficiency

$$\eta_{\text{diesel}} = 1-\frac{1}{r^{\gamma-1}}(\frac{r^\gamma_c-1}{\gamma(r_c-1)})$$

### Brayton cycle efficiency

$$\eta_{\text{brayton}} = 1-\frac{1}{r_P^{(\gamma-1)/\gamma}}$$

### Regen brayton cycle efficiency

$$\eta_{\text{regen}} = 1-r_Tr_P^{(\gamma-1)/\gamma}$$

### Compressor efficiency

$$\eta_C = \frac{W_{C,out}}{W_{C,in}}$$

### Turbine efficiency

$$\eta_T=  \frac{W_{T,out}}{W_{T,in}}$$

## Heat pumps, Refrigerators, Heat engines

### Refrigerators COP

$$COP_R = \frac{Q_L}{W}$$

### Heat pumps COP

$$COP_{HP} = \frac{Q_H}{W}$$

### Heat engines efficiency

$$\eta = \frac{W}{Q_H}$$

## Engine MEP(Mean effective pressure)

$$W = \int PdV$$

$$MEP = \frac{W}{V_\max-V_\min}$$

## Engine net force

* Net force
$$F = \dot m(\Delta v)$$
* Net power
$$P = \dot W = \dot m(\Delta v)v_{\text{vehicle}}$$
