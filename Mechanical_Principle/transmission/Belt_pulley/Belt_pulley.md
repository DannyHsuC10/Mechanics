# Belt pulley
## Transmission method
### Open Belt Drive
<div style="text-align: center;">
<img src="https://themechanicalengineering.com/wp-content/uploads/2022/01/OPEN-BELT-DRIVE.png" alt="image"width="400">
</div>

### Cross Belt Drive
<div style="text-align: center;">
<img src="https://themechanicalengineering.com/wp-content/uploads/2022/01/CROSS-BELT-DRIVE-LINE-DIAGRAM.jpg" alt="image"width="400">
</div>

> https://themechanicalengineering.com/open-belt-drive-and-cross-belt-drive/
## Belt length
>![Belt length](https://www.vcalc.com/attachments/788be105-ed67-11e3-b7aa-bc764e2038f2/TwoPulleyBeltLength-illustration.png)
>https://www.vcalc.com/equation/?uuid=788be105-ed67-11e3-b7aa-bc764e2038f2

$$\text{BL} = (\pi\frac D2+2u)+(\pi\frac d2-2v)+2b = \frac{\pi(D+d)}2+2(u-v)+2b$$
****
$$2u-2v = 2R\theta-2r\theta = 2\theta(R-r) = 2\theta(\frac D2-\frac d2) = \theta(D-d)$$

$$S = r\theta$$

* when $\theta$ is very small $\sin
\theta = \theta$

$$\theta = \sin^{-1}(\frac{R-r}L) = \sin^{-1}(\frac{\frac D2-\frac d2}L) = \sin^{-1}(\frac{D-d}{2L})\simeq\frac{D-d}{2L}$$

$$2(u-v) = \frac{D-d}{2L}(D-d) = \frac{(D-d)^2}{2L}$$
****
$$b = L\cos\theta = L-L(1-\cos\theta)$$

$$\cos \theta = \cos^2\frac\theta2-\sin^2\frac\theta2$$

$$1-\cos\theta = \cos^2\frac\theta2+\sin^2\frac\theta2-\cos^2\frac\theta2+\sin^2\frac\theta2 = 2\sin^2\frac\theta2$$

$$b = L-2L\sin^2\frac\theta2\simeq L-2L(\frac\theta2)^2$$

$$L-2L(\frac\theta2)^2 = L-2L(\frac{D-d}{4L})^2 = L-\frac{(D-d)^2}{8L}$$

$$2b = 2L-\frac{(D-d)^2}{4L}$$
****
$$\text{BL} = \frac{\pi(D+d)}2+\frac{(D-d)^2}{2L}+2L-\frac{(D-d)^2}{4L}$$
:::success
$$\text{BL} = \frac{\pi(D+d)}2+2L+\frac{(D-d)^2}{4L}$$
:::
### Open Belt Drive
$$\text{BL} = \frac{\pi(D+d)}2+2L+\frac{(D-d)^2}{4L}$$
### Cross Belt Drive
$$\text{BL} = \frac{\pi(D+d)}2+2L+\frac{(D+d)^2}{4L}$$
## Contact angle
### Open Belt Drive
$$\theta_1+\theta_2 = 360$$

$$\theta_1>180^o\qquad180^o>\theta_2>120^o$$

$$\theta_1 = \frac\pi2+2\phi$$

$$\theta_2 = \frac\pi2-2\phi$$
### Cross Belt Drive
$$\theta_1 = \theta_2 = \frac\pi2+2\phi = \frac\pi2+(\frac{D+d}{2L})$$
## Speed ratio
$$v_1 = \pi(D_1+t)N_1$$

$$v_2 = \pi(D_2+t)N_2$$

$$v_1 = v_2$$

$$\pi(D_1+t)N_1 = \pi(D_2+t)N_2$$

if $t<<1$

$$\frac{N_1}{N_2} = \frac{D_2}{D_1}$$

Consider efficiency
$$\frac{N_1}{N_2} = \frac{D_2+t}{D_1+t}(1-\eta)$$

if $t<<1$

$$\frac{N_1}{N_2} = \frac{D_2}{D_1}(1-\eta)$$

## Power
$$F_0 = \frac12(F_1-F_2)$$

$$F_\text{efficient} = F_1-F_2$$

$$F_1>F_0>F_2$$

$$P = Fv = (F_1-F_2)\frac{\pi DN}{60}$$

$$\text{PS} = \frac P{735} = \frac{Fv}{735} = (F_1-F_2)\frac{\pi DN}{735\times60}$$
## Tensions ratio
![image](https://hackmd.io/_uploads/HJ-rn9GNel.png)
</div>

$$\frac{F_1}{F_2} = e^{\mu\theta}$$

$$\theta_1-\theta_2 = \theta\qquad-(0)$$

$$f = \mu N$$

$$\tau = Fr$$

$$\sum F_x = 0\qquad\cos(\frac{d\theta}{2})(T+dT)-\mu N-\cos(\frac{d\theta}{2})T = 0\qquad -(1)$$

$$\sum F_y = 0\qquad\sin(\frac{d\theta}{2})(T+dT)+\sin(\frac{d\theta}{2})T-N = 0\qquad -(2)$$

$$\lim_{d\theta\to0}\cos(\frac{d\theta}{2}) = 1 -(3)$$

$$\lim_{d\theta\to0}\sin(\frac{d\theta}{2}) = \frac{d\theta}{2} -(4)$$

$$(3)\Longrightarrow(1)\qquad T+dT-\mu N-T = 0$$

$$dT = \mu N\qquad-(5)$$

$$(4)\Longrightarrow(2)\qquad\frac{d\theta}{2}(T+dT)+\frac{d\theta}{2}T-N = 0$$

$$2(\frac{d\theta}{2}T)+\frac{d\theta}{2}dT-N = 0$$

$$d\theta T = N\qquad-(6)$$

$$(6)\Longrightarrow(5)\qquad dT = \mu d\theta T$$

$$\frac{dT}{T} = \mu d\theta$$

$$\int_{F_1}^{F_2}\frac{dT}{T} = \int_{\theta_1}^{\theta_2}\mu\ d\theta$$

$$\ln(T)|^{F_2}_{F_1} = \mu\ d\theta|^{\theta_2}_{\theta_1}$$

$$\ln(F_1)-\ln(F_2) = \mu\theta$$

$$\ln(\frac{F_2}{F_1}) = \mu\theta$$

$$\frac{F_2}{F_1} = e^{\mu\theta}$$
## Step pulley
### Open Belt Drive
$$\frac{n_x}{N} =\frac{D_x}{d_x}$$

$$\text{BL} = \frac{\pi(D_1+d_1)}2+2L+\frac{(D_1-d_1)^2}{4L}$$

$$\frac{\pi(D_1+d_1)}2+2L+\frac{(D_1-d_1)^2}{4L} = \frac{\pi(D_2+d_2)}2+2L+\frac{(D_2-d_2)^2}{4L}$$

$$\frac{\pi(D_1+d_1)}2+2L+\frac{(D_1-d_1)^2}{4L} = \frac{\pi(D_3+d_3)}2+2L+\frac{(D_3-d_3)^2}{4L}$$

$$\frac{\pi(D_1+d_1)}2+2L+\frac{(D_1-d_1)^2}{4L} = \frac{\pi(D_x+d_x)}2+2L+\frac{(D_x-d_x)^2}{4L}$$
### Cross Belt Drive
$$\frac{n_x}{N} =\frac{D_x}{d_x}$$

$$D_1+d_1 = D_2+d_2$$

$$D_1+d_1 = D_3+d_3$$

$$D_1+d_1 = D_x+d_x$$
## Equal step pulley
$$N_1n_1 = N_2n_2 = N_xn_x$$