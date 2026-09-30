---
layout: base
---

# Friction wheel

Friction wheels transmit motion through tangential contact forces. Compare contact speed and available friction when estimating the speed ratio and transmitted power.

## Power

Power measures the rate of energy transfer. Use the translational or rotational expression that matches the mechanism.

$$P = Fv = fv$$

$$f = \mu N$$

$$P = \mu Nv = \mu F \frac{\pi DN}{60}$$

$$\text{PS} = \mu F \frac{\pi DN}{735\times60}$$

## Transmission distance

| type                  | Internal contact | External contact |
|:--------------------- |:----------------:|:----------------:|
| Transmission distance |     $R-r$      |     $R+r$      |

## speed ratio

$$v_1 = v_2$$

$$v_1 = r_1\omega_1 = v_2 = r_r\omega_2$$

$$\frac{\omega_1}{\omega_2} = \frac{N_1}{N_2} = \frac{R_2}{R_1} = \frac{D_2}{D_1}$$

## Conical friction wheel

### External contact

$$\frac{N_1}{N_2} = \frac{\sin\beta}{\sin\alpha} = \frac{\sin(\theta-\alpha)}{\sin\alpha}$$

$$= \frac{\sin\theta\cos\alpha-\cos\theta\sin\alpha}{\sin\alpha}$$

$$= \frac{\sin\theta-\cos\theta(\frac{\sin\alpha}{\cos\alpha})}{\frac{\sin\alpha}{\cos\alpha}}$$

$$= \frac{\sin\theta-cos\theta\tan\alpha}{\tan\alpha}$$

$$\frac{N_1}{N_2}\tan\alpha = \sin\theta-\cos\theta\tan\alpha$$

$$\tan\alpha = \frac{\sin\theta}{\frac{N_1}{N_2}+\cos\theta}$$

$$\tan\beta = \frac{\sin\theta}{\frac{N_2}{N_1}+\cos\theta}$$

* if $\theta = \alpha+\beta = 90^o$

$$\tan\alpha = \frac{N_2}{N_1}$$

$$\tan\beta = \frac{N_1}{N_2}$$

### Internal contact

$$\frac{N_1}{N_2} = \frac{\sin\beta}{\sin\alpha} = \frac{\sin(\alpha-\theta)}{\sin\alpha}$$

$$\frac{\sin\alpha\cos\theta-\cos\alpha\sin\theta}{\sin\alpha}$$

$$\frac{\cos\theta(\frac{\sin\alpha}{\cos\alpha})-\sin\theta}{\frac{\sin\alpha}{\cos\alpha}}$$

$$\frac{\cos\theta\tan\alpha-\sin\theta}{\tan\alpha}$$

$$\frac{N_1}{N_2}\tan\alpha = \cos\theta\tan\alpha-\sin\theta$$

$$\boxed{\alpha = \arctan(\frac{\sin\theta}{\cos\theta-\frac{N_1}{N_2}})}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-023"
  data-expression="arctan(sin(theta)/(cos(theta)-N_1/N_2))"
  data-inputs="theta:shaft angle rad,N_1:first wheel speed rpm,N_2:second wheel speed rpm"
  data-result="alpha"
  data-unit="rad"
  data-constants=""
  data-note="Enter theta in radians and nonzero speeds. Returns the principal arctangent between -pi/2 and pi/2; the physical cone angle may require a different branch. The denominator must be nonzero.">
</div>

$$\boxed{\beta = \arctan(\frac{\sin\theta}{\frac{N_2}{N_1}-\cos\theta})}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-024"
  data-expression="arctan(sin(theta)/(N_2/N_1-cos(theta)))"
  data-inputs="theta:shaft angle rad,N_2:second wheel speed rpm,N_1:first wheel speed rpm"
  data-result="beta"
  data-unit="rad"
  data-constants=""
  data-note="Enter theta in radians and nonzero speeds. Returns the principal arctangent; check the physical cone-angle branch. The denominator must be nonzero.">
</div>

## Perpendicular disks

<div style="text-align: center;">
<img src="1024px-TEZ-Reibradgetriebe_7271.jpg" alt="image" width="300">
</div>

$$v_A = v_B$$

$$2\pi r_AN_A = 2\pi r_BN_B$$

$$\frac{N_A}{N_B} = \frac{r_B}{r_A}$$
