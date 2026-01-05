---
layout: base
---

# Maxwell-Boltzmann distribution

## System Assumptions

Consider an ideal gas system, assuming that:

1. Number of particles : $N$ , mass :  $m$
2. 3D velocity vectors : $v_x, v_y, v_z$
3. In thermal equilibrium, the distribution of particles should maximize the number of overall states.
4. Distribution Function :  $f(v_x, v_y, v_z)$ , Describes the fraction of particles with velocities $(v_x, v_x + dv_x), (v_y, v_y + dv_y), (v_z, v_z + dv_z)$

## constraint

1. **Distribution function**

$$f(v_x, v_y, v_z) = f_x(v_x) f_y(v_y) f_z(v_z)$$

Distribution function of velocity components :  $f_x, f_y, f_z$

2. **Conservation of Particle number**

$$\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} f(v_x, v_y, v_z) \, dv_x dv_y dv_z = N$$

3. **Conservation of Energy**

$$E = \frac{1}{2} m \sum_{i=1}^{N} (v_{x,i}^2 + v_{y,i}^2 + v_{z,i}^2)$$

$$\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \frac{1}{2} m (v_x^2 + v_y^2 + v_z^2) f(v_x, v_y, v_z) \, dv_x dv_y dv_z = \frac{3}{2} Nk_B T$$

* average kinetic energy of total ideal gas : $\frac{3}{2} Nk_B T$

4. **Principle of maximum entropy**

$$S = - \int f \ln f \, d^3v$$

* Maximize entropy $S$
$$d^3v = dv_x dv_y dv_z$$

## Solution

1. **Lagrange multiplier**

$$\mathcal{L} (x, \lambda)= f(x)- \lambda g (x)$$

* Lagrangian : $\mathcal{L}$
* Lagrange multiplier : $\lambda$
* equality constraint : $g(x)$
* function : $f(x)$
* integer : $x$

$$\mathcal{L} = - \int f \ln f \, d^3v + \lambda \left( \int f \, d^3v - N \right) + \beta \left( \int \frac{1}{2} m v^2 f \, d^3v - \frac{3}{2} Nk_B T \right)$$

* $\lambda$ & $\beta$ Lagrange multiplier
* $v^2 = v_x^2 + v_y^2 + v_z^2$

2. **Calculus of variations**

$$\frac{\delta \mathcal{L}}{\delta f} = 0$$

$$\frac{\delta \mathcal{L}}{\delta f} = - (1 + \ln f) + \lambda + \beta \frac{1}{2} m v^2 = 0$$

$$f(v_x, v_y, v_z) = A \exp\left(-\beta \frac{1}{2} m v^2\right)$$

* $A = e^{\lambda - 1}$ is a constant
* $\beta$ is related to the temperature $T$.

3. **constant $A$ & $\beta$**

$$\int f(v_x, v_y, v_z) \, dv_x dv_y dv_z = N$$

$$A = \left( \frac{m}{2 \pi k_B T} \right)^{3/2}$$

$$\beta = \frac{1}{k_B T}$$

$$f(v) = \left( \frac{m}{2 \pi k_B T} \right)^{3/2} \exp\left(-\frac{m v^2}{2 k_B T}\right)$$
