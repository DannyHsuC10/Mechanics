# Equivalent system of force

## Exteral and internal forces

1. exteral forces : represent the action of other bodies on the rigid body.
2. internal forces : the force which hold together the particles forming the rigid body.

## Vector product of twe vector

$$V = P\times Q$$

1. $V\perp P, V\perp Q$
2. $|V| = |P||Q|sin(\theta)$
3. $P\times Q = -Q\times P$
4. $P\times(Q_1+Q_2) = P\times Q_1+P\times Q_2$
5. $P\times (Q\times S) \not= (P\times Q)\times S$

## Vector products expressed in terms of xyz component

$$\vec x\times \vec x = 0$$

$$\vec x\times \vec y = \vec z$$

$$\vec x\times \vec z = -\vec y$$

$$V = P\times Q = (P_x\vec x+P_y\vec y+P_z\vec z)\times(Q_x\vec x+Q_y\vec y+Q_z\vec z)$$

$$V_x\vec x+V_y\vec y+V_z\vec z = (P_yQ_z-P_zQ_y)\vec x+(P_zQ_x-P_xQ_z)\vec y+(P_xQ_y-P_yQ_x)\vec z$$

$$V = P\times Q = \begin{vmatrix}
\vec x &\vec y&\vec z\\
P_x&P_y&P_z\\
Q_x&Q_y&Q_z
\end{vmatrix}$$

## Moment of a force about a point

$$M = r\times F$$

$$M = rFjsin(\theta) = Fd$$

## varignon's theorem

$$F_{tt} = F_1+F_2+F_3...F_n$$

$$M_{tt} = r_1\times F_1+r_2\times F_2+r_3\times F_3+...r_n\times F_n$$

## xyz components of the moment of a force

$$r = x\vec x+y\vec y+z\vec z$$

$$F = F_x\vec x+F_y\vec y+F_z\vec z$$

$$M = r\times F =
\begin{vmatrix}
\vec x &\vec y&\vec z\\
x&y&z\\
F_x&F_y&F_z
\end{vmatrix}$$

$$M = M_x+M_y+M_z$$

$$M_x = yF_z-zF_y$$

$$M_y = zF_x-xF_z$$

$$M_z = xF_y-yF_x$$
## Scalar product fo twe vector(dot product)

$$P\cdot Q = PQcos(\theta)$$

1. $P\cdot Q = Q\cdot P$
2. $P\cdot(Q_1+Q_2) = P\cdot Q_1+P\cdot Q_2$
3. $(P\cdot Q)\cdot S = P\cdot(Q\cdot S)$
## Scalar products expressed in terms of xyz component
$$\vec x\cdot\vec x = 1$$

$$\vec y\cdot\vec y = 1$$

$$\vec z\cdot\vec z = 1$$

$$\vec x\cdot\vec y = \vec y\cdot\vec x = \vec y\cdot\vec z = \vec z\cdot\vec y = \vec z\cdot\vec x = \vec x\cdot\vec z = 0$$

$$P\cdot Q = (P_x\cdot \vec x+P_y\cdot \vec y+P_z\cdot \vec z)\cdot(Q_x\cdot \vec x+Q_y\cdot \vec y+Q_z\cdot \vec z)$$

$$= P_xQ_x+P_yQ_y+P_zQ_z$$

$$P\cdot P = P_x^2+P_y^2+P_z^2 = P^2$$

$$cos(\theta) = \frac{P_xQ_x+P_yQ_y+P_zQ_z}{PQ}$$
where $P = \sqrt{P_x^2+P_y^2+P_z^2}$ , $Q = \sqrt{Q_x^2+Q_y^2+Q_z^2}$

* projection
$$P_Q = \frac{P\cdot Q}{Q}  = \frac{P_xQ_x+P_yQ_y+P_zQ_z}{Q}$$
## mixed triple product of three vector
* scalar : $S\cdot(P\times Q)$
* vector : $S\cdot(P\times Q)$
* volume : $U = S\cdot(P\times Q) = S\cdot V$

***

$$S\cdot(P\times Q) = P\cdot(Q\times S) = Q\cdot(S\times P)$$

$$=-S\cdot(Q\times P) = -Q\cdot(P\times S) = -P\cdot(S\times Q)$$
![vector](https://hackmd.io/_uploads/Sy0EWfjFJl.png)

$$S\cdot(P\times Q) = S\cdot V =S_x\cdot V_x+S_y\cdot V_y+S_z\cdot V_z$$

$$= S_x(P_yQ_z-P_zQ_y)+S_y(P_zQ_x-P_xQ_z)+S_z(P_xQ_y-P_yQ_x)$$

$$S\cdot(P\times Q) = \begin{vmatrix}
S_x &S_y&S_z\\
P_x&P_y&P_z\\
Q_x&Q_y&Q_z
\end{vmatrix}$$
## Moment of a force about a given axis
$$M = r\times F$$

$$M_\lambda = \lambda\cdot M = \lambda\cdot (r\times F)$$

$$= \begin{vmatrix}
\lambda_x &\lambda_y&\lambda_z\\
x&y&z\\
F_x&F_y&F_z
\end{vmatrix}$$
## Moment of a couple
$$M = r_A\times F+r_B\times(-F)$$

$$=(r_A-r_B)\times F = r\times F$$

$$M = rFsin(\theta) = Fd$$
## Couples may be represented by vector
![couples](https://hackmd.io/_uploads/B1tbOGotyx.png)
## Equipollent system
![Equipollent system](https://hackmd.io/_uploads/BJRrMQoYyg.png)
if the force y axis, then the moment about y axis is zero.
$$M = r\times F$$

$$r = 0,\ M = 0$$
