---
layout: base
---

# Chapter 4: Vehicle Axis Systems (車輛座標系統與動態自由度)

> 來源：RCVD 原書 PDF，書頁 113–122（PDF 第 144–153 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 先決定軸系，再決定公式正負（pp. 113–122）

本章重點是統一車輛運動、輪胎與空力資料的座標。車身座標採右手系：$x$ 向前、$y$ 向右、$z$ 向下；繞三軸的角速度依序為 $p,q,r$。正 $r$ 是車頭向右轉，正 $q$ 是抬頭，正 $p$ 是右側下沉。

| 量 | 符號 | SI 單位 |
| --- | --- | --- |
| 縱向、側向、垂直速度 | $u,v,w$ | m/s |
| 側傾、俯仰、偏航角速度 | $p,q,r$ | rad/s |
| 側傾、俯仰、航向角 | $\phi,\theta,\psi$ | rad |
| 車身側滑角 | $\beta$ | rad |
| 前後軸至重心距離 | $a,b$ | m |
| 軸距 | $\ell=a+b$ | m |

注意：正垂直負載大小 $Z$ 不等於接地反力的 $F_z$。地面向上支撐車輛，在本軸系是負 $F_z$；重量 $mg$ 則沿正 $z$。

## 2. 速度、側滑角與路徑方向

平面運動的幾何關係可整理為：

$$
V=\sqrt{u^2+v^2},
\qquad \beta=\operatorname{atan2}(v,u),
\qquad u=V\cos\beta,\quad v=V\sin\beta.
$$

$$
\chi=\psi+\beta,\qquad \dot\chi=r+\dot\beta.
$$

$\chi$ 是地面速度方向，$\psi$ 是車頭朝向，兩者在側滑時不同。小角度與向前行駛時，$\beta\simeq v/u$；只有在定義 $V$ 為總速率時，才可以用 $\arcsin(v/V)$ 的相應分支。

**整理推導：** 車身平面速度轉到固定地面座標：

$$
\begin{bmatrix}\dot X\\\dot Y\end{bmatrix}
=\begin{bmatrix}\cos\psi&-\sin\psi\\\sin\psi&\cos\psi\end{bmatrix}
\begin{bmatrix}u\\v\end{bmatrix}.
$$

若另一軟體採 $y$ 向左、$z$ 向上，需同時轉換 $v,r,\beta,\delta,F_y$ 等有號量，不能只將繪圖的橫軸鏡射。

## 3. 車上任一點的運動（原書幾何的向量整理）

輪心或感測器相對重心位置為 $\boldsymbol r_i$，則：

$$
\boldsymbol v_i=\boldsymbol v_{CG}+\boldsymbol\omega\times\boldsymbol r_i.
$$

平面偏航時：

$$
u_i=u-r y_i,\qquad v_i=v+r x_i.
$$

前輪 $x_F=a$、後輪 $x_R=-b$。定義輪胎側滑角為局部運動方向減去輪胎轉向角，得到：

$$
\alpha_i=\operatorname{atan2}(v+r x_i,u-r y_i)-\delta_i.
$$

忽略輪距且角度很小時，化為 Chapter 5 的自行車模型：

$$
\alpha_F\simeq\beta+\frac{ar}{V}-\delta,
\qquad \alpha_R\simeq\beta-\frac{br}{V}.
$$

左右輪各自計算時，$u-r y_i$ 不同，因此低速小半徑轉彎會需要 Ackermann 轉角差。

## 4. 慣性加速度與旋轉座標導數

**整理推導：** 車身座標中速度分量的時間導數，還不是完整慣性加速度；必須加入旋轉項：

$$
\boldsymbol a=\left(\frac{d\boldsymbol v}{dt}\right)_{\mathrm{body}}
+\boldsymbol\omega\times\boldsymbol v.
$$

$$
a_x=\dot u+qw-rv,\qquad
a_y=\dot v+ru-pw,\qquad
a_z=\dot w+pv-qu.
$$

在等速平面、小側滑條件下：

$$
a_y\simeq V(\dot\beta+r),
\qquad A_y=\frac{a_y}{g},\quad A_x=\frac{a_x}{g}.
$$

$A_y=1$ 表示 $1g$，而不是 $1\ \mathrm{m/s^2}$。只有穩態圓周運動且 $\dot\beta=0$ 時，才可接著使用：

$$
r=\frac VR,\qquad a_y=\frac{V^2}{R},\qquad A_y=\frac{V^2}{gR}.
$$

## 5. 力與力矩的座標轉換

輪胎局部 $x,y$ 軸隨轉角 $\delta_i$ 旋轉。忽略外傾的平面轉換為：

$$
\begin{bmatrix}F_{xi}^{b}\\F_{yi}^{b}\end{bmatrix}
=\begin{bmatrix}\cos\delta_i&-\sin\delta_i\\
\sin\delta_i&\cos\delta_i\end{bmatrix}
\begin{bmatrix}F_{xi}^{t}\\F_{yi}^{t}\end{bmatrix}.
$$

$$
N_{CG}=\sum_i\left(x_iF_{yi}^{b}-y_iF_{xi}^{b}+M_{zi}^{b}\right).
$$

此式包含左右驅動力差產生的偏航力矩，不能在全車模型中只保留 $aF_{yF}-bF_{yR}$。如果考慮外傾與轉向軸傾斜，應以完整三維旋轉矩陣轉換輪胎力矩。

## 6. 使用檢查

每次匯入數據先記錄原點、軸方向、正轉向、角度單位及力的施受體。章內這些向量式是為原書定義加入的計算工具；它們不代表本章另行建立了完整懸吊或輪胎模型。讀 Chapter 5、8、18 時，尤其要區分「力向右」和「車身向外側傾」的號誌。
