---
layout: base
---

# Water models

## Introduction

Realistic water environment is essential for accurate simulation of biological molecules.

 Two approaches to solvation:

 1. Add explicit water molecules.
 2. Treat water as a continuous medium instead of individual molecules.

### Continuum models

- Significantly faster than explicit solvation.
- Cannot reproduce the microscopic details of the protein–water interface.
- Do not produce same conformational ensembles as explicit water (salt bridges are over-stabilized, a higher-than-native alpha helix population).
- Useful for calculation of binding free energies or for flexible protein-protein docking.

Most molecular dynamics simulations are carried out with explicit water molecules.

#### Explicit models

- Typically water molecules account for over 80% of the particles in the simulation.
- Water–water interactions dominate the computational cost of such simulations.
- The water model needs to be fast and accurate.

- Explicit water models are empirical models derived to reproduce some bulk properties in a particular phase.
- None of water models accurately reproduce all of the key properties of bulk water.
- Which water model is optimal for the simulation depends on the desired properties of interest.

#### An early water model

![TIP3P water model](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/tip3p-points.svg)

- Rigid geometry closely matching actual water molecule.
- O-H and H-H distances are constrained with harmonic potential.
- Point charges replace electron density distribution.

#### How are water models derived?

A good water model must faithfully reproduce six bulk properties of water:

- Static dielectric constant, $\epsilon_{0}$
- Self diffusion coefficient, $\vec{D}$
- Heat of vaporization, $\Delta{H}_{vap}$
- Isobaric heat capacity, $\vec{C}_{p}$
- Thermal expansion coefficient, $\alpha_{p}$
- Isothermal compressibility, $\kappa_{T}$

Many water models with different level of complexity (the number of interaction points) have been developed. We will discuss only the models most widely used in simulations, and refer you to the excellent for an overview of all water models.

#### 3-charge 3-point models

- Three interaction points corresponding to the atoms of the water molecule.
- Only oxygen atom has Lennard-Jones parameters.
- 3-site models are commonly used because computationally they are highly efficient.

|||
|:-|:-:|
|**TIP3P (transferable intermolecular potential)**  <br><br>$\circ$  Rigid geometry closely matching actual water molecule.  | ![Water Models](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/tip3p.svg)|
|**SPC/E (simple point charge)**  <br><br>$\circ$  More obtuse tetrahedral angle of 109.47°.<br>$\circ$  Adds an average polarization correction to the potential energy function.<br>$\circ$  Reproduces density and diffusion constant better than the original SPC model. | ![Water Models](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/spce.svg)|

#### 3-charge 4-point models

- The negative charge is not centered on the oxygen atom, but shifted towards hydrogen atoms
- The position of charge is represented with the fourth dummy atom (EP)
- EP is located near the oxygen along the bisector of the HOH angle.

|||
|:-|:-:|
|**TIP4P-Ew**<br><br>$\circ$  Improves association/dissociation balance compared to 3-point models. | ![Water Models](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/tip4p.svg)|

#### Water models have their limitations

- Early water models were developed with cut-off of electrostatic interactions. Using these models with full electrostatic method results in stronger electrostatic interactions and consequently higher density.
- Most of the more complex new water models attempt to reproduce specific properties of a specific phase, but this comes at the expense of other properties.
- TIP3P model predicts hydration free energies of small neutral molecules more accurately than the TIP4PEw model.
- 4-charge 5-point model TIP5P predicts excellent water structure, but poor hydration energies.

#### Challenges in developing water models

![Charge distribution of the water molecule](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/water_charge_densityl.gif)

- Finding an accurate yet simplified description of the charge distribution that can adequately account for the hydrogen bonding in the liquid phase.
- Traditional approach is to place point charges on or near the nuclei.
- Electrostatic potential of water molecule is reproduced considerably more accurately with 3 point charges when they form tight cluster.

#### Optimal Point Charges (OPC and OPC3)

![Water Models](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/opc.svg)

- Designed without geometrical restraints.
- Considerably better reproduces the six bulk properties of water.

#### Polarizable water model OPC3-pol

- Polarization is usually achieved by adding model oscillators, referred to as Drude particles.
- Simulations of classical Drude oscillator are computationally expensive (self-consistent procedure).
- Drude water models require matching, polarizable force fields for biomolecules.

- OPC3-pol model treats the Drude particle as an "ordinary" atom in the molecular dynamics system
- Offers high computational efficiency
- Can be used with the existing biomolecular force fields

### Quality of different water models

- The test models in which the moments were close to the QM values had low quality.
- The models that scored better had moments very different from the QM moments.

![Quality scores of water models](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Water_models_quality_scores.gif)

The distribution of quality scores for different water models in the space of dipole (μ) and quadruple (QT) moments.

- Using only three point charges, is not sufficient to represent the charge distribution accurately.

### Performance Considerations

- Computation cost is proportional to the number of pairwise distances.
- 3-charge 3-point model: 9 distances
- 3-charge 4-site model: 10 distances (3x3 Coulomb interactions plus one VDW O–O interaction).

### Other things to consider

- Water models have traditionally only been parameterized for a single temperature of 298K (SPC/E, TIP3P, etc.)

>## Force Field Parameters of the common Water Models
>
>|     | TIP3P  | SPC/E   | TIP4P-Ew | OPC    | OPC3    |
>|---  |--------|---------|----------|--------|---------|
>|OH   | 0.9572 | 1.0     | 0.9572   | 0.8724 | 0.9789  |
>|HH   | 1.5136 | 1.63    | 1.5136   | 1.3712 | 1.5985  |
>|HOH  | 104.52 | 109.47  | 104.52   | 103.6  | 109.47  |
>|OM   | -      |  -      | 0.125    | 0.1594 |  -      |
>|A(12)| 582.0  |629.4    | 656.1    | 865.1  |  667.9  |
>|B(6) | 595.0  |625.5    | 653.5    | 858.1  |         |
>|qO   | −0.834 | −0.8476 | −1.04844 | −1.3582| -0.8952 |
>|qH   | +0.417 | +0.4238 | +0.52422 | +0.6791| +0.4476 |
>
> Nonbonded OPC3: sigma=1.7814990, epsilon=0.163406
