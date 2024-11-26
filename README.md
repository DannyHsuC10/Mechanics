# Center of Mass & Momentum
## Center of mass
$$r_{com} =\sum\frac{m_ir_i}{m_i} $$

$$ = \frac{(m_1r_1+m_2r_2+...m_nr_n)}{(m_1+m_2+...m_n)}$$

$$ = \frac{(m_1r_1+m_2r_2+...m_nr_n)}{M}$$

$$\vec{r_i} = x_i\vec{i}+y_i\vec{j}+z_i\vec{k}$$

$$x_{com} = \sum\frac{m_ix_i}{m_i} $$

$$y_{com} = \sum\frac{m_iy_i}{m_i} $$

$$z_{com} = \sum\frac{m_iz_i}{m_i} $$

$$P_{moc}(x,y,z) = \frac{1}{M}\sum{(m_ix_i,m_iy_i,m_iz_i)}$$

## Density
$$D = \frac{m}{V}$$

## Momentum and Impulse
$$\vec{F_{net}} = M\vec{a_{com}}$$
* Momentum
$$\vec{P} = m\vec{V}$$

$$\vec{F} = \frac{d\vec{p}}{dt} = \frac{md\vec{v}}{dt} = m\vec{a}$$

* Impulse
$$\vec{J} = P_i-P_f$$

$$J = \int_{t_i}^{t_f}Fdt = F{\Delta t}$$

* momentum conservation
$P_{com}$ is a constant
$P_{comi} = P_{comf}$

## Collision
$$P_1i+P_2i = P_1f+P_2f$$
* Inelastic collision

$$m_1V_{1i}+m_2V_{2i} = m_1V_{1f}+m_2V_{2f}$$

$$V_{1f}=V_{2f}$$

if$V_{2i} = 0$
$$m_1V_i = (m_1+m_2)V_f$$

$$V_f = \frac{m_1V_i}{m_1+m_2}$$

$$\vec{P_{com}} = MV_{comi} = MV_{comf}$$

$$\vec{P_{com}} = \vec{P_{1i}}+\vec{P_{2i}}$$

$$V_{comf} = \frac{\vec{P_{com}}}{M} = \frac{\vec{P_{com}}}{m_1+m_2}$$
* Elastic collision
if $m_1 = m_2$ and $m_{2i} = 0$ , then $V_{1i} = V_{2f}$ and $V_{1f} = 0$
if $m_1 >> m_2$ and $m_{2i} = 0$ , then $V_{1f} \simeq V_{2f} \simeq V_{1i}$ 
if $m_1 << m_2$ and $m_{2i} = 0$ , then $V_{1f} \simeq -V_{1i}$ and $V_{2f} \simeq 0$

$$K_{1i}+K_{2i} = K_{1f}+K_{2f}$$

$$m_1V_{1i}+m_2V_{2i} = m_1V_{1f}+m_2V_{2f}$$

$$m_1(V_{1i}-V_{1f}) = m_2(V_{2f}-V_{2i})\quad-(1)$$

$$V_{1f} = \frac{m_1V_{1i}+m_2(V_{2i}-V_{2f})}{m_1}\quad-(2)$$

$$V_{2f} = \frac{m_2V_{2i}+m_1(V_{1i}-V_{1f})}{m_2}\quad-(3)$$

$$\frac{1}{2}m_1V_{1i}^2+\frac{1}{2}m_2V_{2i}^2 = \frac{1}{2}m_1V_{1f}^2+\frac{1}{2}m_2V_{2f}^2$$

$$m_1V_{1i}^2+m_2V_{2i}^2 = m_1V_{1f}^2+m_2V_{2f}^2$$

$$m_1(V_{1i}^2-V_{1f}^2) = m_2(V_{2f}^2-V_{2i}^2)$$

$$(1)\Longrightarrow m_1(V_{1i}-V_{1f})(V_{1i}+V_{1f}) = m_2(V_{2i}-V_{2f})(V_{2i}+V_{2f})$$

$$V_{1i}+V_{1f} = V_{2i}+V_{2f}\quad-(4)$$

linear equation in two variables
$$(4)\Longrightarrow(2),(3)$$

## 2D collisionc (Elastic)
$$P_{1i}+P_{2i} = P_{1f}+P_{2f}$$

$$K_{1i}+K_{2i} = K_{1f}+K_{2f}$$

$$V_x^2+V_y^2 = V^2$$

* X direction
$$P_{xi} = P_{xf}$$

$$P_{1xi}+P_{2xi} = P_{1xf}+P_{2xf}$$

$$m_1V_{1xi}+m_2V_{2xi} = m_1V_{1xf}+m_2V_{2xf}$$

$$m_1(V_{1xi}-V_{1xf}) = m_2(V_{2xi}-V_{2xf})$$

* Y direction
$$P_{yi} = P_{yf}$$

$$P_{1yi}+P_{2yi} = P_{1yf}+P_{2yf}$$

$$m_1V_{1yi}+m_2V_{2yi} = m_1V_{1yf}+m_2V_{2yf}$$

$$m_1(V_{1yi}-V_{1yf}) = m_2(V_{2yi}-V_{2yf})$$

* if $V_2i = 0$ , $m_1 = m_2$ and $V_{1yi} = 0$
$$V_{1yf} = -V_{2yf}\quad-(1)$$

$$V_{1xi}-V_{1xf} = -V_{2xf}\quad-(2)$$

$$\frac{1}{2}m_1V_{1i}^2 = \frac{1}{2}m_1V_{1f}^2+\frac{1}{2}m_2V_{2f}^2$$

$$m_1V_{1i}^2 = m_1V_{1f}^2+m_2V_{2f}^2$$

$$V_{1xi}^2-V_{1f}^2 = V_{2f}^2\quad-(3)$$

$$(1),(2)\Longrightarrow(3)$$

$$V_{1xi}^2-V_{1yf}^2-V_{1xf}^2 =V_{1yf}^2+(V_{1xi}-V_{1xf})^2$$

$$V_{1xi}^2-V_{1yf}^2-V_{1xf}^2 =V_{1yf}^2+V_{1xi}^2+V_{1xf}^2-2V_{1xf}V_{1xi}$$

$$0=2(V_{1yf}^2+V_{1xf}^2-V_{1xf}V_{1xi})$$

$$V_{1xf}V_{1xi} = V_{1yf}^2+V_{1xf}^2 = V_{1f}^2$$

## Variable mass system
* rocket formula 1
$V_e =$ Exhaust gas speed
$R =m/t$ fuel loss rate (loss mass)
$$F = ma$$

$$RV_e = ma$$

* rocket formula 2
$$\Delta V = V_eln\frac{m_i}{m_f}$$

$$P = mv = V_edm$$

$$\Delta V = \int_{m_i}^{m_f}\frac{V_e}{-m}dm = V_e\int_{m_i}^{m_f}\frac{-1}{m}dm $$

$$= V_e(ln(m_i)-ln(m_f)) = V_eln\frac{m_i}{m_f}$$

* graph (speed vs time)
![rocket](https://hackmd.io/_uploads/ByuVVFXX1g.png)

