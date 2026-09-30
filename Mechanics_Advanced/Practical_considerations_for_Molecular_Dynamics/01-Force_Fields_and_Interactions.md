---
layout: base
---

# Force Fields and Interactions

## Introduction

- Atoms and molecules interact with each other.
- We carry out molecular modeling by following and analyzing dynamic structural models in computers.

![MD-timeline: system-size vs. time](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/MD_size_timeline.png)

- The size and the length of MD simulations has been recently vastly improved.
- Longer and larger simulations allow us to tackle wider range of problems under a wide variety of conditions.

----

#### Recent example - simulation of the whole SARS-CoV-2 virion

- System size: 304,780,149 atoms, 350 Å × 350 Å lipid bilayer, simulation time 84 ns

![Image: Simulation of SARS-CoV-2 with NAMD](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Cov2-NAMD.jpg)

- Showed that spike glycans can modulate the infectivity of the virus.
- Characterized interactions between the spike and the human ACE2 receptor.
- Used ML to identify conformational transitions between states and accelerate conformational sampling.

----

### Goals of the Workshop

- Introduce you to the method of molecular dynamics simulations.
- Guide you to using various molecular dynamics simulation packages and utilities.
- Teach how to use *Digital Research Alliance of Canada* (Alliance) clusters for system preparation, simulation and trajectory analysis.

The focus will be on reproducibility and automation by introducing scripting and batch processing.

---

## The theory behind the method of MD.

### Force Fields

- Understanding complex biological phenomena requires simulations of large systems for a long time windows.
- The forces acting between atoms and molecules are very complex.
- Very fast method of evaluations molecular interactions is needed to achieve these goals.

**Interactions are approximated with a simple empirical potential energy function.**

- The potential energy function allows calculating forces: $ \vec{F}=-\nabla{U}(\vec{r}) $
- With the knowledge of the forces acting on an object, we can calculate how the position of that object changes over time:  $ \vec{F}=\frac{d\vec{p}}{dt} $.
- Advance system with very small time steps assuming the velocities don't change.

![Flow diagram of MD process](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Md_process_summary.png)

**A force field is a set of empirical energy functions and parameters used to calculate the potential energy *U* as a function of the molecular coordinates.**

- Potential energy function used in MD simulations is composed of non-bonded and bonded interactions:

$$U(\vec{r})=\sum{U_{bonded}}(\vec{r})+\sum{U_{non-bonded}}(\vec{r})$$

- Only pairwise interactions are considered.

### Classification of force fields

#### Class 1 force fields

- Dynamics of bond stretching and angle bending is described by simple harmonic motion (quadratic approximation)
- Correlations between bond stretching and angle bending are omitted.

Examples: AMBER, CHARMM, GROMOS, OPLS

#### Class 2 force fields

- Add anharmonic cubic and/or quartic terms to the potential energy for bonds and angles.
- Contain cross-terms describing the coupling between adjacent bonds, angles and dihedrals.

#### Class 3 force fields

- Explicitly add special effects of organic chemistry such as polarization, stereoelectronic effects, electronegativity effect, Jahn–Teller effect, etc.

## Energy Terms of Biomolecular Force Fields

### Non-Bonded Terms

- Describe non-elecrostatic and electrostatic interactions between all pairs of atoms.

![graph: Interactions](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/nb_matrix.svg)

- Non-elecrostatic potential energy is most commonly described with the Lennard-Jones potential.

#### The Lennard-Jones potential

- Approximates the potential energy of non-elecrostatic interaction between a pair of non-bonded atoms or molecules:

$$V_{LJ}(r)=\frac{C12}{r^{12}}-\frac{C6}{r^{6}}$$

- The $r^{-12}$ term approximates the strong Pauli repulsion originating from overlap of electron orbitals.
- The $r^{-6}$ term describes weaker attractive forces acting between local dynamically induced dipoles in the valence orbitals.
- The too steep repulsive part often leads to an overestimation of the pressure in the system.

![graph: Lennard-Jones potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/lj.svg)

- The LJ potential is commonly expressed in terms of the well depth $\epsilon$ and the van der Waals radius $\sigma$:

$$V_{LJ}(r)=4\epsilon\left[\left(\frac{\sigma}{r}\right)^{12}-\left(\frac{\sigma}{r}\right)^{6}\right]$$

- Relation between C12, C6, $\epsilon$ and   $\sigma$:

$$C12=4\epsilon\sigma^{12},C6=4\epsilon\sigma^{6}$$

#### The Lennard-Jones Combining Rules

- The *LJ* interactions between different types of atoms are computed by combining the *LJ* parameters.
- Avoid huge number of parameters for each combination of different atom types.
- Different force fields use different combining rules.

- The arithmetic mean (Lorentz) is motivated by collision of hard spheres
- The geometric mean (Berthelot) has little physical argument.

**Geometric mean:**

$$C12_{ij}=\sqrt{C12_{ii}\times{C12_{jj}}}\qquad C6_{ij}=\sqrt{C6_{ii}\times{C6_{jj}}}\qquad$$

$$\sigma_{ij}=\sqrt{\sigma_{ii}\times\sigma_{jj}}\qquad\qquad\qquad \epsilon_{ij}=\sqrt{\epsilon_{ii}\times\epsilon_{jj}}\qquad\qquad$$

**Lorentz–Berthelot:**

$$\sigma_{ij}=\frac{\sigma_{ii}+\sigma_{jj}}{2},\qquad \epsilon_{ij}=\sqrt{\epsilon_{ii}\times\epsilon_{jj}}\qquad$$

- Known issues: overestimates the well depth

>## Less common combining rules
>
>**Waldman–Hagler:**
>
>

$$\sigma_{ij}=\left(\frac{\sigma_{ii}^{6}+\sigma_{jj}^{6}}{2}\right)^{\frac{1}{6}}$$

 ,

$$\epsilon_{ij}=\sqrt{\epsilon_{ij}\epsilon_{jj}}\times\frac{2\sigma_{ii}^3\sigma_{jj}^3}{\sigma_{ii}^6+\sigma_{jj}^6}$$

>
>This combining rule was developed specifically for simulation of noble gases.
>
>**Hybrid** (the Lorentz–Berthelot for H and the Waldman–Hagler for other elements). Implemented in the [AMBER-ii](https://pubs.acs.org/doi/abs/10.1021/acs.jpcb.5b07233) force field for perfluoroalkanes, noble gases, and their mixtures with alkanes.
{: .callout}

#### The Buckingham potential

- Replaces the repulsive

$$r^{-12}$$

 term in Lennard-Jones potential with exponential function of distance:

$$V_{B}(r)=Aexp(-Br) -\frac{C}{r^{6}}$$

![graph: Buckingham potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/lj-buck.svg)

- Exponential function describes electron density more realistically
- Computationally more expensive to calculate.
- Risk of "buckingham catastrophe" at short distances.

There is only one combining rule for Buckingham potential in GROMACS:

$$A_{ij}=\sqrt{(A_{ii}A_{jj})}$$

$$B_{ij}=2/(\frac{1}{B_{ii}}+\frac{1}{B_{jj}})$$

$$C_{ij}=\sqrt{(C_{ii}C_{jj})}$$

**Combining rule (GROMACS)**:

$$A_{ij}=\sqrt{(A_{ii}A_{jj})} \qquad B_{ij}=2/(\frac{1}{B_{ii}}+\frac{1}{B_{jj}}) \qquad  C_{ij}=\sqrt{(C_{ii}C_{jj})}$$

#### The electrostatic potential

- Point charges are assigned to the positions of atomic nuclei to approximate the electrostatic potential around a molecule.

- The Coulomb's law: $V_{Elec}=\frac{q_{i}q_{j}}{4\pi\epsilon_{0}\epsilon_{r}r_{ij}}$

![graph: electrostatic potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/Coulomb_interaction.png)

#### Short-range and Long-range Interactions

- Interaction is short-range if the potential decreases faster than *r<sup>-3</sup>*
- The Lennard-Jones interactions are short-ranged, *r<sup>-6</sup>*.
- The Coulomb interactions are long-ranged, *r<sup>-1</sup>*.

### Bonded Terms

#### The bond potential

- Oscillation about an equilibrium bond length *r<sub>0</sub>* with bond constant *k<sub>b</sub>*: $V_{Bond}=k_b(r_{ij}-r_0)^2$

![graph: harmonic bond potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/bond.png)

- Poor approximation at extreme stretching, but it works well at moderate temperatures.

#### The angle potential

- Oscillation about an equilibrium angle  $\theta_{0}$  with force constant $k_\theta$: $V_{Angle}=k_\theta(\theta_{ijk}-\theta_0)^2$

![graph: harmonic angle potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/angle.png)

- The force constants for angle potential are about 5 times smaller that for bond stretching.

#### The torsion (dihedral) angle potential

- Defined for every 4 sequentially bonded atoms.
- Sum of any number of periodic functions, *n* - periodicity,  $\delta$ - phase shift angle.

$$V_{Dihed}=k_\phi(1+cos(n\phi-\delta)) + ...$$

- n represents the number of potential maxima or minima generated in a 360° rotation.

![graph: torsion/dihedral potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/dihedral.png)

- Combination of n=2 and n=3 dihedrals used to reproduce cis/trans and trans/gauche energy differences in ethylene glycol

#### The improper torsion potential

- Also known as 'out-of-plane bending'
- Defined for a group of 4 bonded atoms where the central atom i is connected to the 3 peripheral atoms j,k, and l.
- Used to enforce planarity.
- Given by a harmonic function: $V_{Improper}=k_\phi(\phi-\phi_0)^2$

![graph: improper-dihedral potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/dih.svg)

Where the dihedral angle $\phi$ is the angle between planes ijk and ijl.
- The dihedral angle $\phi$ is the angle between planes ijk and ijl.

----

### Coupling Terms

#### The Urey-Bradley potential

- Coupling between bond length and bond angle is described by the Urey-Bradley potential.
- The Urey-Bradley term is defined as a spring between the outer atoms of a bonded triplet.
- Approximated by a harmonic function: $V_{UB}=k_{ub}(r_{jk}-r_{ub})^2$

![graph: Urey-Bradley potential](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/ub.png)

- Improve agreement with vibrational spectra.
- Do not affect overall conformational sampling.
- Implemented in CHARMM and AMOEBA force fields.

### CHARMM CMAP correction potential

- Peptide torsion angles: phi, psi, omega.
- A protein can be seen as a series of linked sequences of peptide units which can rotate around phi/psi angles.
- phi/psi angles define the conformation of the backbone.

![img](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/phipsi.png)

- phi/psi dihedral angle potentials correct for force field deficiencies such as errors in non-bonded interactions, electrostatics, lack of coupling terms, inaccurate combination, etc.
- CMAP potential was developed to improve the sampling of backbone conformations.
- CMAP parameter does not define a continuous function.
- it is a grid of energy correction factors defined for each pair of phi/psi angles typically tabulated with 15 degree increments.

![graph: Phi Psi](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/cmap_energy.png)

>## Energy scale of potential terms
>
>|----------------------|:------------------|:
>|

$$k_BT$$

 at 298 K    | ~ 0.593          |

$$\frac{kcal}{mol}$$

>| Bond vibrations      | ~ 100 ‐ 500      |

>| Bond angle bending   | ~ 10 - 50        |

$$\frac{kcal}{mol \cdot deg^2}$$

>| Dihedral rotations   | ~ 0 - 2.5        |

$$\frac{kcal}{mol \cdot deg^2}$$

>| van der Waals        | ~ 0.5            |

$$\frac{kcal}{mol}$$

>| Hydrogen bonds       | ~ 0.5 - 1.0      |

$$\frac{kcal}{mol}$$

>| Salt bridges         | ~ 1.2 - 2.5      |

$$\frac{kcal}{mol}$$

>

### Exclusions from Non-Bonded Interactions

- In pairs of atoms connected by chemical bonds bonded energy terms replace non-bonded interactions.
- All pairs of connected atoms separated by up to 2 bonds (1-2 and 1-3 pairs) are excluded from non-bonded interactions. It is assumed that they are properly described with bond and angle potentials.

![exclusions](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/exclusions.svg)

- 1-4 interaction represents a special case where both bonded and non-bonded interactions are required for a reasonable description.  However, due to the short distance between the 1–4 atoms full strength non-bonded interactions are too strong and must be scaled down.
- Non-bonded interaction between 1-4 pairs depends on the specific force field.
- Some force fields exclude VDW interactions and scale down electrostatic (AMBER) while others may modify both or use electrostatic as is.

### What Information Can MD Simulations Provide?

With the help of MD it is possible to model phenomena that cannot be studied experimentally. For example

- Understand atomistic details of conformational changes, protein unfolding, interactions between proteins and drugs
- Study thermodynamics properties (free energies, binding energies)
- Study biological processes such as (enzyme catalysis, protein complex assembly, protein or RNA folding, etc).

For more examples of the types of information MD simulations can provide read the review article:

![Molecular Dynamics Simulation for All](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/ML01.svg)
