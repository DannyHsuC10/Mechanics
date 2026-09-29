---
layout: base
---

# Periodic Boundary Conditions

## What is PBC and why is it important?

- In most cases we want to simulate a system in realistic environment, such as solution.
- Try simulating a droplet of water, it will simply evaporate.
- We need a boundary to contain water and control temperature, pressure, and density.
- Periodic boundary conditions allow to approximate an infinite system by using a small part (unit cell).

![Figure: Periodic Boundary Conditions](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/periodic_boundary-3.svg)

- Unit cell is surrounded by an infinite number of translated copies in all directions (images).
- When a particle in unit cell moves across the boundary it reappears on the opposite side.
- Each molecule always interacts with its neighbors even though they may be on opposite sides of the simulation box.
- Artifacts caused by the interaction of the isolated system with a vacuum are replaced with the PBC artifacts which are in general much less severe.

## Choosing periodic box size and shape

### Box shape

#### Cubic periodic box

- A cubic box is the most intuitive and common choice
- Cubic box is inefficient due to irrelevant water molecules in the corners.

 ![Figure: Cubic box](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/cubic_box.svg)

- Ideal simulation system is a sphere of water surrounding the macromolecule, but spheres can't be packed to fill space.

#### Octahedral and dodecahedral periodic boxes

- The dodecahedron (12 faces) or the truncated octahedron (14 faces) are closer to sphere.

|                              | Space filling with truncated octahedrons |
|:----------------------------:|:-----------------------------------------|
| ![Figure: truncated Octahedron](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/trunc-octa.svg)|![Figure: truncated Octahedron](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/truncated_octahedron_group.svg)|

- These shapes work reasonably well for globular macromolecules.

#### Triclinic periodic boxes

- Any repeating shape that fills all of space has an equivalent triclinic unit cell.
- A periodic box of any shape can be represented by a triclinic box with specific box vectors and angles.

![Figure: Triclinic Cell](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/triclinic_cell.gif)

- The optimal triclinic cell has about 71% the volume of the optimal rectangular cell.

### Box size

- The minimum box size should extend at least 10 nm from the solute.

![10 nm margin](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/box_size-2.svg)

- The shortest periodic box vector should be at least twice bigger than the cuf-off radius.

![Figure: Periodic Boundary Conditions](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/periodic_boundary-4.svg)

- In simulations with macromolecules solvent molecules should not "feel" both sides of a solute.

![img](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/box_size.svg)

#### Pitfalls

- A simulation system with elongated solute in cubic or dodecahedral box  will have a large amount of water located far away from the solute.
- Consider using a narrow rectangular box.
- Rotation of elongated macromolecules and/or conformational changes must be taken in consideration.

![Figure: Periodic Boundary Conditions](https://computecanada.github.io/molmodsim-md-theory-lesson-novice/fig/PBC.svg)

- Constrain the rotational motion.
- The box shape itself may influence conformational dynamics by restricting motions in certain directions
