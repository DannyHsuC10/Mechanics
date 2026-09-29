---
layout: base
---

# Fast Methods to Evaluate Forces

## Challenges in calculation of non bonded interactions

- The number of non-bonded interactions increases as the square of the number of atoms.
- The most computationally demanding part of a molecular dynamics simulation is the calculation of the non-bonded interactions.
- Simulation can be significantly accelerated by limiting the number of evaluated non bonded interactions.
- Exclude pairs of atoms separated by long distance.
- Maintain a list of all particles within a predefined cutoff distance of each other.

## Neighbour Searching Methods

- Divide simulation system into grid cells - cell lists.
- Compile a list of neighbors for each particle by searching all pairs - Verlet lists.

### Cell Lists

- Divide the simulation domain into cells with edge length greater or equal to the cutoff distance.
- Interaction potential of a particle is the sum of the pairwise interactions with all other particles in the same cell and all neighboring cells.

![Figure: Grid-cell lists](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Grid_list.png)

### Verlet Lists

- Verlet list stores all particles within the cutoff distance plus some extra buffer distance.
- All pairwise distances must be evaluated.
- List is valid until any particle has moved more than half of the buffer distance.

![Figure: Verlet lists](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Verlet_list.png)

- Efficient computation of pairwise interactions.
- Relatively large memory requirement.
- In practice, almost all simulations use a combination of spatial decomposition and Verlet lists.

## Problems with Truncation of Lennard-Jones Interactions and How to Avoid Them?

- LJ potential is always truncated at the cutoff distance.
- Truncation introduces a discontinuity in the potential energy.
- A sharp change in potential may result in nearly infinite forces.

![Cutoff Methods](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Cutoff_Methods.svg)

### How to Choose the Appropriate Cutoff Distance?

- A common practice is to truncate at 2.5 $\sigma$.
- At this distance, the LJ potential is about 1/60 of the well depth $\epsilon$.
- The choice of the cutoff distance depends on the force field and atom types.

For example for the O, N, C, S, and P atoms in the AMBER99 force field the values of $\sigma$ are in the range 1.7-2.1,  while for the Cs ions  $\sigma=3.4$. Thus the minimum acceptable cutoff, in this case, is 8.5.

- Increasing cutoff does not necessarily improve accuracy.
- Each force field has been developed using a certain cutoff value, and effects of the truncation were compensated by adjustment of some other parameters.
- To ensure consistency and reproducibility of simulation you should choose the cutoff appropriate for the force field:

Table 1. Cutoffs Used in Development of the Common Force Fields

| AMBER | CHARMM  |  GROMOS   | OPLS |
|:-----:|:-------:|:---------:|:----:|
| 8 <span>&#8491;</span>, 10 <span>&#8491;</span> (ff19SB) | 12 <span>&#8491;</span> | 14 <span>&#8491;</span> | 11-15 <span>&#8491;</span> (depending on a molecule size)

#### Properties that are very sensitive to the choice of cutoff

For such quantities even a cutoff at 2.5 $ \sigma $ gives inaccurate results, and in some cases the cutoff larger than 6 $ \sigma $ was required for reliable simulations

#### Effect of cutoff on energy conservation

- Short cutoff may lead to an increase in the temperature of the system over time.
- The best practice is to carry out trial simulations without temperature control to test it for energy leaks or sources before a production run.

## Truncation of the Electrostatic Interactions

- The electrostatic interaction is divided into two parts: a short-range and a long-range.
- The short-range contribution is calculated by exact summation.
- The forces beyond the cutoff radius are approximated using Particle-Mesh Ewald (PME) method.
