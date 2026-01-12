---
layout: base
---

# Appellian Mechanics

## Appell function

$$S = \frac{1}{2} \sum_i m_i a_i^2$$

* mass : $m$
* acceleration : $a$

$S$ is not energy, but a "weighted sum of the squares of accelerations".

## Appell equations

$$\frac{\partial S}{\partial \ddot q_j} = Q_j$$
* Generalized coordinates : $q_j$
* Generalized force : $Q_j$

## Comparison with Lagrange
  
|   variable    | Lagrange |   Appell   |
|:-------------:|:--------:|:----------:|
|      $T$      |  Needed  | Not needed |
|      $V$      |  Needed  | Not needed |
| $\frac d{dt}$ |  Needed  | Not needed |

The results were completely consistent, but Appell was more direct for engineering systems.
Efficient force calculation can be performed directly using the acceleration function $S$.
## example ( Quarter-suspension model)

### 2-DOF

* sprung displacement : $z_s$
* unsprung displacement : $z_u$

$$q_1 = z_s, \quad q_2 = z_u$$

### System parameters

* sprung mass : $m_s$
* unsprung mass : $m_u$
* spring rigidity : $k_s$：
* damping coefficient : $c_s$
* Tire rigidity : $k_t$：
* base excitation : $z_r(t)$

### Appell function
$$S = \frac{1}{2} m_s \ddot z_s^2 + \frac{1}{2} m_u \ddot z_u^2$$

### Generalized force
#### The generalized force $Q_s$ on $z_s$

* spring：$-k_s (z_s - z_u)$
* damper：$-c_s (\dot z_s - \dot z_u)$

$$Q_s = -k_s (z_s - z_u) - c_s (\dot z_s - \dot z_u)$$

#### The generalized force (Q_u) on (z_u)
* spring：(+k_s (z_s - z_u))
* damper：(+c_s (\dot z_s - \dot z_u))
* tire spring：(-k_t (z_u - z_r))

$$Q_u = k_s (z_s - z_u) + c_s (\dot z_s - \dot z_u) - k_t (z_u - z_r)$$
### Appell equations
#### Sprung mass 
$$\frac{\partial S}{\partial \ddot z_s} = m_s \ddot z_s = Q_s$$

$$m_s \ddot z_s + c_s (\dot z_s - \dot z_u) + k_s (z_s - z_u) = 0$$

#### Unsprung mass
$$\frac{\partial S}{\partial \ddot z_u} = m_u \ddot z_u = Q_u$$

$$m_u \ddot z_u - c_s (\dot z_s - \dot z_u) - k_s (z_s - z_u) + k_t (z_u - z_r) = 0$$
