---
title: Plane force system

---

# Plane force system
## Decomposition of force
$$F_x = Fcos(\theta)$$

$$F_y = Fsin(\theta)$$

$$\frac{F}{r} = \frac{F_x}{x} = \frac{F_y}{y}$$
## forces synthesis
* **two forces**
$$F = F_A+F_B$$

$$F_B = F-F_A$$

$$F_A = F-F_B$$

$$F = \sqrt{(F_A+F_Bcos(\theta))^2+(Fsin(\theta))^2}$$

$$= \sqrt{F_A^2+2F_AF_Bcos(\theta)+F_B^2cos(\theta)+F_B^2sin(\theta)}$$

$$F = \sqrt{F_A^2+F_B^2+2F_AF_Bcos(\theta)}$$

$$\alpha = tan^{-1}\frac{F_Bsin(\theta)}{F_A+F_Bcos(\theta)}$$
* **Multiple force**
$$F = \sqrt{(\sum F_x)^2+(\sum{F_y})^2}$$

## Two support points Load force
* **point load**
$$F_A+F_B = w$$
* **uniformly distributed load**
$$F_A = \int_0^L\frac wLdx =\frac w2$$
* **uniformly varying load**
$$F_A = \int_0^L\frac wL\frac{x}{L}dx = \frac w3$$
* **unevenly varying load**
$$F_A = \frac wL\int_0^L(\frac{x}{L})^n+(\frac{x}{L})^{n-1}+...dx$$
