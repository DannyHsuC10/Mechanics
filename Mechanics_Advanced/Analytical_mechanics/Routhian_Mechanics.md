---
layout: base
---

# Routhian Mechanics

## Cyclic coordinates

$$\frac{\partial L}{\partial q_i} = 0$$

$$p_i = \frac{\partial L}{\partial \dot q_i} = \text{const}$$

The entire system is insensitive to space.

For example: translating the system does not change the physical properties at all.

## Definition
* non-cyclic coordinates：( $q_\alpha$ )
* cyclic coordinates：( $q_c$ )

$$p_c = \frac{\partial L}{\partial \dot q_c}$$

$$R(q_\alpha, \dot q_\alpha;\ q_c, p_c)
= L(q,\dot q) - \sum_c p_c \dot q_c$$


## Compared to other mechanics

|  mechanics  |               variable               |
|:-----------:|:------------------------------------:|
| Lagrangian  |             $q, \dot q$              |
| Hamiltonian |                $q, p$                |
|  Routhian   | $q_\alpha, \dot q_\alpha,\ q_c, p_c$ |

|       characteristic       |  mechanics   |
|:--------------------------:|:------------:|
|   Non-cyclic coordinates   |  Lagrangian  |
|     Cyclic coordinates     | Hamiltonian  |
| Partial cyclic coordinates | **Routhian** |



## Routh equations
### non-cyclic（Lagrangian）

$$\frac{d}{dt}\frac{\partial R}\partial \dot q_\alpha$$

* $\frac{\partial R}{\partial q_\alpha} = 0$

### cyclic（Hamiltonian）

$$\dot q_c = -\frac{\partial R}{\partial p_c}$$

* $p_c$ is a constant
* Another Hamilton equation is automatically satisfied.

## example (Free particles in planar polar coordinates)
### Lagrangian

$$L = \frac12 m (\dot r^2 + r^2 \dot\theta^2)$$

* ( $\theta$ ) cyclic coordinates
* angular momentum : $p_\theta$

$$p_\theta = m r^2 \dot\theta$$

### Routhian

$$R = L - p_\theta \dot\theta$$

$$\dot\theta = \frac{p_\theta}{m r^2}$$

$$R(r,\dot r; p_\theta)
= \frac12 m \dot r^2 - \frac{p_\theta^2}{2 m r^2}$$

$$V_{\text{eff}}(r) =\frac{p_\theta^2}{2 m r^2}$$

The system is equivalent to a **one-dimensional problem**.

## application

* Conserved quantity = Eliminable degrees of freedom
* Reduced system dimensionality >> More efficient computation
* No need for a complete phase space

### Common applications:

* Orbital mechanics (conservation of angular momentum)
* Symmetrical systems
* Vibration models
