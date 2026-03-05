---
layout: base
---

# SHM & ODE
## 0. base of SHM

$$F = kx$$

$$ma = kx$$

$$m\ddot x = kx$$

$$\ddot x = \frac{k}{m}x$$

$$\omega = \sqrt{k/m}$$

$$\ddot x = \omega^2 x$$

## 1. Setting up the Equation
Consider a second-order linear differential equation:
$$\ddot{x} + \omega^2 x = 0$$
where $x(t)$ is the displacement and $\omega$ is the angular frequency.

## 2. Exponential Assumption
Assume the solution has the form:
$$x(t) = e^{rt}$$

Substituting into the equation:
$$r^2 e^{rt} + \omega^2 e^{rt} = 0$$

Since $e^{rt} \neq 0$, the characteristic equation is:
$$r^2 + \omega^2 = 0$$

## 3. Solving the Characteristic Equation
The roots are:
$$r = \pm i\omega$$

Thus, the general solution is:
$$x(t) = C_1 e^{i\omega t} + C_2 e^{-i\omega t}$$

## 4. Applying Euler’s Formula
Euler’s formula states:
$$e^{i\theta} = \cos\theta + i\sin\theta$$
$$e^{-i\theta} = \cos\theta - i\sin\theta$$

Substituting gives:
$$x(t) = (C_1 + C_2)\cos(\omega t) + i(C_1 - C_2)\sin(\omega t)$$

## 5. Redefining Constants
Let:
$$A = C_1 + C_2, \quad B = i(C_1 - C_2)$$

Then the solution becomes:
$$x(t) = A\cos(\omega t) + B\sin(\omega t)$$

## 6. Determining Constants from Initial Conditions
- If $x(0) = x_0$, then $A = x_0$  
- If $\dot{x}(0) = v_0$, then $B = \tfrac{v_0}{\omega}$  

Therefore, the complete solution is:
$$x(t) = x_0 \cos(\omega t) + \frac{v_0}{\omega}\sin(\omega t)$$
