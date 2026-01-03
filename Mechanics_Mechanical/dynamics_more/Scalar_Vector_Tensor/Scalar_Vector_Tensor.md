# Scalar, Vector, Tensor

## inner product

$$n_x = n\cdot\cos\theta_x\cdot\vec x$$

$$n_y = n\cdot\cos\theta_y\cdot\vec y$$

$$n_z = n\cdot\cos\theta_z\cdot\vec z$$

$n$ can be "$v$" , "$a$" , "$f$" , "$p$" , "$J$" , "$K$" , "$\omega$"...

* Velocity : $v$
* Acceleration : $a$
* Force : $F$
* Momentum : $p$
* Impulse : $J$
* Angular velocity : $\omega$

## outer product

$$
(c_x,c_y,c_z) =
\begin{vmatrix}
\vec x & \vec y & \vec z\\
a_x & a_y & a_z\\
b_x & b_y & b_z\\
\end{vmatrix}
$$

$a,b,c$ can be "$v$" , "$a$" , "$f$" , "$p$" , "$J$" , "$K$" , "$\omega$"...

* Velocity : $v$
* Acceleration : $a$
* Force : $F$
* Momentum : $p$
* Impulse : $J$
* Angular velocity : $\omega$

## Tensor

$$
(A) =
\begin{bmatrix}
A_x & -A_{xy} & -A_{xz} \\
-A_{xy} & A_y & -A_{yz} \\
-A_{xz} & -A_{yz} & A_z \\
\end{bmatrix}
$$

$A$ can be "$I$","$\delta$","$\sigma$"...

* Inertia Tensor : $I$
* Strain Tensor : $\delta$
* Stress Tensor : $\sigma$
