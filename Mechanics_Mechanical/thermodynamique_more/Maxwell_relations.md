---
layout: base
---

# Maxwell relations

## Gibbs–Helmholtz equation

* Internal energy : $E_{int}$
$$dE_{int} = TdS-PdV$$
* Enthalpy : $H$
$$dH = TdS+PdV$$
* Helmholtz Free Energy : $F$
$$dF = -SdT-PdV$$
Gibbs Free Energy : $G$
$$dG = -SdT+VdP$$

## Maxwell relations

$$(\frac{\partial T}{\partial V})_S = -(\frac{\partial P}{\partial S})_V$$

$$(\frac{\partial T}{\partial P})_S = (\frac{\partial V}{\partial S})_P$$

$$(\frac{\partial S}{\partial V})_T = (\frac{\partial P}{\partial T})_V$$

$$(\frac{\partial S}{\partial P})_T = -(\frac{\partial V}{\partial T})_P$$

$$dE_{int} = T\,dS - P\,dV$$

$$\left( \frac{\partial T}{\partial V} \right)_S = \frac{\partial}{\partial V} \left( \frac{\partial E_{int}}{\partial S} \right)_V$$

$$\left( \frac{\partial P}{\partial S} \right)_V = \frac{\partial}{\partial S} \left( \frac{\partial E_{int}}{\partial V} \right)_S$$

$$\left( \frac{\partial T}{\partial V} \right)_S = - \left( \frac{\partial P}{\partial S} \right)_V$$

****

$$dH = T\,dS + V\,dP$$

$$\left( \frac{\partial T}{\partial P} \right)_S = \frac{\partial}{\partial P} \left( \frac{\partial H}{\partial S} \right)_P$$

$$\left( \frac{\partial V}{\partial S} \right)_P = \frac{\partial}{\partial S} \left( \frac{\partial H}{\partial P} \right)_S$$

$$\left( \frac{\partial T}{\partial P} \right)_S =  \left( \frac{\partial V}{\partial S} \right)_P$$

****

$$dF = -S\,dT - P\,dV$$

$$\left( \frac{\partial S}{\partial V} \right)_T = \frac{\partial}{\partial V} \left( -\frac{\partial F}{\partial T} \right)_V
= -\frac{\partial^2 F}{\partial V \partial T}$$

$$\left( \frac{\partial P}{\partial T} \right)_V = \frac{\partial}{\partial T} \left( \frac{\partial F}{\partial V} \right)_T
= \frac{\partial^2 F}{\partial T \partial V}$$

$$\left( \frac{\partial S}{\partial V} \right)_T =  \left( \frac{\partial P}{\partial T} \right)_V$$

****

$$dG = -S\,dT + V\,dP$$

$$\left( \frac{\partial S}{\partial P} \right)_T = \frac{\partial}{\partial P} \left( -\frac{\partial G}{\partial T} \right)_P
= -\frac{\partial^2 G}{\partial P \partial T}$$

$$\left( \frac{\partial V}{\partial T} \right)_P = \frac{\partial}{\partial T} \left( \frac{\partial G}{\partial P} \right)_T
= \frac{\partial^2 G}{\partial T \partial P}$$

$$\left( \frac{\partial S}{\partial P} \right)_T = - \left( \frac{\partial V}{\partial T} \right)_P$$

## Clausius–Clapeyron equation
Changes rate in pressure and temperature during phase transition
$$G_{gas} = G_{liquid}$$
* latent heat : $L$

$$dG = -S\,dT + V\,dP$$

$$-S_{gas}\,dT + V_{gas}\,dP = -S_{liquid}\,dT + V_{liquid}\,dP$$

$$(V_{gas}-V_{liquid})dT = (S_{gas}-S_{liquid})dP$$

$$\frac{dP}{dT} = \frac{\Delta S}{\Delta V}$$

$$\Delta S = \frac{L}{T}$$

$$\frac{dP}{dT} = \frac{L}{T\Delta V}$$

$$PV = nRT$$

$$V = \frac{nRT}{P}$$

$$\frac{dP}{dT} = \frac{L}{T\frac{nRT}{P}} = \frac{LP}{nRT^2}$$

$$\int_{P_1}^{P_2}\frac{dP}{P} = \int_{T_1}^{T_2}\frac{LdT}{nRT^2}$$

$$\ln(\frac{P_2}{P_1}) = \frac{L}{R}(\frac1{T_2}-\frac1{T_1})$$

$$\ln(\frac{P_2}{P_1}) = \frac{L}{R}(\frac{\Delta T}{T_1T_2})$$

## Internal energy, entropy, enthalpy(with Specific Heat)

$$dE_{int} = TdS-PdV$$

$$dS = (\frac{\partial S}{\partial T})_VdT+(\frac{\partial S}{\partial V})_TdV$$

$$dE_{int} = T(\frac{\partial S}{\partial T})_VdT+T(\frac{\partial S}{\partial V})_TdV-PdV$$

$$C_V = T(\frac{\partial S}{\partial T})_V$$

$$dE_{int} = C_VdT+T(\frac{\partial S}{\partial V})_TdV-PdV$$

$$(\frac{\partial S}{\partial V})_T = (\frac{\partial P}{\partial T})_V$$

$$dE_{int} = C_VdT+(T(\frac{\partial P}{\partial T})_V-P)dV$$

$$dH = TdS+VdP$$

$$dS = (\frac{\partial S}{\partial T})_PdT+(\frac{\partial S}{\partial V})_TdP$$

$$(\frac{\partial S}{\partial T})_P = \frac{C_P}{T}$$

$$(\frac{\partial S}{\partial P})_T = -(\frac{\partial V}{\partial T})_P$$

$$TdS = C_PdT-T(\frac{\partial V}{\partial T})_PdP$$

$$dH = C_PdT-T(\frac{\partial V}{\partial T})_PdP+VdP$$

$$dH = C_PdT+(V-T(\frac{\partial V}{\partial T})_P)dP$$

$$dE_{int} = TdS-PdV$$

$$TdS = dE_{int}+PdV$$

$$dE_{int} = (\frac{\partial E_{int}}{\partial T})_VdT+(\frac{\partial E_{int}}{\partial V})_TdV$$

$$dE_{int} = C_VdT+(\frac{\partial E_{int}}{\partial V})_TdV$$

$$TdS = C_VdT+(\frac{\partial E_{int}}{\partial V})_TdV+PdV$$

$$T(\frac{\partial P}{\partial T})_V = (\frac{\partial E_{int}}{\partial V})_T+P$$
***
Why?
$$dE_{int} = (\frac{\partial E_{int}}{\partial T})_VdT+(\frac{\partial E_{int}}{\partial V})_TdV$$

$$TdS = dE_{int}+PdV$$

$$dS = \frac{dE_{int}}T+\frac{PdV}T$$

$$dS = (\frac{\partial S}{\partial T})_VdT+(\frac{\partial S}{\partial V})_TdV$$

$$(\frac{\partial S}{\partial T})_VdT+(\frac{\partial S}{\partial V})_TdV = \frac{dE_{int}}T+\frac{PdV}T$$

$$(\frac{\partial S}{\partial V})_T = \frac{dE_{int}}{TdV}+\frac{P}T$$

$$\left( \frac{\partial S}{\partial V} \right)_T =  \left( \frac{\partial P}{\partial T} \right)_V$$

$$T(\frac{\partial P}{\partial T})_V = (\frac{\partial E_{int}}{\partial V})_T+P$$
***
$$dS = \frac{C_V}{T}dT+(\frac{\partial P}{\partial T})_VdV$$

$$dS = (\frac{\partial S}{\partial T})_PdT+(\frac{\partial S}{\partial V})_TdP$$

$$C_P = T(\frac{\partial S}{\partial T})_P$$

$$(\frac{\partial S}{\partial P})_T = -(\frac{\partial V}{\partial T})_P$$

$$dS = \frac{C_P}{T}dT-(\frac{\partial V}{\partial T})_PdP$$

## Specific Heat
$$T(\frac{\partial P}{\partial T})_V = (\frac{\partial E_{int}}{\partial V})_T+P$$

$$(\frac{\partial E_{int}}{\partial V})_T =T(\frac{\partial P}{\partial T})_V -P$$

$$C_V = (\frac{\partial Q}{\partial T})_V= (\frac{\partial E_{int}}{\partial T})_V$$

$$(\frac{\partial C_V}{\partial V})_T = (\frac\partial{\partial V})(\frac{\partial E_{int}}{\partial T})_{V,T}$$

$$(\frac{\partial C_V}{\partial V})_T = (\frac\partial{\partial T})(T(\frac{\partial P}{\partial T})_V -P)_{V,T}$$

$$(\frac{\partial C_V}{\partial V})_T = T(\frac{\partial^2 P}{\partial T^2})_V$$

$$(\frac{\partial C_P}{\partial P})_T = T(\frac{\partial^2 V}{\partial T^2})_P$$

$$C_P-C_{P0} = -T\int_0^P(\frac{\partial^2 V}{\partial T^2})_PdP$$

$$C_P-C_V = -T(\frac{\partial V}{\partial T})^2_P(\frac{\partial P}{\partial V})_P = \frac{VT\beta^2}{\alpha}$$
* Mayer relation

$$\beta = \frac1V(\frac{\partial V}{\partial T})_P$$

$$\alpha = -(\frac{\partial P}{\partial V})_T$$

## Joule–Thomson effect
$$\mu_{JT} = (\frac{\partial T}{\partial P})_H$$

$$\mu_{JT} = -\frac1{C_P}(V-T(\frac{\partial V}{\partial T})_P)$$
