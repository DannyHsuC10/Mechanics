---
layout: base
---

# Analytical mechanics

## Intrinsic motion

### degrees of freedom
* dimension of position space "usually 3" : $D$
* constituents of system "particles" : $P$
* constraints : $C$
* degrees of freedom : $q$
$D\times P-C= q$
### generalized velocities ( $\dot q$ )
$q = (q_1,q_2,q_3...q_N)$
$$v = \frac{dq}{dt} = \dot q_1,\dot q_2,\dot q_3...\dot q_N$$
## Lagrangian mechanics
* total kinetic energy : $T$
* Total potential energy : $V$
* Lagrangian : $L$
$$L(q,\dot q,t) = T(q,\dot q,t)-V(q,\dot q,t)$$
### Euler–Lagrange equations
$$\frac d{dt}(\frac{\partial L}{\partial  \dot q}) = \frac{\partial L}{\partial q}$$
## Hamiltonian mechanics
* Hamiltonian : $H$
$$H(q,p,t) = p\cdot\dot q-L(q,\dot q,t)$$

* generalized momentums : $p$
$$p = \frac{\partial L}{\partial  \dot q}$$

* generalized forces : $Q$
$$Q = \dot p$$
* work : $W$
$$\dot W = Qdq$$

## Principle of least action

<div style="text-align: center;">
<img src="Least_action_principle.svg.png
" alt="image" width="300">
</div>

$$S = \int^{t_f}_{t_i}L(q,\dot q,t)\ dt$$

$$\frac{\delta S}{\delta q} = 0$$

$$\frac{\delta S}{\delta q}\not=\frac{dS}{dq}$$
