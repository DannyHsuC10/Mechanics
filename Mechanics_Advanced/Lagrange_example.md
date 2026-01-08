# Lagrange example
## System Settings
FL,FR,RL,RR : 1,2,3,4

* sprung mass　: $m_s$
* Damping : $c_{s1},c_{s2},c_{s3},c_{s4}$
* Spring : $k_{s1},k_{s2},k_{s3},k_{s4}$
* unsprung mass : $m_{u1},m_{u2},m_{u3},m_{u4}$
* Wheel damping : $c_{t1},c_{t2},c_{t3},c_{t4}$
* wheel stiffness : $k_{t1},k_{t2},k_{t3},k_{t4}$
* Road surface displacement : $z_{r1}(t),z_{r2}(t),z_{r3}(t),z_{r4}(t)$

## Generalized coordinate definition
$$q = \left[ \begin{matrix} z_s\\\theta_{roll}\\\theta_{pirch}\\z_1\\z_2\\z_3\\z_4\end{matrix}\right]$$
## Kinetic Energy
$$T = T_s+T_u$$
### body
$$T_s = \frac12m_s\dot z_s^2+\frac12I_{roll}\dot\theta_{roll}^2+\frac12I_{pitch}\dot\theta_{pitch}^2$$
### Tire
$$T_u = \frac12\sum_{i = 1}^4m_{ui}\dot z_{ui}^2$$
## Potential energy
$$V = V_s+V_t$$
### body
$$V_s = \frac12\sum_{i = 1}^4k_{si}(\Delta z_{i})^2$$

$$\Delta z_i = z_{s}-z_{u_i}+\ d_i\theta_{roll}+ l_i\theta_{pitch}$$
### Tire
$$V_t = \frac12\sum_{i = 1}^4k_{ti}(\Delta z_{i})^2$$

$$\Delta z_{i} = (z_{ui}-z_{ri})$$
## Conservative force
$$Q = \left[ \begin{matrix} Q_s\\Q_{roll}\\Q_{pirch}\\Q_1\\Q_2\\Q_3\\Q_4\end{matrix}\right]$$
### body
$$Q_s = \sum_{i = 1}^4c_i(-\Delta\dot z_i)$$

$$-\Delta\dot z_i = \dot z_{ui}-\dot z_s-d_i\dot\theta_{roll}-l_i\dot\theta_{pitch}$$
### Tire
$$Q_t = c_{ti}(\dot z_{ri}-\dot z_{ui})$$
## Body compression

$$l = [+l_f,+l_f,-l_r,-l_r]$$

$$d = [+d_l,-d_r,+d_l,-d_r]$$
### Why not use projection?
The projected is indeed a geometrically precise choice.
$$\Delta z_i = z_{s}-z_{u_i}\pm\ d_i\sin\theta_{roll}\pm l_i\sin\theta_{pitch}$$

However, calculating potential energy will cause nonlinear problems.
$$\Delta z \sim l\sin\theta$$

$$V = k(\Delta z)^2 = k(l\sin\theta)^2$$

$$\frac{\partial V}{\partial \theta} \sim\sin\theta\cos\theta$$
This ultimately results in **nonlinear matrix** and $\ddot q = f(q,\dot q,t)$
* K is no longer a constant
* the analytical solution has disappeared
* only numerical integration is possible.

since the vehicle's attitude change is minimal, we use a first-order Taylor expansion.

$$\sin\theta\simeq \theta$$
## Lagrange equation
$$\frac{d}{dt}(\frac{\partial T}{\partial\dot q})-\frac{\partial T}{\partial q}+\frac{\partial V}{\partial q} = Q$$
**Demonstrating using the first degree of freedom**
### Step 1
$$\frac{\partial T}{\partial\dot q} = \frac{dT_s}{d\dot z_s} = \frac{d(\frac12m\dot z_s^2)}{d\dot z_s} = m_s\dot z_s$$

$$\frac{d}{dt}(\frac{\partial T}{\partial\dot q}) = \frac{d}{dt}(m_s\dot z_s) = m_s\ddot z_s$$
### Step 2
$$\frac{\partial T}{\partial q} = 0$$
### Step 3
$$\frac{\partial V}{\partial q} = \frac{dV_s}{dz_s} = \frac{\partial (\frac12\sum_{i = 1}^4k_{si}(z_{s}-z_{u_i}+\ d_i\theta_{roll}+ l_i\theta_{pitch})^2)}{\partial z_s}$$

$$=\sum_{i = 1}^4k_{si}(z_{s}-z_{u_i}+\ d_i\theta_{roll}+ l_i\theta_{pitch})$$

### Step 4
$$Q_s = \sum_{i = 1}^4c_i(\dot z_{ui}-\dot z_s-d_i\dot\theta_{roll}-l_i\dot\theta_{pitch})$$
### Step 5
$$m_s\dot z+\sum_{i = 1}^4k_{si}(z_{s}-z_{u_i}+\ d_i\theta_{roll}+ l_i\theta_{pitch}) = \sum_{i = 1}^4c_i(\dot z_{ui}-\dot z_s-d_i\dot\theta_{roll}-l_i\dot\theta_{pitch})$$
## Matrixing
$$M\ddot q+C\dot q+Kq = F(t)$$
### Degrees of freedom
$$q = \left[ \begin{matrix} z_s\\\theta_{roll}\\\theta_{pirch}\\z_1\\z_2\\z_3\\z_4\end{matrix}\right]$$

$$\dot q = \left[ \begin{matrix} \dot z_s\\\dot\theta_{roll}\\\dot\theta_{pirch}\\\dot z_1\\\dot z_2\\\dot z_3\\\dot z_4\end{matrix}\right]$$

$$\ddot q = \left[ \begin{matrix} \ddot z_s\\\ddot\theta_{roll}\\\ddot\theta_{pirch}\\\ddot z_1\\\ddot z_2\\\ddot z_3\\\ddot z_4\end{matrix}\right]$$
### mass
$$m_s = [m_s,I_{roll},I_{pitch}]$$

$$m_u = [m_{u1},m_{u2},m_{u3},m_{u4}]$$

$$M = I[m_s,I_{roll},I_{pitch},m_{u1},m_{u2},m_{u3},m_{u4}]$$

$$M = \begin{bmatrix}
m_s & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & I_{roll} & 0 & 0 & 0 & 0 & 0 \\0 & 0 & I_{pitch} & 0 & 0 & 0 & 0 \\0 & 0 & 0 & m_{u1} & 0 & 0 & 0 \\0 & 0 & 0 & 0 & m_{u2} & 0 & 0 \\0 & 0 & 0 & 0 & 0 & m_{u3} & 0 \\0 & 0 & 0 & 0 & 0 & 0 & m_{u4}
\end{bmatrix}$$
### force
$$F(t)=\begin{bmatrix}
0 \\
0 \\
0 \\
k_{t1}z_{r1}+c_{t1}\dot z_{r1} \\
k_{t2}z_{r2}+c_{t2}\dot z_{r2} \\
k_{t3}z_{r3}+c_{t3}\dot z_{r3} \\
k_{t4}z_{r4}+c_{t4}\dot z_{r4}
\end{bmatrix}$$
### K&C
$$K =
\begin{bmatrix}
k_{s1}+k_{s2}+k_{s3}+k_{s4} & b(k_{s1}-k_{s2}+k_{s3}-k_{s4}) & l_f(k_{s1}+k_{s2})-l_r(k_{s3}+k_{s4}) & -k_{s1} & -k_{s2} & -k_{s3} & -k_{s4} \\ b(k_{s1}-k_{s2}+k_{s3}-k_{s4}) & b^2(k_{s1}+k_{s2}+k_{s3}+k_{s4}) & b[l_f(k_{s1}-k_{s2})-l_r(k_{s3}-k_{s4})] & -b k_{s1} & b k_{s2} & -b k_{s3} & b k_{s4} \\ l_f(k_{s1}+k_{s2})-l_r(k_{s3}+k_{s4}) & b[l_f(k_{s1}-k_{s2})-l_r(k_{s3}-k_{s4})] & l_f^2(k_{s1}+k_{s2})+l_r^2(k_{s3}+k_{s4}) & -l_f k_{s1} & -l_f k_{s2} & l_r k_{s3} & l_r k_{s4} \\ -k_{s1} & -b k_{s1} & -l_f k_{s1} & k_{s1}+k_{t1} & 0 & 0 & 0 \\ -k_{s2} & b k_{s2} & -l_f k_{s2} & 0 & k_{s2}+k_{t2} & 0 & 0 \\
 -k_{s3} & -b k_{s3} & l_r k_{s3} & 0 & 0 & k_{s3}+k_{t3} & 0 \\ -k_{s4} & b k_{s4} & l_r k_{s4} &
 0 & 0 & 0 & k_{s4}+k_{t4}
\end{bmatrix}$$

$$C =\begin{bmatrix}c_{s1}+c_{s2}+c_{s3}+c_{s4} & b(c_{s1}-c_{s2}+c_{s3}-c_{s4}) & l_f(c_{s1}+c_{s2})-l_r(c_{s3}+c_{s4}) & -c_{s1} & -c_{s2} & -c_{s3} & -c_{s4} \\ b(c_{s1}-c_{s2}+c_{s3}-c_{s4}) & b^2(c_{s1}+c_{s2}+c_{s3}+c_{s4}) & b[l_f(c_{s1}-c_{s2})-l_r(c_{s3}-c_{s4})] & -b c_{s1} & b c_{s2} & -b c_{s3} & b c_{s4} \\ l_f(c_{s1}+c_{s2})-l_r(c_{s3}+c_{s4}) & b[l_f(c_{s1}-c_{s2})-l_r(c_{s3}-c_{s4})] & l_f^2(c_{s1}+c_{s2})+l_r^2(c_{s3}+c_{s4}) & -l_f c_{s1} & -l_f c_{s2} & l_r c_{s3} & l_r c_{s4} \\ -c_{s1} & -b c_{s1} & -l_f c_{s1} & c_{s1}+c_{t1} & 0 & 0 & 0 \\ -c_{s2} & b c_{s2} & -l_f c_{s2} & 0 & c_{s2}+c_{t2} & 0 & 0 \\ -c_{s3} & -b c_{s3} & l_r c_{s3} & 0 & 0 & c_{s3}+c_{t3} & 0 \\ -c_{s4} & b c_{s4} & l_r c_{s4} & 0 & 0 & 0 & c_{s4}+c_{t4}
\end{bmatrix}$$
### Final result
$$\begin{bmatrix}
m_s & 0 & 0 & 0 & 0 & 0 & 0 \\
0 & I_{roll} & 0 & 0 & 0 & 0 & 0 \\0 & 0 & I_{pitch} & 0 & 0 & 0 & 0 \\0 & 0 & 0 & m_{u1} & 0 & 0 & 0 \\0 & 0 & 0 & 0 & m_{u2} & 0 & 0 \\0 & 0 & 0 & 0 & 0 & m_{u3} & 0 \\0 & 0 & 0 & 0 & 0 & 0 & m_{u4}
\end{bmatrix}\left[ \begin{matrix} \ddot z_s\\\ddot\theta_{roll}\\\ddot\theta_{pirch}\\\ddot z_1\\\ddot z_2\\\ddot z_3\\\ddot z_4\end{matrix}\right] + \begin{bmatrix}c_{s1}+c_{s2}+c_{s3}+c_{s4} & b(c_{s1}-c_{s2}+c_{s3}-c_{s4}) & l_f(c_{s1}+c_{s2})-l_r(c_{s3}+c_{s4}) & -c_{s1} & -c_{s2} & -c_{s3} & -c_{s4} \\ b(c_{s1}-c_{s2}+c_{s3}-c_{s4}) & b^2(c_{s1}+c_{s2}+c_{s3}+c_{s4}) & b[l_f(c_{s1}-c_{s2})-l_r(c_{s3}-c_{s4})] & -b c_{s1} & b c_{s2} & -b c_{s3} & b c_{s4} \\ l_f(c_{s1}+c_{s2})-l_r(c_{s3}+c_{s4}) & b[l_f(c_{s1}-c_{s2})-l_r(c_{s3}-c_{s4})] & l_f^2(c_{s1}+c_{s2})+l_r^2(c_{s3}+c_{s4}) & -l_f c_{s1} & -l_f c_{s2} & l_r c_{s3} & l_r c_{s4} \\ -c_{s1} & -b c_{s1} & -l_f c_{s1} & c_{s1}+c_{t1} & 0 & 0 & 0 \\ -c_{s2} & b c_{s2} & -l_f c_{s2} & 0 & c_{s2}+c_{t2} & 0 & 0 \\ -c_{s3} & -b c_{s3} & l_r c_{s3} & 0 & 0 & c_{s3}+c_{t3} & 0 \\ -c_{s4} & b c_{s4} & l_r c_{s4} & 0 & 0 & 0 & c_{s4}+c_{t4}
\end{bmatrix}\left[ \begin{matrix} \dot z_s\\\dot\theta_{roll}\\\dot\theta_{pirch}\\\dot z_1\\\dot z_2\\\dot z_3\\\dot z_4\end{matrix}\right] + \begin{bmatrix}
k_{s1}+k_{s2}+k_{s3}+k_{s4} & b(k_{s1}-k_{s2}+k_{s3}-k_{s4}) & l_f(k_{s1}+k_{s2})-l_r(k_{s3}+k_{s4}) & -k_{s1} & -k_{s2} & -k_{s3} & -k_{s4} \\ b(k_{s1}-k_{s2}+k_{s3}-k_{s4}) & b^2(k_{s1}+k_{s2}+k_{s3}+k_{s4}) & b[l_f(k_{s1}-k_{s2})-l_r(k_{s3}-k_{s4})] & -b k_{s1} & b k_{s2} & -b k_{s3} & b k_{s4} \\ l_f(k_{s1}+k_{s2})-l_r(k_{s3}+k_{s4}) & b[l_f(k_{s1}-k_{s2})-l_r(k_{s3}-k_{s4})] & l_f^2(k_{s1}+k_{s2})+l_r^2(k_{s3}+k_{s4}) & -l_f k_{s1} & -l_f k_{s2} & l_r k_{s3} & l_r k_{s4} \\ -k_{s1} & -b k_{s1} & -l_f k_{s1} & k_{s1}+k_{t1} & 0 & 0 & 0 \\ -k_{s2} & b k_{s2} & -l_f k_{s2} & 0 & k_{s2}+k_{t2} & 0 & 0 \\
 -k_{s3} & -b k_{s3} & l_r k_{s3} & 0 & 0 & k_{s3}+k_{t3} & 0 \\ -k_{s4} & b k_{s4} & l_r k_{s4} &
 0 & 0 & 0 & k_{s4}+k_{t4}
\end{bmatrix}\left[ \begin{matrix} z_s\\\theta_{roll}\\\theta_{pirch}\\z_1\\z_2\\z_3\\z_4\end{matrix}\right]-\begin{bmatrix}
0 \\
0 \\
0 \\
k_{t1}z_{r1}+c_{t1}\dot z_{r1} \\
k_{t2}z_{r2}+c_{t2}\dot z_{r2} \\
k_{t3}z_{r3}+c_{t3}\dot z_{r3} \\
k_{t4}z_{r4}+c_{t4}\dot z_{r4}
\end{bmatrix} = 0$$