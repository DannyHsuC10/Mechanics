---
layout: base
---

# Hamiltonian-Jacobi mechanics

$$H(q,p,t)$$

$$\dot q = \frac{\partial H}{\partial p}$$

$$\dot p = -\frac{\partial H}{\partial q}$$
* Hamilton’s principal function : $S(q,t)$
$$p = \frac{\partial S}{\partial q}$$
## Hamilton–Jacobi equations
$$H = (q\frac{\partial S}{\partial q},t)+\frac{\partial S}{\partial t} = 0$$

## Solve the equations of motion
### 1DOF
$$H = \frac{p^2}{2m}+V$$

$$\frac{1}{2m}(\frac{\partial S}{\partial q})^2+V+\frac{\partial S}{\partial t} = 0$$

let $S(q,t) = W(q)-Et$

$$\frac{1}{2m}(\frac{dW}{dq})^2+V = E$$

$$W = \int\sqrt{2m(E-V(q))}\ dq$$

$$p = \frac{dW}{dq}$$

$$\dot q = \frac pm$$
### 2DOF
$$H(q_1,q_2,p_1,p_2) = \frac{p_1^2}{2m}+\frac{p_2^2}{2m}+V(p_1,p_2)$$

$$\frac{1}{2m}((\frac{\partial S}{\partial q_1})^2+(\frac{\partial S}{\partial q_2})^2)+V(q_1,q_2)+\frac{\partial S}{\partial t} = 0$$

let $S(q_1,q_2,t) = W(q_1,q_2)-Et$

$$\frac{1}{2m}((\frac{dW}{dq_1})^2+(\frac{dW}{dq_2})^2)+V(q_1,q_2) = E$$

Using separation constant
**a multi-dimensional system can be transformed into a one-dimensional system.**
$$\frac{1}{2m}(\frac{dW}{dq_1})^2+V(q_1) = \alpha$$

$$\frac{1}{2m}(\frac{dW}{dq_2})^2+V(q_2) = E-\alpha$$

$$W = \int\sqrt{2m(E-V(q))}\ dq$$

$$W=W_1+W_2$$

$$p_1 = \frac{dW_1}{dq_1}$$

$$p_2 = \frac{dW_2}{dq_2}$$

$$\dot q = \frac pm$$
## Solution time
$$\frac{\partial S}{\partial E} = C$$

$$\frac{\partial W}{\partial E}-C = t$$