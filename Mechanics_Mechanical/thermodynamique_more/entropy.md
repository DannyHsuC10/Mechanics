---
layout: base
---

# Entropy

$$dS = dQ/T$$

$$Q = mC\ dT$$

* Heat : $Q$
Heat is energy transferred quantity

## Pure Substance

* Any process
$$\Delta S = S_f-S_i$$
* Isentropic process
$$S_i = S_f$$

## Incompressible

* Any process

$$S = \int^{T_f}_{T_i}\frac{mC}{T}dT$$

$$S = mC\ln(\frac{T_f}{T_i})$$

* Isentropic process
$$T_i = T_f$$

## Ideal gas(fixed specific heat)

$$Q = E_{int}+W = mC\ T+PV$$

$$dQ = dE_{int}+dW = mC\ dT+PdV$$

$$C_P/C_V = \gamma$$

* Any process

$$S = C_V\ln(\frac{T_f}{T_i})+R\ln(\frac{V_f}{V_i})$$

$$S = C_P\ln(\frac{T_f}{T_i})+R\ln(\frac{P_f}{P_i})$$

* Isentropic process

when $Q = 0$

$$dE_{int} = -dW$$

$$nC_V\ dT = -PdV$$

$$PV = nRT$$

$$nC_V\ dT = -\frac{nRT}{V}dV$$

$$C_V\frac{dT}{T} = -R\frac{dV}{V}$$

$$C_V\int_{T_i}^{T_f}\frac{dT}{T} = -R\int_{V_i}^{V_f}\frac{dV}{V}$$

$$C_V\ln(\frac{T_i}{T_f}) = (C_P-C_V)\ln(\frac{V_f}{V_i})$$

$$\ln(\frac{T_i}{T_f}) = (\frac{C_P}{C_V}-1)\ln(\frac{V_f}{V_i})$$

$$(\frac{T_i}{T_f}) = (\frac{V_f}{V_i})^{\gamma-1}$$

$$(T_fV_f^{\gamma-1}) = (T_iV_i^{\gamma-1})$$

$$TV^{\gamma-1} = \text{constant}$$

$$PV = nRT$$

$$T = (PV)/(nR)$$

$$(\frac{PV}{nR})V^{\gamma-1} = \text{constant}$$

$$(\frac{P}{nR})V^{\gamma} = \text{constant}$$

$$n\ \And\ R\ = \text{constant}$$

$$PV = \text{co}$$

$$P_iV_i^{\gamma} = P_fV_f^{\gamma}$$

$$(\frac{P_f}{P_i}) = (\frac{V_i}{V_f})^{\gamma}$$

$$(\frac{P_f}{P_i})^{1/\gamma} = (\frac{V_i}{V_f})$$

$$(\frac{T_f}{T_i}) = ((\frac{P_f}{P_i})^{1/\gamma})^{\gamma-1}$$

$$(\frac{T_f}{T_i}) = (\frac{P_f}{P_i})^{(\gamma-1)/\gamma}$$

## Ideal gas(unfixed specific heat)

* Any process
Entropy change due to temperature change : $S_f^0-S_i^0$
Entropy change due to pressure change : $-R\ln(\frac{P_i}{P_f})$
$$S^0 = \int^T_{T_{ref}}\frac{C_p}TdT$$

$$S_f-S_i = S_f^0-S_i^0-R\ln(\frac{P_i}{P_f})$$

* Isentropic process

$$0= S_f^0-S_i^0-R\ln(\frac{P_i}{P_f})$$

$$S_f^0 = S_i^0-R\ln(\frac{P_i}{P_f})$$

## Ideal gas work

* Isentropic process

constant : $C$
$$PV^\gamma = C$$

$$P = CV^{-\gamma}$$

$$W = \int^{V_f}_{V_i}CV^{-\gamma}dV$$

$$\int = V^{-\gamma}dV = \frac{V^{(-\gamma+1)}}{-\gamma+1}$$

$$W = \frac C{1-\gamma}(V_f^{1-\gamma}-V_i^{1-\gamma})$$

$$C = P_iV_i^\gamma = P_fV_f^\gamma$$

$$W = \frac 1{1-\gamma}(P_iV_i^\gamma V_f^{1-\gamma}-P_fV_f^\gamma V_i^{1-\gamma})$$

$$W = \frac 1{1-\gamma}(P_fV_f-P_iV_i)$$

$$PV = nRT$$

$$W = \frac 1{1-\gamma}(nRT_f-nRT_i)$$

$$W = \frac{\gamma nR T_i}{\gamma-1} (1 - \frac{T_f}{T_i})$$

$$(\frac{T_f}{T_i}) = (\frac{P_f}{P_i})^{(\gamma-1)/\gamma}$$

$$W = \frac{\gamma nR T_i}{\gamma-1} (1 - (\frac{P_f}{P_i})^{(\gamma-1)/\gamma})$$

$$W = \frac{\gamma nR(T_i-T_f)}{\gamma-1} = \frac{\gamma nRT_i}{\gamma-1}((\frac{P_f}{P_i})^{(\gamma-1)/\gamma}-1)$$

* Polytropic process

$$PV^n = C$$

$$W = \frac{nR(T_i-T_f)}{n-1} = \frac{nRT_i}{n-1}((\frac{P_f}{P_i})^{(n-1)/n}-1)$$

* Isothermal process

$$PV = nRT$$

$$P = nRT/V$$

$$W = \int PdV = nRT\int\frac{dV}V$$

$$W = nRT\int^{P_f}_{P_i}\frac{dV}V$$

$$W = nRT\ln(\frac{P_f}{P_i})$$

## Adiabatic efficiency

$$\eta = \frac {E_{out}}{E_{\text{Isentropic }}}$$

$$\Delta S = S_{in}-S_{out}+S_{gen}$$

$$dS/dt = \dot S_{in}-\dot S_{out}+\dot S_{gen}$$
