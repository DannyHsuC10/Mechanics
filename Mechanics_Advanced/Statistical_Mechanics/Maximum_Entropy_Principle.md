---
layout: base
---

# Maximum Entropy Principle
Solving for the energy distribution of macroscopic systems

$$\boxed{\text{Probability distribution of microstates } {p_i}}$$

## Entropy

Entropy : $S$
heat : $Q$
temperature : $T$
Boltzmann constant : $k_B$
achievable phase space volume : $\Omega$

### Macrostate
$$dS = \frac{dQ}{T}$$

The cost of achieving uniform energy distribution in macroscopic systems
### Microstate
$$S = k_B\ln\Omega$$

The degree of uncertainty regarding the microscopic state.

## Limitations
* Do not assume information that is not given
* Do not favor any additional microstates
* Maintain maximum neutrality towards the unknown

### probability : $p$
The probability must meet the normalization condition.

$$\sum_i p_i = 1$$
### energy $E$
Using total energy as the boundary condition

$$\sum_i p_i E_i = U$$

### Gibbs entropy $S$

$$S(p) = -k_B \sum_i p_i \ln p_i$$

* probability : $p$
* Expected value : $\ln(p)$

## Lagrange multiplier

$$\sum_i p_i = 1,\quad\sum_i p_i E_i = U,\quad-k_B \sum_i p_i \ln p_i$$

Using the Lagrange multiplier, find the extreme value under the "constraints".

$$\Phi(p) = S(p)-\alpha\Big(\sum_i p_i - 1\Big)-\beta\Big(\sum_i p_i E_i - U\Big)$$

* $\alpha, \beta$：A comprehensive assessment of the conditions for mandatory merger.

### Calculus of variations

$$\frac{\partial \Phi}{\partial p_i} = 0$$

$$p_i \propto e^{-\beta E_i}$$

$$p_i = \frac{1}{Z} e^{-\beta E_i}$$

$$Z = \sum_i e^{-\beta E_i}$$

$$\beta = \frac{1}{k_B T}$$

## Energy probability distribution
In phase space, each microstate corresponds to a phase space point:

* The higher the energy of a state, the lower its probability of occurrence.
* Maximum entropy represents the largest volume of phase space it occupies.
* The Boltzmann distribution is not an assumption, but a necessary consequence of this principle.
* **The principle of maximum entropy is to allocate the most neutral probability of microstates in phase space under conditions of insufficient information, and thermal equilibrium is precisely the realization of this allocation in a physical system.**