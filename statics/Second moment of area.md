---
title: Second moment of area
tags: [statics, mechanics]

---

# Second moment of area
## 
$$\Delta F = Cy\Delta A$$
* constant : $C$
* distanec form $\Delta A$ to the axis : $y$
$$F = \int\ dF = \int Cy\ dA = C\int y\ dA$$

$$M = \int y\ dF = C\int y^2dA$$

$$I_x = \int y^2\ dA > 0$$

$$I_y = \int x^2\ dA > 0$$
## Polar moment of area

$$J_0 = \int r^2 dA$$

$$r^2 = x^2+y^2$$

$$J_0 = \int r^2\ dA = \int(x^2+y^2)dA $$

$$= I_x+I_y$$

## Second moment of different geometric
* rectangular
$$dI_x = y^2\ dA = by^2\ dy$$

$$I_x = b\int_0^h y^2\ dy = \frac13bh^3$$
* triangle
$$dI_x = y^2\ dA = y^2l\ dy$$

$$l/b = (h-y)/h$$

$$l = (h-y)b-/h$$

$$I_x = \int y^2\ dA = \int_0^h((h-y)b/h)\ dy$$

$$= b/h\int_0^h(y^2h-y^3)dy = b/h(\frac{hy^3}{3}-\frac{y^4}{4})$$

$$= \frac{bh^3}{12}$$
* circle
$$dJ_0 = u^2\ dA = u^22\pi u\ du$$

$$J_0 = \int\ dJ_0 = \int_0^r2\pi u^3\ du = \frac12\pi r^4$$

$$I_x = I_y$$

$$J_0 = I_x+I_y$$

$$I_x = J_0/2 = \frac{\pi r^4}{4}$$
## Similar
1. Centroid : $\frac{\int r\ dA}{\int\ dA}$
2. center of mass : $\frac{\int r\ dm}{\int\ dm}$
3. Second moment of area : $\int r^2\ dA$
4. moment of Inertia : $\int r^2\ dm$