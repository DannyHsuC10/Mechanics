---
title: Force & motion
tags: ["classic\_", mechanics]

---

# Force & motion
## acceleration of gravity
The universal gravitational constant is not the acceleration due to gravity
$G = 6.6743⋅10^{-11}⋅(Nm^2/kg^2)$
$\not= g = \frac{GM}{R^2} = 9.8 ⋅(m/s^2)$

* When $\vec{F_{net}} = 0$
$\vec{F} = m\vec{a}$ if $\vec{a} = \vec{g}$

$$F_g = W = mg$$

$$F_{net} = 0 = F_N-W = ma$$

$$a = 0$$

$$W = mg = F_g = F_N$$

* When $\vec{F_{net}} \not= 0$

$$\vec{F_{net}} = F_x\vec{i}+F_y\vec{j}+F_z\vec{k}$$

$$F_{net} = F_N-F_g+F_x+F_y+F_z$$

$$a = m(a_x\vec{i}+a_y\vec{j}+a_z\vec{k})$$

## Tension
![tension](https://hackmd.io/_uploads/ryvKxz-Mkx.png)

Tension : $T \qquad$ Friction : $f$

Stationary : $F_{net} =0 \qquad \vec{T} = -\vec{f}$

Moving at constant speed : $F_{net} = \vec{T}-\vec{f} = 0 \qquad \vec{T} = -\vec{f}$

Moving at constant acceleration : $F_{net} = \vec{T}+\vec{F}-\vec{f} \qquad \vec{T} = \vec{f}-\vec{F}$

## Pulley
Tension : $T \qquad$ weight : $mg$

Stationary : $F_{net} =0 \qquad \vec{T} = -\vec{mg}$

Moving at constant speed : $F_{net} =0 \qquad \vec{T} = \vec{mg}$

Moving at constant acceleration : $F_{net} =T-mg \qquad a = (F-mg)/m$

## Friction
* Friction of objects under different conditions
There are four common conditions below
![Fx=0 fiction](https://hackmd.io/_uploads/S1Nv9zZGye.png)
$F_{x} = 0$ , Stationary : $F_{netx} = f = 0 \qquad F_y = N$
![Stationary Fx fiction](https://hackmd.io/_uploads/HJjt9fWfke.png)
$F_{x} \not= 0$ , Stationary : $F_x = f \qquad F_y = N$
![moving constant fiction](https://hackmd.io/_uploads/Bkg35fWGJg.png)
$F_{x} \not= 0$ , Moving at constant speed : $F_x = f \qquad F_y = N$
![moving acceleration fiction](https://hackmd.io/_uploads/S1n35MbGJe.png)
$F_{x} \not= 0$ , Moving at constant acceleration : $F_x > f \quad F_y = N \quad F_{netx} = F_x-f \not= 0$

* Dynamic friction & static friction

when $v = 0$ & $F = 0 \qquad f_s = F = 0$

when $v = 0 \qquad f_s = F =$ static friction

when $v = 0 \qquad f_{smax} = 𝜇_sN = 𝜇_smg =$ static friction max

when $v \not= 0 \qquad f_k = 𝜇_kN = 𝜇_kmg =$ Dynamic friction
	
## slope & force
When an object is on a slope and $𝜇_f = 0$
$$N = mg⋅cos𝜃$$

$$(mg⋅cos𝜃)^2+(mg⋅sin𝜃)^2 = mg$$
:::success
$$a = g⋅sin𝜃$$
:::
## Damping force
$$D_1 = bv$$

$$mg-bv = ma$$

$$a = g-\frac bmv$$

$$\frac{dv}{dt} = g-\frac bmv$$

$$\frac{dv}{g-bv/m} = dt$$

$$\int\frac{dv}{g-bv/m} = \int dt$$

let $u = g-\frac bmv$ , $\frac{du}{dv} = \frac{d(g-\frac bmv)}{dv}$

then $du = -\frac bmdv$ , $dv = -\frac mbdu$

$$\int\frac{dv}{g-bv/m} = -\frac mb\int\frac{du}{u}$$

$$=-\frac mbln(u)+C_1 = -\frac mbln(g-\frac bmv)+C_1$$

$$-\frac mbln(g-\frac bmv)+C_1 = t+C_2$$
let $C_1-C_2 = C'$

$$ln(g-\frac bmv) = -\frac bm(t+C')$$

$$g-\frac bmv = e^{-\frac bm(t+C')}$$
when $t = 0$
$$g = e^{bc'/m}$$

$$C' = -\frac mbln(g)$$

$$g-\frac bmv = e^{-\frac bm(t-\frac mbln(g))}$$

$$g-\frac bmv = ge^{-\frac bmt}$$

$$1-\frac {bv}{mg} = e^{-\frac bmt}$$
:::success
$$v = \frac{mg}{b}(1-e^{-bt/m})$$
:::
when $a = 0$ then $v = v_T =$ Terminal velocity
$$0 = g-\frac{bv_T}{m}$$
:::success
$$v_T = \frac{mg}{b}$$
:::
## Backward force & Terminal velocity
* Air resistance : $D_2$ unit : $N = \frac{kg⋅m}{s^2}$
* Fluid density : $p$
* Area : $A$
* Constant : $C$
* Velocity : $v$
:::success
$$D_2 = \frac{1}{2}C\rho Av^2$$
:::
when $a \not= 0$ Terminal velocity has not been reached yet

when $a = 0$ then $v = v_T =$ Terminal velocity 

$$D_2-mg = 0$$

$$\frac{1}{2}C\rho Av_T^2-mg = 0$$
:::success
$$v_T = \sqrt\frac{2mg}{C\rho A}$$
:::
## Centripetal force & Centrifugal force
* Centripetal Force

Definition : Centripetal force is the force that keeps an object moving in a circular path, directed towards the center of the circle.

Direction: It always points inward, towards the center of the circular path.

* Centrifugal Force

Definition: Centrifugal force is a pseudo force (apparent force) experienced by an object moving in a circular path when viewed from a rotating reference frame. It acts outward, away from the center of the circle.

Direction: It always points outward, away from the center of the circular path.

if $W$ is a constant
$$𝛼 = 0$$

$$a = \frac{v^2}{r}$$

$$F = ma = m\frac{v^2}{r}$$

Centripetal force $=$ Centrifugal force = $m\frac{v^2}{r}$