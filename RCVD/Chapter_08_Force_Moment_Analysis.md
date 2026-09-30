---
layout: base
---

# Chapter 8: Force - Moment Analysis (力與力矩圖形分析法)

> 來源：RCVD 原書 PDF，書頁 293–344（PDF 第 324–375 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. Moment Method 的核心（pp. 293–301）

極限操控不能只用一個轉向不足係數描述。Moment Method 逐一指定車身側滑角、轉向角、速度及驅動／制動條件，求輪胎負載與四輪力，再畫出總側力和偏航力矩。圖上的零偏航力矩線就是可持續的穩態轉彎平衡。

本章使用 $W=mg$、軸距 $\ell$、重心偏航慣量 $I_z$，正側向與偏航方向依 Chapter 4。

## 2. 力、力矩及正規化（pp. 295、301–309）

$$
Y=ma_y,\qquad N=I_z\dot r,
\qquad C_Y=\frac YW,\qquad C_N=\frac N{W\ell}.
$$

若所有側力都用來提供路徑向心加速度：

$$
C_Y=A_y=\frac{V^2}{gR},
\qquad \dot r=\frac{W\ell}{I_z}C_N.
$$

所以 $C_N$–$A_y$ 圖同時表示「可用偏航角加速度」與「側向加速度」。$C_N=0$ 不代表車輛沒有在轉，而是 $r$ 不再加速；穩態仍可有非零 $r=V/R$。

## 3. 從四輪資料形成全車結果

原書的輪胎幾何延用 Chapter 5；四輪計算可用以下等價整理式：

$$
\alpha_i=\operatorname{atan2}(v+rx_i,u-ry_i)-\delta_i,
$$

$$
F_{xi}^{b}=F_{xi}^{t}\cos\delta_i-F_{yi}^{t}\sin\delta_i,
\qquad
F_{yi}^{b}=F_{xi}^{t}\sin\delta_i+F_{yi}^{t}\cos\delta_i,
$$

$$
X=\sum_iF_{xi}^{b}+X_{\mathrm{aero}}+X_{\mathrm{other}},
\qquad Y=\sum_iF_{yi}^{b}+Y_{\mathrm{aero}}+Y_{\mathrm{other}},
$$

$$
N=\sum_i(x_iF_{yi}^{b}-y_iF_{xi}^{b}+M_{zi}^{b})+N_{\mathrm{aero}}.
$$

每個輪胎力是 $f(\alpha_i,\gamma_i,S_i,Z_i)$，而 $Z_i$ 又與當下加速度、空力和側傾有關，因此需要迭代到負載與合力一致。偏置差速器扭矩會透過 $-y_iF_{xi}^{b}$ 直接產生偏航力矩。

## 4. 前後軸構造線與合成圖（pp. 302–307）

忽略輪距力矩與輪胎 $M_z$，用前後軸側力 $Y_F,Y_R$ 示範：

$$
C_Y=\frac{Y_F+Y_R}{W},
\qquad C_N=\frac{aY_F-bY_R}{W\ell}.
$$

只有前軸有力時、只有後軸有力時，構造線分別為：

$$
C_{NF}=\frac a\ell C_{YF},
\qquad C_{NR}=-\frac b\ell C_{YR}.
$$

因此構造線斜率由重心位置决定。將兩軸貢獻向量相加得到圖上節點；每個節點再由下式換成 $\beta,\delta$ 標籤：

$$
\alpha_F=\beta+\frac aR-\delta,
\qquad \alpha_R=\beta-\frac bR.
$$

這是小角度形式。若有較大轉向與偏航，應回到逐輪精確幾何。

## 5. Trim、極限行為與局部斜率（pp. 307–318）

可持續穩態轉彎須同時滿足：

$$
Y-\frac{mV^2}{R}=0,\qquad N=0.
$$

原書圖解的最大 trimmed lateral acceleration 是零力矩線上仍可滿足輪胎能力的最大 $A_y$：

$$
A_{y,\max}^{\mathrm{trim}}
=\max_{\beta,\delta}\left\{\frac YW:\ N=0,\ \text{各輪力可實現}\right\}.
$$

未平衡的最大 $Y/W$ 往往更高，但具有非零 $N$，不能把它當成穩態過彎能力。前軸先飽和通常形成極限推頭，後軸先飽和通常形成極限甩尾；它們與小角度線性 understeer/oversteer 不必一致。

局部線性化用於讀取控制與穩定性：

$$
\Delta C_N\simeq C_{N\beta}\Delta\beta+C_{N\delta}\Delta\delta,
\qquad
\Delta C_Y\simeq C_{Y\beta}\Delta\beta+C_{Y\delta}\Delta\delta.
$$

原書 p. 308 的 stability index 是通過 trim 的固定轉向角線之斜率；在相同求解約束下可寫為：

$$
SI=\left.\frac{\partial C_N}{\partial A_y}\right|_\delta
=\frac{C_{N\beta}}{C_{Y\beta}}.
$$

這裡 $A_y=C_Y$；若換成固定半徑或施加外側力的另一種圖，必須重新交代控制變量。不可把固定 $\beta$ 的線誤當成固定 $\delta$ 的穩定性線。以本章正 $C_N$ 與正右轉慣例，恢復型斜率通常為負。

沿 trim 線 $dC_N=0$ 的轉向／側滑關係為整理推導：

$$
\left.\frac{d\delta}{d\beta}\right|_{C_N=0}
=-\frac{C_{N\beta}}{C_{N\delta}},
$$

$$
\left.\frac{dC_Y}{d\delta}\right|_{C_N=0}
=C_{Y\delta}-C_{Y\beta}\frac{C_{N\delta}}{C_{N\beta}}.
$$

這些比值要求分母不為零；輪胎飽和後局部斜率可能接近零，應直接在非線性圖上求解。

## 6. 制動、驅動與路負載條件（pp. 310–339）

零縱向加速度不等於零驅動扭矩。Road load 要求輪胎驅動力抵銷阻力：

$$
X=0\quad\Longrightarrow\quad
\sum_iF_{xi}^{b}=D_{\mathrm{aero}}+D_{\mathrm{roll}}+D_{\mathrm{slip}}.
$$

如果指定加速或煞車，則 $X=m a_x$，前後負載也隨之改變。原書的調校比較用相同速度與外部約束，比較輪胎是否先飽和、trim 移動及偏航力矩餘裕。只比較一個「峰值 $g$」會失去方向控制資訊。

## 7. 圈速分析（pp. 340–344）

原書首先將賽道分成直線與定半徑彎：

$$
V_{\mathrm{corner}}=\sqrt{A_{y,\max}Rg},
\qquad t_{\mathrm{corner}}=\frac{R\Delta\psi}{V_{\mathrm{corner}}}.
$$

**計算實作的整理推導：** 當能力隨速度改變，應解 $V^2/R=gA_{y,\max}(V)$。直線運動可用：

$$
V_{i+1}^2=V_i^2+2a_{x,i}\Delta s_i,
\qquad \Delta t_i\simeq\frac{2\Delta s_i}{V_i+V_{i+1}},
\qquad t_{\mathrm{lap}}\simeq\sum_i\Delta t_i.
$$

先以前向計算限制加速，再由下一彎入口速度反向計算制動；彎中還要受組合滑移邊界限制。這是原書圈速方法的離散化示意，並不聲稱重現其完整 MRA 軟體。

## 8. 代入例

**自行示例：** $W=10{,}000\ \mathrm N$、$\ell=2.5\ \mathrm m$、$I_z=1{,}200\ \mathrm{kg\,m^2}$，某節點 $C_N=0.02$，則 $N=500\ \mathrm{N\,m}$、$\dot r=0.417\ \mathrm{rad/s^2}$。即使該點側向力很大，它仍不是可持續的穩態 trim 點。
