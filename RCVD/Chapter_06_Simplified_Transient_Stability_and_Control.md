---
layout: base
---

# Chapter 6: Simplified Transient Stability and Control (簡化瞬態穩定性與控制)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=262)，書頁 231–278（PDF 第 262–309 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 瞬態問題與模型範圍（pp. 231–233）

穩態公式只描述轉彎完成後的平衡；本章計算轉向輸入後，側滑角與偏航率如何隨時間建立。沿用 Chapter 5 的 $C_F,C_R<0$、六導數及固定前進速度 $V>0$。

## 2. 彈簧—質量—阻尼系統（pp. 233–241）

$$
m\ddot x+c\dot x+kx=F(t),
\qquad x_{\mathrm{static}}=\frac{F_0}{k},
$$

$$
\omega_n=\sqrt{\frac km},
\qquad f_n=\frac{\omega_n}{2\pi},
\qquad \zeta=\frac{c}{2\sqrt{km}},
$$

$$
c_{\mathrm{crit}}=2\sqrt{km},
\qquad c=2\zeta\sqrt{km},
\qquad \omega_d=\omega_n\sqrt{1-\zeta^2}\quad(0\le\zeta<1).
$$

$\omega_n$ 是 rad/s，$f_n$ 是 Hz。若以重量代入，必須先用 $m=W/g$；英制的 in 與 ft 要同時換算。靜態重力壓縮量設為零點後，重力不再作為額外常值激振重複加入。

對轉動系統，對應為：

$$
I\ddot\theta+c_\theta\dot\theta+k_\theta\theta=M(t),
\qquad \omega_n=\sqrt{\frac{k_\theta}{I}},
\qquad \zeta=\frac{c_\theta}{2\sqrt{Ik_\theta}}.
$$

## 3. 輪胎柔度與四分之一車近似（pp. 239–240）

若輪心懸吊剛度 $k_w$ 與輪胎垂直剛度 $k_t$ 串聯，量到的 ride rate 為：

$$
k_r=\frac{k_wk_t}{k_w+k_t},
\qquad k_w=\frac{k_rk_t}{k_t-k_r}\quad(k_t>k_r).
$$

原書為了說明模態採取固定另一質量的近似：

$$
\omega_s\simeq\sqrt{\frac{k_w}{m_s}}
\quad\text{（輪心固定）},
\qquad
\omega_u\simeq\sqrt{\frac{k_w+k_t}{m_u}}
\quad\text{（車身固定）}.
$$

$$
\zeta_s\simeq\frac c{2\sqrt{k_wm_s}},
\qquad \zeta_u\simeq\frac c{2\sqrt{(k_w+k_t)m_u}}.
$$

這不是耦合兩質量系統的精確特徵頻率；Chapter 22 以完整矩陣再說明。相同避震器可能使車身模態與輪跳模態具有很不同的阻尼比。

## 4. 車輛兩自由度狀態方程（pp. 241–245）

由原書運動方程整理成可直接數值積分的形式：

$$
\frac{d}{dt}\begin{bmatrix}\beta\\r\end{bmatrix}
=\underbrace{\begin{bmatrix}
Y_\beta/(mV)&Y_r/(mV)-1\\
N_\beta/I_z&N_r/I_z
\end{bmatrix}}_{\boldsymbol A}
\begin{bmatrix}\beta\\r\end{bmatrix}
+\underbrace{\begin{bmatrix}Y_\delta/(mV)\\N_\delta/I_z\end{bmatrix}}_{\boldsymbol B}\delta.
$$

以正剛度代入時，矩陣第一列第二項為 $(-aC_{\alpha F}+bC_{\alpha R})/(mV^2)-1$；其中的 $-1$ 來自旋轉座標項，不能省略。

特徵式為：

$$
\det(s\boldsymbol I-\boldsymbol A)
=s^2+2\zeta\omega_ns+\omega_n^2,
$$

$$
\omega_n^2=\frac{N_\beta}{I_z}
+\frac{Y_\beta N_r-Y_rN_\beta}{mVI_z},
\qquad
2\zeta\omega_n=-\frac{N_r}{I_z}-\frac{Y_\beta}{mV}.
$$

原書的等效扭轉剛度與阻尼為：

$$
K_T=N_\beta+\frac{Y_\beta N_r-Y_rN_\beta}{mV},
\qquad C_T=-\left(N_r+\frac{I_zY_\beta}{mV}\right).
$$

這些是車輛耦合動態的等效係數，不是真正裝了一支扭力桿。

## 5. 物理參數、速度與穩定性（pp. 242–245）

令偏航迴轉半徑 $k_z=\sqrt{I_z/m}$，利用 Chapter 5 的穩定因子 $K$：

$$
\omega_n^2=
\frac{C_{\alpha F}C_{\alpha R}\ell^2}{mI_zV^2}(1+KV^2)
=\frac{C_{\alpha F}C_{\alpha R}\ell^2}{m^2k_z^2V^2}(1+KV^2),
$$

$$
2\zeta\omega_n=
\frac{a^2C_{\alpha F}+b^2C_{\alpha R}}{I_zV}
+\frac{C_{\alpha F}+C_{\alpha R}}{mV}.
$$

穩定的二階線性系統需要特徵式一次與常數項都為正。對本模型，負剛度式的阻尼項正常為正；轉向過度車在 $1+KV^2=0$ 時出現零特徵根，再提高速度會有正實部根。中性轉向的 $\omega_n$ 隨 $1/V$ 下降，不表示中性車沒有輪胎阻尼。

## 6. 單自由度極限情形（pp. 245–249）

若限制 $r=0$，施加階躍側力 $F_0$：

$$
m\dot v-\frac{Y_\beta}{V}v=F_0,
\qquad \tau_v=-\frac{mV}{Y_\beta}>0,
$$

$$
\frac{v(t)}{F_0}=-\frac{V}{Y_\beta}
\left(1-e^{-t/\tau_v}\right).
$$

在 $t=\tau_v$ 時達到最終值的 $1-e^{-1}\approx63.2\%$；一階系統的 90% 時間為 $t_{90}=\tau_v\ln10$。

若限制側向運動，只允許車身航向角 $\psi$ 改變，原書 $N_\psi=-N_\beta$：

$$
I_z\ddot\psi-N_r\dot\psi-N_\psi\psi=N_\delta\delta,
\qquad \omega_{n,\psi}^2=-\frac{N_\psi}{I_z},
\qquad 2\zeta_\psi\omega_{n,\psi}=-\frac{N_r}{I_z}.
$$

這種受約束模型的穩定判準與自由行駛的兩自由度模型不同，不能互相替代。

## 7. 階躍轉向響應的零點（pp. 250–259）

除了共同的二階分母，偏航率與側滑角還各自有分子零點。原書 p. 251 定義：

$$
\tau_r=\frac{mVN_\delta}{Y_\delta N_\beta-Y_\beta N_\delta},
\qquad
\tau_\beta=\frac{-I_zY_\delta}
{mVN_\delta-Y_rN_\delta+Y_\delta N_r}.
$$

在零初始狀態、輸出穩態增益非零時，$y=r$ 或 $\beta$ 的正規化傳遞函數可寫為：

$$
H_y(s)=\frac{(1+\tau_y s)\omega_n^2}
{s^2+2\zeta\omega_ns+\omega_n^2}.
$$

**整理推導：** 對單位階躍且 $0\le\zeta<1$，時間解為：

$$
\frac{y(t)}{y_\infty}
=1-e^{-\zeta\omega_nt}
\left[\cos(\omega_dt)+
\frac{\zeta-\omega_n\tau_y}{\sqrt{1-\zeta^2}}\sin(\omega_dt)\right].
$$

因此不能直接用沒有零點的標準二階超越量公式預測所有偏航或側滑響應。在 $\beta_\infty=0$ 的切線速度附近，也不能再除以 $\beta_\infty$ 正規化；應直接積分狀態方程。

對臨界阻尼，連續極限為：

$$
\frac{y(t)}{y_\infty}=1-e^{-\omega_nt}
\left[1+(1-\omega_n\tau_y)\omega_nt\right].
$$

過阻尼或一般情況可用特徵根 $\lambda_{1,2}=-\zeta\omega_n\pm\omega_n\sqrt{\zeta^2-1}$ 計算；矩陣形式的階躍解為：

$$
\boldsymbol x(t)=\boldsymbol x_\infty+
e^{\boldsymbol At}(\boldsymbol x_0-\boldsymbol x_\infty),
\qquad \boldsymbol x_\infty=-\boldsymbol A^{-1}\boldsymbol B\delta_0.
$$

此式要求 $\boldsymbol A$ 可逆；臨界速度應直接使用積分解。

## 8. 響應指標與試驗用途（pp. 249–278）

$$
y(t_{90})=0.9y_\infty\quad\text{（首次通過）},
\qquad \dot y(t_p)=0,
\qquad OS=100\frac{y_{\mathrm{peak}}-y_\infty}{y_\infty}.
$$

超越量用於適當正規化的正向輸出；輸出負號或最終值為零時須另定義幅值。原書的圖表以 $\zeta$、$\omega_n$ 和 $\omega_n\tau$ 決定時間、峰值及超越量，不只依阻尼比。

計算順序是：輸入質量、慣量、幾何及軸剛度 → 每個速度重算六導數 → 求特徵根 → 計算實際轉向輸入的時間響應 → 與試驗比較。章末更高階模型加入側傾、輪胎動態等效應，不能以本章兩自由度式保證所有實車瞬態細節。
