---
layout: base
---

# barostats

## Introduction

The role of pressure control algorithms is to keep pressure in the simulation system constant or to apply an external stress to the simulated system.

- Pressure is kept on its target value by adjusting the volume of a periodic simulation system.
- Pressure is a force exerted by collision of particles with the walls of a closed container.
- The virial equation is used to obtain the pressure:

$${P}=\frac{NK_{B}T}{V}+\frac{1}{3V}(\sum\{r_{ij}F_{ij})$$

- The first term in this equation describes pressure of an ideal gas (no interaction between molecules)
- The second contribution comes from internal forces acting on each atom.
- Well suited for MD because forces are evaluated at each simulation step.

## Pressure Control Algorithms

- Regulate pressure by adjusting the volume
- In practice barostats do that by scaling coordinates of each atom by a small factor.
- The methods of maintaining pressure fall into four categories:

1. Weak coupling methods
2. Extended system methods
3. Stochastic methods
4. Monte-Carlo methods

### 1. Weak coupling methods

#### Berendsen pressure bath coupling

- Conceptually similar to Berendsen thermostat.
- Available in all simulation packages.
- Change the volume by an increment proportional to the difference between the internal pressure and pressure in a weakly coupled bath.
- Very efficient in equilibrating the system.

##### Downsides

- Does not sample the exact NPT statistical ensemble.
- Induces artifacts into simulations of inhomogeneous systems such as aqueous biopolymers or liquid/liquid interfaces.
- Should be avoided for production MD simulations.

The time constant for pressure bath coupling is the main parameter of the Berendsen thermostat. The pressure of the system is corrected such that the deviation exponentially decays with a lifetime defined by this constant.

### 2. Extended system methods

- Extended system methods originate from the classical theoretical work of Andersen
- He included an additional degree of freedom, the volume of a simulation cell.
- Volume adjusts itself to equalize the internal and external pressure.
- Volume serves as a piston, and is given a fictitious "mass" controlling the decay time of pressure fluctuations.
- Extended system methods are time-reversible. They can be used to integrate backwards, for example, for transition path sampling.

#### Parrinello-Rahman barostat

- Extension of the Andersen method allowing changes in the shape of the simulation cell
- Further extended to include external stresses
- Useful to study structural transformations in solids under external stress.
- Equations of motion are similar to Nosé-Hoover barostat, and in most cases it is used with the Nosé-Hoover thermostat.

##### Downsides

- Volume may oscillate with the frequency proportional to the piston mass.

#### Nosé-Hoover barostat

- First application of the method analogous to Andersen's barostat for molecular simulation
- The Nosé-Hoover equations of motion are only correct in the limit of large systems.

#### MTTK(Martyna-Tuckerman-Tobias-Klein) barostat

- Extension of the Nosé-Hoover and Nosé-Hoover chain thermostat, performs better for small systems

### 3. Stochastic methods

#### Langevin piston pressure control

- Based on Langevin thermostat.
- The equations of motion resemble MTTK equations.
- An additional damping (friction) force and stochastic force are introduced.
- Random collisions eliminate oscillation of the volume associated with the piston mass.

![Comparison of Barostats](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/barostats_comp.png)

#### Stochastic Cell Rescaling

- Improved version of the Berendsen barostat.
- Adds stochastic term to rescaling matrix.
- Produces correct fluctuations of local pressure for NPT ensemble.
- Pressure converges fast without oscillations.
- Can be used for all stages of MD, including production.

### 4. Monte-Carlo pressure control

- Recently several efficient Monte Carlo methods have been introduced
- Sample volume fluctuations at a predefined number of steps at a given constant external pressure
- Generate a random volume change, evaluate the potential energy. The volume move is then accepted with the standard Monte-Carlo probability.
- Do not compute virial, so pressure is not available at the runtime, and not printed in energy files

## Pitfalls

- If the difference between the target and the real pressure is large, the program will try to adjust the density too quickly.
- Rapid change of the system size may lead to simulation crash.
- To ensure stability of a simulation volume must be adjusted very slowly with a small likely
