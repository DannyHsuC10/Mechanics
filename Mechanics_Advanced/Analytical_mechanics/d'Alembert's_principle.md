---
layout: base
---

# d'Alembert's principle

##  Newton's laws of motion
$$F = ma$$

$$F-ma = 0$$
## Core Formula
$$\sum (F_i-m_ia_i)dr = 0$$

The virtual work done by external forces + the virtual work done by inertial forces = 0
**Dynamics = Virtual Work Equilibrium**
## Extended to generalized coordinates
$$r(q_1,q_2,...)$$

$$dr = \sum\frac{\partial r_i}{\partial q_i}dq$$

$$\sum_j(\sum_i (F_i-m_ia_i)\frac{\partial r_i}{\partial q_j})dq_j = 0$$
## The key bridge to the Lagrange equation
$$\sum_i (F_i-m_ia_i)\frac{\partial r_i}{\partial q_j} = 0$$

$$\sum_i (m_ia_i)\frac{\partial r_i}{\partial q_j} = \frac d{dt}(\frac{\partial T}{\partial\dot q})-\frac{\partial T}{\partial q}$$

$$\frac d{dt}(\frac{\partial T}{\partial\dot q})-\frac{\partial T}{\partial q} = Q$$