---
layout: base
---

# Hamiltonian Mechanics

## Hamiltonian

* Generalized momentum
$$p = \frac{\partial L}{\partial\dot q}$$

$$H(q,p,t) = \sum p_i\dot q_i-L(q,\dot q,t)$$

## Hamilton equation
$$\dot q = \frac{\partial H}{\partial p}$$

$$\dot p = -\frac{\partial H}{\partial q}$$

## Collision System
If it's an elastic collision, then $H$ is conserved.

$$p_i+p'_i = p_f+p'_f$$

$$\Delta H = 0$$
## From Euler–Lagrange equation to Hamilton's equations
$$L(q,\dot q)+H(p,q) = p\dot q$$

$$\frac{\partial L}{\partial\dot q}\frac{\partial \dot q}{\partial p}+\frac{\partial H}{\partial p} = \dot q +p\frac{\partial \dot q}{\partial p}$$

$$\frac{\partial H}{\partial p}=\dot q$$

$$\frac{\partial L}{\partial q}+\frac{\partial L}{\partial\dot q}\frac{\partial \dot q}{\partial q}+\frac{\partial H}{\partial q} = p\frac{\partial \dot q}{\partial q}$$

$$\frac{\partial L}{\partial q} = -\frac{\partial H}{\partial q}$$

$$\dot p = \frac d{dt}\frac{\partial L}{\partial\dot q} = \frac{\partial L}{\partial q} = -\frac{\partial H}{\partial q}$$
## example(Hamiltonian vs Lagrangian)
### Lagrangian
$$T = \frac12m_s\dot z_s^2+\frac12m_u\dot z_u^2$$

$$V = \frac12k_s(z_s-z_u)^2+\frac12k_u(z_u-z_r)^2$$

$$L = T-V$$

$$\frac d{dt}\frac{\partial L}{\partial\dot q}-\frac{\partial L}{\partial q} = 0$$
****
$$m_s\ddot z_s+k_s(z_s-z_u) = 0$$

$$m_u\ddot z_u+k_s(z_u-z_s)+k_u(z_u-z_r ) = 0$$
### Hamiltonian
$$p_s = \frac{\partial L}{\partial \dot z_s} = m_s\dot z_s$$

$$p_u = \frac{\partial L}{\partial\dot z_u} = m_u\dot z_u$$

$$H = p\dot q-L = \frac{p_s^2}{2m_s}+\frac{p_u^2}{2m_u}+\frac12k_s(z_s-z_u)^2+\frac12k_s(z_u-z_s)^2$$
****
$$\dot p_s = \frac{\partial H}{\partial z_s} = -k_s(z_s-z_u)$$

$$\dot p_u = -\frac{\partial H}{\partial z_u} = -k_u(z_u-z_r)-k_s(z_u-z_s)$$

$$\dot z_s = \frac{\partial H}{\partial p_s} = \frac{p_s}{m_s}$$

$$\dot z_u = \frac{\partial H}{\partial p_u} = \frac{p_u}{m_u}$$
