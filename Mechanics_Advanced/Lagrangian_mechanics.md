---
layout: base
---

# Lagrangian mechanics

## Generalized system

Removing generalized coordinate space effects.Summarize all factors and discuss change using the entire system.
$$q = \sum_i r_i\frac{\partial r}{\partial q}$$

* Generalized Displacement : $q$
* Generalized Velocity : $\dot q = \frac{dq}{dt}$
* Generalized Acceleration : $\ddot q = \frac{d^2q}{dt^2}$
## Lagrangian
* Potential energy : $T$
* Kinetic energy : $V$
* Lagrangian : $L$
$$L = T-V$$

$$T = \frac12\sum_i m_i\dot q_i^2 $$

$$V = \sum_i\frac12k_i(\Delta q)^2$$

$$Q = m\ddot q$$

## Generalized force
* Generalized force : $Q$
$$\Delta W = \sum_i Q_i\Delta q_i$$

$$Q = \sum_i F_i\frac{\partial r}{\partial q}$$

## Lagrange's equations
$$\frac d{dt}(\frac{\partial L}{\partial  \dot q}) = \frac{\partial L}{\partial q}$$
* Include generalized force
$$\frac d{dt}(\frac{\partial L}{\partial  \dot q})-\frac{\partial L}{\partial q} = Q_i$$

$$\frac d{dt}(\frac{\partial (T-V)}{\partial  \dot q})-\frac{\partial (T-V)}{\partial q} = Q_i$$

|                      formula                      |                                     Physical meaning                                      |
|:-------------------------------------------------:|:-----------------------------------------------------------------------------------------:|
|       $\frac{\partial L}{\partial \dot q}$        |                                   Generalized momentum                                    |
| $\frac{d}{dt} \frac{\partial L}{\partial \dot q}$ |                  Rate of change of generalized momentum(Inertial force)                   |
|         $-\frac{\partial L}{\partial q}$          |          Potential energy gradient(Generalized projection of conservative force)          |
|                       $Q_i$                       | Projection of external or non-conservative forces in the generalized coordinate direction |

$$\text{Inertial force} = \text{Conservative force} + \text{External force}$$
## Engineering Examples (1/4 suspension system model)
### System Settings
* sprung mass　: $m_s$
* Damping : $c_s$
* Spring : $k_s$
* unsprung mass : $m_u$
* Wheel damping : $c_t$
* wheel stiffness : $k_t$
* Road surface displacement : $z_r(t)$
### Generalized coordinate definition
$$q = \left[ \begin{matrix} z_s\\z_u \end{matrix}\right]$$
### Kinetic energy and potential energy
* body Kinetic energy : $T_s = \frac12m_s\dot z_s^2$
* tire Kinetic energy : $T_u = \frac12m_u\dot z_t^2$

$$T = T_s+T_u =  \frac12(m_s\dot z_s^2+m_u\dot z_t^2)$$
****
* Suspension springs : $V_s = \frac12k_s(z_s-z_u)^2$
* Tire springs : $V_t = \frac12k_t(z_u-z_r)^2$

$$V = V_s+V_t = \frac12(k_s(z_s-z_u)^2+k_t(z_u-z_r)^2)$$
### Conservative force
$$F_s = c_s(\dot z_u-\dot z_s)$$

$$F_t = c_t(\dot z_r-\dot z_u)$$

$$Q_s = F_s$$

$$Q_u = F_t-F_s$$
### Applying Lagrange's equation
$$\frac d{dt}(\frac{\partial (T-V)}{\partial  \dot q})-\frac{\partial (T-V)}{\partial q} = Q_i$$

$$\frac d{dt}\frac{\partial T}{\partial  \dot q}+\frac{\partial V}{\partial q} = Q_i$$
#### body
$$\frac{d}{dt}(m_s\dot z_s)+k_s(z_s-z_u) = c_s(\dot z_u-\dot z_s)$$

$$m_s\ddot z_s+k_s(z_s-z_u)-c_s(\dot z_u-\dot z_s) = 0$$
#### tire
$$\frac{d}{dt}(m_u\dot z_u)+k_s(z_u-z_s)+k_t(z_u-z_r) = c_s(\dot z_s-\dot z_u)+c_t(\dot z_r-\dot z_u)$$

$$m_u\ddot z_u+k_s(z_u-z_s)+k_t(z_u-z_r)-c_s(\dot z_s-\dot z_u)-c_t(\dot z_r-\dot z_u) = 0$$
### matrix
$$\left[ \begin{matrix}  m_s&0\\0&m_u \end{matrix}\right]\left[ \begin{matrix} \ddot z_s\\\ddot z_u \end{matrix}\right]+\left[ \begin{matrix}  c_s&-c_s\\-c_s&c_s+c_t \end{matrix}\right]\left[ \begin{matrix} \dot z_s\\\dot z_u \end{matrix}\right]+\left[ \begin{matrix}  k_s&-k_s\\-k_s&k_s+k_t \end{matrix}\right]\left[ \begin{matrix}  z_s\\ z_u \end{matrix}\right] = \left[ \begin{matrix} 0\\k_tz_r-c_t\dot z_r \end{matrix}\right]$$
## more???
[Lagrange example](Lagrange_example.md)