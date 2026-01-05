# Kinetic energy and momentum methods

## Kinetic energy

$$K = K_v+K_\omega$$

$$K = \frac12mv^2+\frac12I\omega^2$$

$$K = \frac12(mv^2+I\omega^2)$$

$$I = mr^2$$

$$K = \frac12m(v^2+(r\omega)^2)$$

## Center of Gravity

$$\bar x = \frac{\sum Wx}{\sum W}$$

$$\bar x = \frac{\sum mgx}{\sum mg} = \frac{\sum mx}{\sum m}$$

$$\bar y = \frac{\sum my}{\sum m}$$

$$\bar z = \frac{\sum mz}{\sum m}$$

## Moment of Inertia

$$I = mr^2$$

$$F = ma$$

$$a =  \alpha r$$

$$\tau = Fr =  (ma)r = m\alpha r\cdot r$$

$$\tau = I\alpha = mr^2\alpha$$

* sphere : $I = \frac25mr^2$
* cylinder : $\frac12mr^2$
* hoop : $mr^2$

## Momentum and Impulse

* Momentum : $P$
$$P = mv$$
* Impulse : $J$

$$J = \frac{dp}{dt} = ma$$

$$J = \sum F$$

* momentum conservation

$$P_i = P_f$$

## 1D Collision

|  collision   | Elastic collision | inelastic collision | Completely inelastic collision |
|:------------:|:-----------------:|:-------------------:|:------------------------------:|
| conservation | momentum & energy |      momentum       |            momentum            |

### 1D Elastic collision

$$P_{1i}+P_{2i} = P_{1f}+P_{2f}$$

$$m_1v_{1i}+m_2v_{2i} = m_1v_{1f}+m_2v_{2f}$$

$$K_{1i}+K_{2i} = K_{1f}+K_{2f}$$

$$\frac{1}{2}m_1v_{1i}^2+\frac{1}{2}m_2v_{2i}^2 = \frac{1}{2}m_1v_{1f}^2+\frac{1}{2}m_2v_{2f}^2$$

$$m_1v_{1i}^2+m_2v_{2i}^2 = m_1v_{1f}^2+m_2v_{2f}^2$$

$$m_1(v_{1i}^2-v_{1f}^2) = m_2(v_{2f}^2-v_{2i}^2)$$

$$m_1(v_{1i}-v_{1f})(v_{1i}+v_{1f}) = m_2(v_{2i}-v_{2f})(v_{2i}+v_{2f})$$

* $m_1v_{1i}+m_2v_{2i} = m_1v_{1f}+m_2v_{2f}$
* $v_{1i}+v_{1f} = v_{2i}+v_{2f}$

$$v_{1f} = \frac{v_{1i}(m_1-m_2)+2m_2v_{2i}}{m_1+m_2}$$

$$v_{2f} = \frac{v_{2i}(m_1-m_2)+2m_2v_{1i}}{m_1+m_2}$$

### 1D Completely inelastic collision

$$m_1v_{1i}+m_2v_{2i} = (m_1+m_2)v_{f}$$

### 1D inelastic collision

$$K_i\not= K_f$$

$$m_1v_{1i}+m_2v_{2i} = m_1v_{1f}+m_2v_{2f}$$

$$e(v_{1i}-v_{2i}) = (v_{2f}-v_{1f})$$

* Coefficient of restitution : $e$

$$e = \frac{v_{Separation}}{v_{collision}}$$

$$e = \frac{v_{2f}-v_{1f}}{v_{1i}-v_{2i}}$$

$$e(v_{1i}-v_{2i}) = (v_{2f}-v_{1f})$$

$$e = \sqrt{\frac{E_{sys\ f}}{E_{sys\ i}}}$$

[why?](../../../Special/Energy_and_Coefficient_of_restitution.md)

## 2D Collision

### 2D Elastic collision

**step 1**
Convert coordinate system (x,y)>>(n,t)

* Speed direction : $\theta$
* Collision Geometry : $\phi$

$$v_{ni} = v_i\cos(\theta-\phi)$$

$$v_{ti} = v_i\sin(\theta-\phi)$$

$$P_{ni} = P_{nf}$$

$$P_{ti} = P_{tf}$$

$$K_i = K_f$$

**step 2**
The t direction is perpendicular to the collision direction, there is no collision effect, and the movement remains the same。

$$v_{1ti} = v_{1tf}$$

$$v_{2ti} = v_{2tf}$$

so we can find that

$$\frac{1}{2}m_1v_{1ti}^2+\frac{1}{2}m_2v_{2ti}^2 = \frac{1}{2}m_1v_{1tf}^2+\frac{1}{2}m_2v_{2tf}^2$$

$$K_{ti} = K_{tf}$$

**step 3**
Collision in this direction
$$K_i = K_f$$

$$K_{ni}+K_{ti} = K_{nf}+K_{tf}$$

$$K_{ni} = K_{nf}$$

$$\frac{1}{2}m_1v_{1ni}^2+\frac{1}{2}m_2v_{2ni}^2 = \frac{1}{2}m_1v_{1nf}^2+\frac{1}{2}m_2v_{2nf}^2$$

$$m_1v_{1ni}+m_2v_{2ni} = m_1v_{1nf}+m_2v_{2nf}$$

$$v_{1ni}+v_{1nf} = v_{2ni}+v_{2nf}$$

$$v_{1nf} = \frac{v_{1ni}(m_1-m_2)+2m_2v_{2ni}}{m_1+m_2}$$

$$v_{2f} = \frac{v_{2ni}(m_1-m_2)+2m_2v_{1ni}}{m_1+m_2}$$

**step 4**

$$v_{1f} = v_{1tf}\cdot\vec t+v_{1nf}\cdot\vec n$$

$$v_{2f} = v_{2tf}\cdot\vec t+v_{2nf}\cdot\vec n$$

### 2D inelastic collision

**step 1**

* Speed direction : $\theta$
* Collision Geometry : $\phi$

$$v_{ni} = v_i\cos(\theta-\phi)$$

$$v_{ti} = v_i\sin(\theta-\phi)$$

**step 2**

Conditions

1. $v_{1ti} = v_{1tf}$
1. $v_{2ti} = v_{2tf}$
1. $e(v_{1ni}-v_{2ni}) = v_{2nf}-v_{1nf}$
1. $P_{ni} = P_{nf}$

**step 3**

Solve for n directions
$$e(v_{1ni}-v_{2ni}) = v_{2nf}-v_{1nf}$$

$$ev_{1ni}-ev_{2ni} = v_{2nf}-v_{1nf}$$

$$v_{1nf} = (v_{2nf})+ev_{2ni}-ev_{1ni}$$
****
$$m_1v_{1ni}+m_2v_{2ni} = m_1v_{1nf}+m_2v_{2nf}$$

$$v_{2nf} = \frac{m_1v_{1ni}+m_2v_{2ni}-m_1v_{1nf}}{m_2}$$

$$v_{2nf} = \frac{m_1v_{1ni}+m_2v_{2ni}-m_1v_{1nf}}{m_2}$$
****
$$v_{1nf} = (\frac{m_1v_{1ni}+m_2v_{2ni}-m_1v_{1nf}}{m_2})+ev_{2ni}-ev_{1ni}$$

$$v_{1nf}+\frac{m_1v_{1nf}}{m_2} = (\frac{m_1v_{1ni}+m_2v_{2ni}}{m_2})+ev_{2ni}-ev_{1ni}$$

$$v_{1nf}(1+\frac{m_1}{m_2}) = \frac{m_1v_{1ni}+m_2v_{2ni}+m_2ev_{2ni}-m_2ev_{1ni}}{m_2}$$

$$v_{1nf} = \frac{m_1v_{1ni}+m_2v_{2ni}+m_2ev_{2ni}-m_2ev_{1ni}}{m_2+m_1}$$

$$v_{1nf} = \frac{v_{1ni}(m_1-m_2e)+m_2v_{2ni}(1+e)}{m_2+m_1}$$

****
$$v_{2nf} = \frac{m_1v_{1ni} + m_2v_{2ni} - m_1v_{1nf}}{m_2}$$

$$v_{2nf} = \frac{m_1v_{1ni} + m_2v_{2ni} - m_1 \left( \frac{v_{1ni}(m_1 - m_2e) + m_2v_{2ni}(1 + e)}{m_1 + m_2} \right)}{m_2}$$

$$v_{2nf} = \frac{(m_1v_{1ni} + m_2v_{2ni})(m_1 + m_2) - m_1[v_{1ni}(m_1 - m_2e) + m_2v_{2ni}(1 + e)]}{m_2(m_1 + m_2)}$$

$$= m_1v_{1ni}(m_1 + m_2) + m_2v_{2ni}(m_1 + m_2) - m_1v_{1ni}(m_1 - m_2e) - m_1m_2v_{2ni}(1 + e)$$

$$m_1v_{1ni}(m_1 + m_2) - m_1v_{1ni}(m_1 - m_2e) = m_1v_{1ni}[m_1 + m_2 - (m_1 - m_2e)] = m_1v_{1ni}(m_2 + m_2e) = m_1v_{1ni}m_2(1 + e)$$

$$m_2v_{2ni}(m_1 + m_2) - m_1m_2v_{2ni}(1 + e) = m_2v_{2ni}[m_1 + m_2 - m_1(1 + e)]
= m_2v_{2ni}[m_2 - m_1e]
$$

$$v_{2nf} = \frac{m_1v_{1ni}m_2(1 + e) + m_2v_{2ni}(m_2 - m_1e)}{m_2(m_1 + m_2)}$$

$$v_{2nf} = \frac{ v_{2ni}(m_2 - m_1e)+v_{1ni}m_1(1 + e)}{m_1 + m_2}$$

**step 4**

$$v_{1f} = v_{1tf}\cdot\vec t+v_{1nf}\cdot\vec n$$

$$v_{2f} = v_{2tf}\cdot\vec t+v_{2nf}\cdot\vec n$$
