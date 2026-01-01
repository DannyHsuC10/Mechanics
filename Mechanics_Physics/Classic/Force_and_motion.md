# Force & motion
## acceleration of gravity
The universal gravitational constant is not the acceleration due to gravity
$G = 6.6743⋅10^{-11}⋅(Nm^2/kg^2)$
$\not= g = \frac{GM}{R^2} = 9.8 ⋅(m/s^2)$

* When $\vec{F_{net}} = 0$
$\vec{F} = m\vec{a}$ if $\vec{a} = \vec{g}$

$$F_g = w = mg$$

$$F_{net} = 0 = F_N-w = ma$$

$$a = 0$$

$$w = mg = F_g = F_N$$

<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/ByJJmleVgg.png" alt="image"width="300">
</div>

* When $\vec{F_{net}} \not= 0$

$$\vec{F_{net}} = F_x\vec{i}+F_y\vec{j}+F_z\vec{k}$$

$$F_{net} = F_N-F_g+F_x+F_y+F_z$$

$$a = m(a_x\vec{i}+a_y\vec{j}+a_z\vec{k})$$

## Tension
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/Hke_QllExg.png" alt="image"width="200" height="175">
<img src="https://hackmd.io/_uploads/rybDQllEge.png" alt="image"width="300" height="175">
</div>

Tension : $T \qquad$ Friction : $f$

Stationary : $F_{net} =0 \qquad \vec{T} = -\vec{f}$

Moving at constant speed : $F_{net} = \vec{T}-\vec{f} = 0 \qquad \vec{T} = -\vec{f}$

Moving at constant acceleration : $F_{net} = \vec{T}+\vec{F}-\vec{f} \qquad \vec{T} = \vec{f}-\vec{F}$

## Pulley

<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/SyMIVgl4le.png" alt="image"width="250" height="250">
</div>



Tension : $T \qquad$ weight : $mg$

Stationary : $F_{net} =0 \qquad \vec{T} = -\vec{mg}$

Moving at constant speed : $F_{net} =0 \qquad \vec{T} = \vec{mg}$

Moving at constant acceleration : $F_{net} =T-mg \qquad a = (F-mg)/m$

## Friction
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/B1wSvel4xl.png" alt="image"width="350" height="">
</div>

* Friction of objects under different conditions
There are four common conditions below
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/BkSAVgl4xg.png" alt="image"width="250" height="">
</div>

$F_{x} = 0$ , Stationary : $F_{netx} = f = 0 \qquad F_y = N$
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/r1pMSgg4el.png" alt="image"width="250" height="250">
</div>

$F_{x} \not= 0$ , Stationary : $F_x = f \qquad F_y = N$

<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/Hy5oBexExl.png" alt="image"width="250" height="">
</div>

$F_{x} \not= 0$ , Moving at constant speed : $F_x = f \qquad F_y = N$
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/S1U5HllEel.png" alt="image"width="250" height="">
</div>

$F_{x} \not= 0$ , Moving at constant acceleration : $F_x > f \quad F_y = N \quad F_{netx} = F_x-f \not= 0$

* Dynamic friction & static friction

<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/SJ4oLxxEle.png" alt="image"width="400" height="">
</div>

when $v = 0$ & $F = 0 \qquad f_s = F = 0$

when $v = 0 \qquad f_s = F =$ static friction

when $v = 0 \qquad f_{smax} = 𝜇_sN = 𝜇_smg =$ static friction max

when $v \not= 0 \qquad f_k = 𝜇_kN = 𝜇_kmg =$ Dynamic friction
	
## slope & force
![image](https://hackmd.io/_uploads/SJITwelElg.png)

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
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/HJoeOll4el.png" alt="image"width="220" height="300">
</div>

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
![image](https://hackmd.io/_uploads/Syu8_llVex.png)

* Centripetal Force

Definition : Centripetal force is the force that keeps an object moving in a circular path, directed towards the center of the circle.

Direction: It always points inward, towards the center of the circular path.

* Centrifugal Force

Definition: Centrifugal force is a pseudo force (apparent force) experienced by an object moving in a circular path when viewed from a rotating reference frame. It acts outward, away from the center of the circle.

Direction: It always points outward, away from the center of the circular path.

if $\omega$ is a constant
$$𝛼 = 0$$

$$a = \frac{v^2}{r}$$

$$F = ma = m\frac{v^2}{r}$$

Centripetal force $=$ Centrifugal force = $m\frac{v^2}{r}$