---
layout: base
---

# Electrostatic Interactions

## Coulomb interactions

- Long range: $V_{Elec}=\frac{q_{i}q_{j}}{4\pi\epsilon_{0}\epsilon_{r}r_{ij}}$

![graph: electrostatic potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Coulomb_interaction.png)

- Computing Coulomb potentials is often the most time consuming part of any MD simulation.
- Fast and efficient algorithms are required for these calculations.

### Particle Mesh Ewald (PME)

- The most widely used method using the Ewald decomposition.
- The potential is decomposed into two parts: fast decaying and slow decaying.

![Graph: PME Decomposition](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/PME_decomp.svg)

#### Fast decaying short-ranged potential (Particle part)

- Sum of all pairwise Coulomb interactions within a cutoff radius
- Implements same truncation scheme as the LJ potentials.

#### Slow decaying long-ranged potential (Mesh part)

- Slowly varying, smooth and periodic function.
- All periodic functions can be represented with a sum of sine or cosine components.
- Slowly varying functions can be accurately described by only a limited number of low frequency components (k vectors).

#### PME algorithm

- Long-range electrostatic interactions are evaluated using 3-D grids in reciprocal Fourier space.

![Image: PME Grid](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/PME.png)

1. Assign charges to grid cells. Charges in grid cells are obtained by interpolation.
2. Compute Fourier transform.
3. Compute potential. Coulomb interaction decays rapidly in Fourier space, and summation converges fast.
4. Compute inverse Fourier transform.
5. Interpolate gridded potentials back to atomic centers.

#### Simulation parameters controlling speed and accuracy of PME calculations

- **Grid spacing**. Lower values lead to higher accuracy but considerably slow down the calculation.
- **Grid dimension**. Higher values lead to higher accuracy but considerably slow down the calculation.
- **Direct space tolerance**. Controls the splitting into direct and reciprocal part. Higher tolerance shifts more charges into Fourier space.
- **Interpolation order** is the order of the B-spline interpolation. The higher the order, the better the accuracy.
