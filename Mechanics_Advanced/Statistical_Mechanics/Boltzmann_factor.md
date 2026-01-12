---
layout: base
---

# Boltzmann factor & probability distribution

## Boltzmann factor

### Ensembles limit

$$\sum p = 1$$

$$\sum pE = E$$
### Definition of entropy

$$S = k_B \ln(\frac1p)$$

$$S(p) = k_B\sum p\ln p$$
### generic functions
$$\Phi = k_B\sum p\ln p-\alpha(\sum p-1)-\beta(\sum pE-E)$$

$$\frac{\partial \Phi}{\partial p} = 0$$

$$\frac{\partial}{\partial p} = (k_B p\ln p -k_B\ln(p-1))$$

$$-k_B(\ln p+1)-\alpha-\beta E = 0$$

$$\ln p = -1-\frac\alpha{k_B}-\frac\beta{k_B}E$$

$$P = e^{-1-\alpha/k_B}e^{-(\beta/k_B)E}$$

$$Z = e^{1+\alpha/k_B}$$

$$P = \frac1Ze^{-\beta E}$$
### probability distribution
$$\beta' = \frac\beta{k_B}$$

$$\frac1T = \frac{\partial S}{\partial E}$$

$$\beta = \frac1{k_BT}$$

$$P = \frac1Ze^{-E/k_BT}$$

**continuous**

$$P = \frac1Ze^{-\beta H}$$
### Boltzmann factor $e^{-\beta}$
$$E\overbrace{\ \Longrightarrow\ }^{e^{-\beta}}\text{probability weight}$$

Energy >> Probability Converter

## Langevin equation
Environmental average effect + random disturbance result.

* damping : $-\gamma v$
* force : $-\nabla v$
* disturbance : $\xi(t)$

$$m\dot v = -\gamma v-\frac{dv}{dx}+\xi(t)$$

$$\xi(t)\xi(t)' = 2\gamma k_BT\Delta(t-t')$$

Random but probabilistic results.

## Falk-Planck equations
* probability : $P$

$$\frac{\partial P}{\partial t} = \frac\partial{\partial x}(\frac1\gamma\frac{dV}{dx}P)+\frac{k_BT}{\gamma}\frac{\partial^2P}{\partial x^2}$$

* Noise diffusion : $\frac{\partial^2}{\partial x^2}\text{disturbance}$
* Force Flow : $\frac\partial{\partial x}\text{drift}$

## Free energy
Integrating the probability distribution of the Canonical ensemble.
$$F(P) = \int dx P(x,t)(V(x)+kT\ln P(x,t))$$

* Probability (not pressure) : $P(x,t)$
* Average Energy : $V(x)$
* $-TS$ : $kT\ln P(x,t)$

$$\frac{dF}{dt} \le 0$$
### Minimum
$$\Delta F = 0$$

$$P(x) \propto e^{-\beta V(x)}$$