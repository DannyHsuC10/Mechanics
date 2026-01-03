---
layout: base
---

# Linkage

## Four-bar linkage

<div style="text-align: center;">
<img src="Linkage_four_bar_fixed.svg.png" alt="image" width="200">
</div>

## Quick return mechanism

$$t_\text{total} = t_\text{in}+t_\text{out}$$

$$t_\text{in} =t_\text{total}\cdot\frac\theta\pi$$

$$t_\text{out} = t_\text{total}(1-\frac\theta\pi)$$

## Degrees of freedom

* Number of Pairs : $P$
* Number of Linkage : $L$
**fixed**
$$P=  \frac32L-2$$
**Single degree of freedom**
$$P>\frac32L-2$$
**Multiple degrees of freedom**
$$P<\frac32L-2$$

## Four-bar linkage motion

**step 1**

$$\vec{AB}+\vec{BC}=\vec{AD}+\vec{DC}$$

$$\vec{r_2}+\vec{r_3}-\vec{r_1}-\vec{r_4} = 0$$

**step 2**

$$v_B = \omega_2r_{AB}$$

$$v_c = v_B+\omega_3r_{BC}$$

$$v_c = \omega_4r_{DC}$$

$$v_B+\omega_3r_{BC} = \omega_4r_{DC}$$

**step 3**

$$a_B = \alpha_2r_{AB}-\omega_2^2r_{AB}$$

$$a_C = a_B+\alpha_3r_{BC}-\omega_3^2r_{BC}$$

$$a_C = \alpha_4r_{DC}-\omega_4^2r_{DC}$$

$$\alpha_4r_{DC}-\omega_4^2r_{DC} = a_B+\alpha_3r_{BC}-\omega_3^2r_{BC}$$

## Slider–crank

* Crank : $AB = r$,$\theta$
* Linkage : $BC = l$,$\phi$
* Slider : $C$
* Fix : $A$

**step 1**

$$x_C = r\cos\theta+l\cos\phi$$

$$r\sin\theta = l\sin\phi$$

**step 2**
$$v_B = \omega_2r_{AB} = \omega_2(-r\sin\theta+r\cos\theta)$$

$$v_C = v_B+\omega_3r_{BC}+v_{rel}$$

**step 3**

$$a_B = \alpha_2r_{AB}-\omega_2^2r_{AB}$$

$$a_C = a_B+\alpha_3r_{BC}-\omega_3^2r_{BC}+2\omega_3v_{rel}+a_{rel}$$
