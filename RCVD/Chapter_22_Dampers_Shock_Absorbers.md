---
layout: base
---

# Chapter 22: Dampers (Shock Absorbers) (減震器阻尼特性與車高平台控制)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=812)，書頁 781–832（PDF 第 812–863 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 避震器是速度與歷史相關的元件（pp. 781–786）

本章從線性彈簧—質量—阻尼模型，再討論車身、輪跳、路面保持性、避震器試驗以及高下壓力賽車。線性阻尼只是起點；真實力還受到壓縮／回彈方向、閥系、油溫、氣壓與遲滯影響。

定義相對速度 $v_d$ 正值為指定的壓縮方向，作用於該正向自由度的阻尼力要反抗運動。若資料圖把壓縮阻力大小畫成正值，須在運動方程中另外處理號誌。

## 2. 基本 SMD 方程與阻尼比（pp. 787–789）

$$
m\ddot x+c\dot x+kx=F(t),
\qquad \omega_n=\sqrt{\frac km},
\qquad f_n=\frac{\omega_n}{2\pi},
$$

$$
c_{\mathrm{crit}}=2\sqrt{km},
\qquad \zeta=\frac c{c_{\mathrm{crit}}},
\qquad c=2\zeta\sqrt{km}.
$$

原書以不同阻尼比畫出階躍時間歷程。$0<\zeta<1$ 有衰減振盪，$\zeta=1$ 為臨界阻尼，$\zeta>1$ 為過阻尼；更大阻尼並非任何工況都更快，過阻尼的慢特徵根可能使回復拖長。

$$
\lambda_{1,2}=-\zeta\omega_n\pm\omega_n\sqrt{\zeta^2-1}.
$$

這是基本方程的特徵根整理，不是單一最佳避震器設定。

## 3. 四分之一車兩質量模型（pp. 790–798）

原書圖中的簧上質量 $m_s$、簧下質量 $m_u$、輪端懸吊率 $k_s$、輪胎率 $k_t$、等效輪端阻尼 $c$，對應方程可整理為：

$$
m_s\ddot z_s+c(\dot z_s-\dot z_u)+k_s(z_s-z_u)=0,
$$

$$
m_u\ddot z_u+c(\dot z_u-\dot z_s)+k_s(z_u-z_s)+k_t(z_u-z_r)=0.
$$

$z_r$ 為路面輸入；位移從靜平衡起算，因此不再加入一份 $mg$。無阻尼自由振動的矩陣式：

$$
\boldsymbol M=\begin{bmatrix}m_s&0\\0&m_u\end{bmatrix},
\qquad
\boldsymbol K=\begin{bmatrix}k_s&-k_s\\-k_s&k_s+k_t\end{bmatrix},
$$

$$
\det(\boldsymbol K-\omega^2\boldsymbol M)=0,
$$

$$
m_sm_u\omega^4-
[k_sm_u+m_s(k_s+k_t)]\omega^2+k_sk_t=0.
$$

這是原書圖示模型的完整特徵方程。固定另一質量時才可用近似：

$$
\omega_s\simeq\sqrt{\frac{k_s}{m_s}},
\qquad \omega_u\simeq\sqrt{\frac{k_s+k_t}{m_u}}.
$$

單一 $c$ 對兩個模態的效果不同，所以不能用車身阻尼比代表輪胎接地的所有動態。

## 4. 基座激振傳遞率（對原書圖的數學整理）

若忽略簧下質量，路面位移 $y$ 作基座輸入：

$$
m\ddot x+c(\dot x-\dot y)+k(x-y)=0,
\qquad
\frac{X(s)}{Y(s)}=\frac{cs+k}{ms^2+cs+k}.
$$

令頻率比 $r_\omega=\omega/\omega_n$：

$$
\left|\frac XY\right|
=\sqrt{\frac{1+(2\zeta r_\omega)^2}
{(1-r_\omega^2)^2+(2\zeta r_\omega)^2}}.
$$

這說明阻尼可壓低共振附近的響應，但高頻時較大的阻尼會把更多速度輸入傳到車身。原書的兩質量曲線還包括輪跳峰，不能只用此一自由度傳遞率替代全部圖。

## 5. 阻尼速度造成的車身加速度（pp. 798–800、806–810）

原書從 $F=cV_d$ 與 $c=2\zeta\sqrt{km}$ 推得：

$$
a_d=\frac{cV_d}{m}=2\zeta\omega_nV_d
=4\pi\zeta f_nV_d,
$$

$$
A_d=\frac{a_d}{g}=\frac{4\pi\zeta f_nV_d}{g}.
$$

這里 $f_n$ 是 Hz，不能把 rad/s 的 $\omega_n$ 再放入 $4\pi$ 式。原書示例 $\zeta=0.25$、速度用 in/s、$g=386.4\ \mathrm{in/s^2}$，得到：

$$
A_d\simeq0.00813\,f_n[\mathrm{Hz}]V_d[\mathrm{in/s}].
$$

$f_n=1.2$ Hz、$V_d=20$ in/s 時約 $0.195g$。這是阻尼力貢獻，並非把整車所有彈簧、輪胎與重力效應加總後的完整車身加速度。

## 6. 避震器台架、正弦運動與耗能（pp. 801–805）

原書用正弦台架運動說明不同速度點；若 $x=A\sin(2\pi ft)$：

$$
v=2\pi fA\cos(2\pi ft),
\qquad v_{\max}=2\pi fA.
$$

因此最大速度發生在位移過零處，不是在最大行程處。氣壓預載可造成力軸零點偏移，台架曲線必須區分彈簧／氣壓力與阻尼力。

**耗能整理推導：** 對線性黏性阻尼，單週期耗能為：

$$
E_{\mathrm{cycle}}=\int_0^{1/f}cv^2dt
=\pi c\omega A^2,
\qquad \overline P=\frac12c\omega^2A^2.
$$

力—位移迴圈面積代表每週期耗能；力—速度迴圈面積則不是同一個能量量綱。溫度升高會改變量測曲線，所以調整前後的台架比較應有相同溫度與速度範圍。

## 7. 非線性、壓縮／回彈與安裝比（計算補充）

可用兩方向不同斜率描述最簡單的非對稱阻尼：

$$
F_d(v_d)=
\begin{cases}
-c_bv_d,&v_d\ge0,\\
-c_rv_d,&v_d<0.
\end{cases}
$$

若用次方曲線擬合，正確保留反向阻力的形式為：

$$
F_d=-c|v_d|^{n-1}v_d.
$$

這些是擬合模型，不是原書給定的普遍閥系公式。直接寫 $cv^n$ 在負速度、非整數 $n$ 時會產生非實數，也可能失去阻力方向。

避震器安裝比 $IR_d=dx_d/dz_w$，由虛功得到：

$$
v_d=IR_dv_w,
\qquad F_w=IR_dF_d,
\qquad c_w\simeq c_dIR_d^2.
$$

使用實際機構速度比時已含傾角；不可再重複乘傾角係數。非線性阻尼最好直接代入速度與力轉換，而不是把整條曲線都乘一個固定「阻尼比」。

## 8. 接地性與負載波動（pp. 810–817）

原書的 load fluctuation rate 以輪胎動態負載的 RMS 除以靜態負載：

$$
R=\frac{k_t\,\mathrm{RMS}(z_r-z_u)}{(m_s+m_u)g}
=\frac{\mathrm{RMS}(\Delta Z)}{Z_0}.
$$

若需要百分比，最後乘 100。圖 22.31 的 tire-ground contact rate 是接地行程占總行程的比例，可整理為：

$$
\eta_{\mathrm{contact}}=100
\frac{s_{\mathrm{total}}-\sum s_{\mathrm{airborne}}}{s_{\mathrm{total}}}.
$$

定速時也可用時間比；變速時不能把距離比與時間比直接視為一樣。平順路上的小負載波動，不代表顛簸賽道也有相同接地能力。

## 9. 高下壓力車的升沉、俯仰與側傾（pp. 820–829）

原書討論用較高阻尼控制空力平台，某些模態可能大於臨界阻尼。**小角度對稱車輛的模態整理：** 每角輪端率與阻尼為 $k_i,c_i$，角的位置 $x_i,y_i$：

$$
K_{zz}=\sum k_i,\quad C_{zz}=\sum c_i,
\quad K_{\theta\theta}=\sum k_ix_i^2,\quad C_{\theta\theta}=\sum c_ix_i^2,
$$

$$
K_{\phi\phi}=\sum k_iy_i^2+K_{\mathrm{ARB}},
\qquad C_{\phi\phi}=\sum c_iy_i^2.
$$

若耦合可忽略，俯仰／側傾阻尼比為：

$$
\zeta_\theta=\frac{C_{\theta\theta}}{2\sqrt{I_yK_{\theta\theta}}},
\qquad
\zeta_\phi=\frac{C_{\phi\phi}}{2\sqrt{I_xK_{\phi\phi}}}.
$$

實際前後不對稱會產生升沉—俯仰耦合，壓縮／回彈不對稱也不能只用一個常數矩陣。若下壓力隨壓縮位移 $z$ 增加，局部靜態有效升沉剛度的**整理推導**為：

$$
K_{\mathrm{eff}}=K_{\mathrm{mechanical}}-\frac{dD_f}{dz}.
$$

這只是在指定符號下的局部斜率，須以真實空力圖譜評估；更高阻尼不能修復負的靜態有效剛度。原書章末的經驗及文獻討論不是一組可通用複製的避震器設定。
