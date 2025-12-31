# Involute Polar coordinates
$$x = a(\cos \phi+\phi\sin \phi)$$

$$y = a(\sin \phi-\phi\cos \phi)$$

$$\theta = \tan^{-1}\frac xy$$

$$\tan\theta = \frac{a(\cos \phi+\phi\sin \phi)}{a(\sin \phi-\phi\cos \phi)}$$

$$\tan\theta = \frac{\cos \phi+\phi\sin \phi}{\sin \phi-\phi\cos \phi}$$

* $\tan \phi = \frac{\sin \phi}{\cos \phi}$

$$\tan\theta = \frac{\cos \phi+\phi\cos \phi\tan \phi}{\cos \phi\tan \phi-\phi\cos \phi}$$

$$\tan\theta = \frac{\cos \phi(1+\phi\tan \phi)}{\cos \phi(\tan \phi-\phi)}$$

$$tan\theta = \frac{1+\phi\tan \phi}{\tan \phi-\phi}$$
:::success
$$\theta = \tan^{-1}(\frac{1+\phi\tan \phi}{\tan \phi-\phi})$$
:::
****
$$R = \sqrt{x^2+y^2}$$

$$= \sqrt{(r(\cos \phi+\phi\sin \phi))^2+(r(\sin \phi-\phi\cos \phi))^2}$$

$$= \sqrt{r^2((\cos \phi+\phi\sin \phi)^2+(\sin \phi-\phi\cos \phi)^2)}$$

$$= r\sqrt{(\cos \phi+\phi\sin \phi)^2+(\sin \phi-\phi\cos \phi)^2}$$

$$= r\sqrt{(\cos \phi)^2+(\phi\sin \phi)^2+2\phi\sin \phi\cos \phi+(\sin \phi)^2+(\phi\cos \phi)^2-2\phi\cos \phi\sin \phi}$$

$$= r\sqrt{(\cos \phi)^2+(\phi\sin \phi)^2+(\sin \phi)^2+(\phi\cos \phi)^2}$$

* $\sin^2\phi+\cos^2\phi = 1$

$$= r\sqrt{1+\phi^2\sin^2 \phi+\phi^2\cos^2\phi}$$

$$= r\sqrt{1+\phi^2(\sin^2 \phi+\cos^2\phi)}$$
:::success
$$R = r\sqrt{1+\phi^2}$$
:::
