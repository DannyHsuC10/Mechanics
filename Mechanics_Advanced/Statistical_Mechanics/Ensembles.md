---
layout: base
---

# Ensembles

Based on the principle of maximum entropy, different constraints are changed.

>The meaning of entropy : 
>The "unexpectedness" of an event.
Entropy is "how many ways a system could have grown to its current state under the constraints you impose."
The limiting version of "when the system is certain to fall into a certain microstate."

## Microcanonical Ensemble
### Concept
* completely isolated
### System Settings
fix : $E,N,V$

$$\sum p = 1\qquad E = \text{constant}$$

### result
$$p = \frac1{\Omega(E)}$$

$$dS = \frac{k_B}{p}$$
### entropy
$$S = k_B\ln(\frac1p)$$

## Canonical Ensemble
### Concept
* Contact with a hot bath
* Energy can be exchanged
* Temperature is constant
* Particle number is constant
### System Settings
fix : $T,N,V$

$$\sum p = 1\qquad E = \sum p_iE_i$$

### result
$$p = \frac{1}{Z}e^{-\beta E}$$

$$Z = \sum_ie^{-\beta E_i}$$

$$\beta = \frac1{k_BT}$$

$$F = -k_BT\ln(Z)$$
### entropy

$$S = -k_B\sum p_i\ln(\frac1{p_i})$$

## Grand Canonical Ensemble
### Concept
* Fully open

### System Settings
fix : $T,\mu,V$

$$\sum_{i,N} p_{i,N} = 1$$

$$\sum_{i,N}p_{i,N}E_{i,N} = E$$

$$\sum_{i,N}p_{i,N}N = N$$
### result
$$p_{i,N} = \frac{1}{\Xi}e^{-\beta(E_{i,N}-\mu N)}$$

$$\mu = (\frac{\partial F}{\partial N})_{T,N}$$

$$\Xi = \sum_{N = 0}^\infty\sum_ie^{-\beta(E_{i,N}-\mu N)}$$