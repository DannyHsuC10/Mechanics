# center of mass

$$M_{cen}(x,y)$$

$$x = \frac{\sum m_ix_i}{\sum m_i}$$

$$y = \frac{\sum m_iy_i}{\sum m_i}$$
if density is uniform , then $M_{cen} = A_{cen}$
if gravitational field is uniform , then $G_{cen} = M_{cen}$

## Centroid of line

$$\frac{\sum L_ir_i}{\sum L_i}$$

1. **Straight line**
$$x_{cen} = \int_0^L\frac{(m/L)xdx}{m} = \left[\frac{x^2}{2L}\right]_o^L$$
$$= \frac{L^2}{2L} = \frac L2$$
2. **Arc**
$$L = 2\pi r\frac{2\alpha}{2\pi} = 2r\alpha$$

$$D = \frac{m}{2r\alpha}$$

$$\sum m_i = m$$
***
$$y_{cen} = \int_0^L\frac{ydL}{L}$$

$$dL = Drd\theta = \frac{m}{2r\alpha}Rd\theta$$

$$L = rsin(\theta)$$

$$\int_0^L\frac{ydL}{L} = \int_{\pi/2-\alpha}^{\pi/2+\alpha}\frac{r\ sin(\theta)\ mr\
 d\theta}{2rm\alpha}$$

$$= \frac{r}{2\alpha}\int_{\pi/2-\alpha}^{\pi/2+\alpha}sin(\theta)= \frac{r}{2\alpha}\left[-cos(\theta)\right]_{\pi/2-\alpha}^{\pi/2+\alpha}$$

$$= (\frac{-r}{2\alpha}cos(\frac\pi2+\alpha))-(\frac{-rcos(\frac\pi2-\alpha)}{2\alpha})$$

$$= -r(-sin(\alpha)-sin(\alpha))\cdot\frac{1}{2\alpha}$$

$$= \frac{-r(-2sin(\alpha))}{2\alpha}$$

$$= \frac{rsin(\alpha)}{\alpha}$$
## Centroid
1. **Rectangle**
$$A_{cen}(x,y)$$

$$x_{cen} = \int_0^a\frac{A}{ab}\frac1Abx\ dx$$

$$= \frac a2$$

$$y_{cen} = \int_0^b\frac{A}{ab}\frac1Aay\ dy$$

$$= \frac b2$$
2. **Triangle**
$$A = \frac{ab}2$$

$$x_{cen} = \int_0^a\frac{A}{\frac12ab}
\frac1A\frac bax^2\ dx$$

$$= \frac23a$$

The other direction : $a-\frac23a = \frac13a$

$$y_{cen} = \int_0^b\frac{A}{\frac12ab}
\frac1A(a-\frac {-ay}b)y\ dx$$

$$= \frac{2}{b^2}\int_0^b(by-y^2)\ dy$$

$$= b-\frac13b = \frac12b$$

The other direction : $b-\frac23b = \frac13b$
3. **Sector & Semicircle & Circle**
$$A = r^2\alpha$$

$$y_{cen} = \int_0^r\frac1{r^2\alpha}\frac{r\ sin(\alpha)}{\alpha}2r\alpha\ dr$$

$$\frac{2\ sin(\alpha)}{r^2\alpha}\int_0^rr^2\ dr$$

$$\frac{2\ sin(\alpha)}{r^2\alpha}\frac{r^3}3$$

$$\frac{2r\ sin(\alpha)}{3\alpha}$$
