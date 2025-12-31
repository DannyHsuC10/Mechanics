---
layout: base
---

# Involute equation
![maxresdefault](https://hackmd.io/_uploads/SkbbxwOUlg.jpg)
https://youtu.be/NIGw_dlEzQ4?si=U7IsNVaTh7h40MlH
* $\overline{OB} = r$
* $\overline{OA} = r\cos\phi$
* $\overline{BA} = r\sin\phi$
* $\overline{BC} = r\theta$
* $\overline{DC} = r\phi\cos(\frac\pi2-\phi)$
* $\overline{BD} = r\phi\sin(\frac\pi2-\phi)$

$$x = r\cos\phi+r\phi\cos(\frac\pi2-\phi)$$

$$ = r (\cos\phi+r\phi\cos(\frac\pi2-\phi))$$
:::success
$$x = r(\cos\phi+\phi\sin\phi)$$
:::
$$y = r\sin\phi-r\phi\sin(\frac\pi2-\phi)$$

$$ = r(\sin\phi-\phi\sin(\frac\pi2-\phi))$$
:::success
$$y = r(\sin\phi-\phi\cos\phi)$$
:::
$$R = \sqrt{x^2+y^2}$$

$$= \sqrt{(r(\cos\phi+\phi\sin\phi))^2+( r(\sin\phi-\phi\cos\phi))^2}$$

$$= \sqrt{r^2\cos^2\phi+r^2\phi^2\sin^2\phi+r^2\sin^2\phi+r^2\phi^2\cos^2\phi}$$

$$= \sqrt{r^2+(r\phi)^2}$$

$$ = \sqrt{r^2+r^2\phi^2}$$

$$ = \sqrt{r^2(1+\phi^2)}$$

$$r\sqrt{(1+\phi^2)}$$

$$\frac Rr = \sqrt{1+\phi^2}$$

$$1+\phi^2 = (\frac Rr)^2$$
:::success
$$\phi = \sqrt{(\frac Rr)^2-1}$$
:::