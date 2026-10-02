---
layout: base
---

# Chapter 2: Tire Behavior (輪胎行為特性)

> 來源：RCVD 原書 PDF，書頁 13–82（PDF 第 44–113 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 輪胎模型的輸入、輸出與符號

本章先建立輪胎的力學意義，再介紹量測曲線。計算需要的不只是摩擦係數，還包括垂直負載、側滑角、縱向滑移、外傾角、胎壓、溫度和速度。接地區同時有彈性剪切與局部滑動，因此大側滑角不能繼續外推小角度直線。

| 符號 | 定義與單位 |
| --- | --- |
| $Z$ | 正的輪胎垂直負載大小，N；避免與 SAE 向下為正的帶符號 $F_z$ 混淆 |
| $F_x,F_y$ | 輪胎座標中的縱、側向力，N |
| $M_x,M_y,M_z$ | 翻覆、滾動阻力與回正力矩，N m |
| $V,\Omega$ | 輪心平移速率 m/s、輪胎轉速 rad/s |
| $R_e,R_l$ | 有效滾動半徑、受載幾何半徑，m；兩者通常不同 |
| $\alpha,\gamma$ | 側滑角、外傾角，rad；使用 deg 數據時須連同斜率換算 |

## 2. 側向力、剛度與負載敏感度（pp. 15–27）

輪胎平面與運動方向夾角為 $\alpha$，其側向滑動速度為：

$$
V_{\mathrm{lat}}=V\sin\alpha.
$$

側偏剛度是指定負載、胎壓及外傾角下的局部斜率，而非固定適用到某個角度的材料常數。採 Chapter 5 的符號時，帶符號剛度 $C$ 通常為負；若使用工程上常見的正剛度 $C_\alpha$，則：

$$
C=\left.\frac{\partial F_y}{\partial\alpha}\right|_0,
\qquad C_\alpha=-C>0,
\qquad F_y\simeq C\alpha=-C_\alpha\alpha.
$$

$$
C_\alpha[\mathrm{N/rad}]
=\frac{180}{\pi}C_\alpha[\mathrm{N/deg}].
$$

側向係數與峰值係數要分開：

$$
\mu_y(\alpha,Z)=\frac{F_y(\alpha,Z)}{Z},
\qquad \mu_{y,\mathrm{peak}}(Z)=\frac{\max_\alpha|F_y(\alpha,Z)|}{Z}.
$$

典型輪胎增加負載時，峰值力上升，但每單位負載的能力下降。左右輪負載為 $Z_0\pm\Delta Z$ 時，應分別查曲線再相加，不能先平均負載再乘二：

$$
F_{y,\mathrm{pair}}(\alpha)
=F_y(\alpha,Z_0+\Delta Z)+F_y(\alpha,Z_0-\Delta Z).
$$

**整理推導：** 若在量測範圍以峰值力 $f(Z)=a_1Z+a_2Z^2$ 擬合，且 $a_2<0$，則：

$$
f(Z_0+\Delta Z)+f(Z_0-\Delta Z)
=2f(Z_0)+2a_2(\Delta Z)^2.
$$

此式直接量化負載轉移的損失，但二次式只是一種局部擬合，不是原書指定的普遍輪胎定律；不可外推到負負載或高到不合理的負載。

## 3. 回正力矩與外傾力（pp. 28–33、46–54、69–74）

側向力的合力作用點位於接地中心後方。若正 $x$ 向前、正 $y$ 向右，正氣壓拖距 $t_p$ 向後量，則由叉積得到：

$$
M_z=-t_pF_y+M_{z,0},
\qquad t_p=-\frac{M_z-M_{z,0}}{F_y}.
$$

這是明確指定座標後的力矩整理式。若輪胎資料使用相反的 $M_z$ 號誌，必須先換號。$F_y$ 接近零時，不宜用力矩除以側向力推算拖距；接近飽和時，拖距變小，所以回正力矩的峰值不必與側向力峰值重合。

外傾剛度與小擾動線性化可寫成：

$$
C_\gamma=\left.\frac{\partial F_y}{\partial\gamma}\right|_{\alpha=0},
\qquad F_y\simeq C\alpha+C_\gamma\gamma+F_{y,0}.
$$

$F_{y,0}$ 包含錐度、簾布偏向等零角度偏置；左右裝胎的局部正負方向須一致。此線性疊加不能直接延伸到大側滑、大外傾與大驅動力同時作用，Chapter 14 提供進一步處理方法。

## 4. 縱向滑移率及不同試驗定義（pp. 32–41）

SAE 定義使用自由滾動角速度 $\Omega_0=V\cos\alpha/R_e$：

$$
S=\frac{\Omega-\Omega_0}{\Omega_0}
=\frac{\Omega R_e}{V\cos\alpha}-1.
$$

$$
\alpha=0:\quad S=\frac{\Omega R_e-V}{V},
\qquad \Omega=\frac{2\pi n}{60}.
$$

$n$ 為 rpm。自由滾動 $S=0$，鎖死且車仍前進時 $S=-1$，驅動空轉時 $S>0$。$S=1$ 表示圓周速度為路面前向速度的兩倍，並不是滑移率上限。$V\cos\alpha=0$ 時定義奇異，不能直接除以零。

部分試驗系統使用受載半徑 $R_l$，半徑不同會連帶改變零滑移位置：

$$
S_l=\frac{\Omega R_l}{V\cos\alpha}-1,
\qquad S=\frac{R_e}{R_l}(1+S_l)-1.
$$

原書 pp. 39–40 另列 Goodyear、Pacejka、Sakai 與 Dugoff 的定義，以下完整區分：

$$
S_x=1-\frac{V\cos\alpha}{\Omega R_e}
=\frac{S}{1+S}
\quad\text{（Goodyear）},
$$

$$
K_x=\frac{\Omega R_e}{V\cos\alpha}-1=S,
\qquad \sigma_x=\frac{V\cos\alpha}{\Omega R_e}-1=-\frac{S}{1+S}
\quad\text{（Pacejka）},
$$

$$
S_t=\frac{V\cos\alpha}{\Omega R_e}-1=\sigma_x,
\qquad S_b=1-\frac{\Omega R_e}{V\cos\alpha}=-S
\quad\text{（Sakai）},
$$

$$
S_D=1-\frac{\Omega R_e}{V\cos\alpha}=-S
\quad\text{（Dugoff、Fancher、Segel）}.
$$

Sakai 的驅動滑移 $S_t$ 在驅動時為負，與 Goodyear 的 $S_x$ 相反。各定義的反算關係為：

$$
S=K_x=-S_D=-S_b,
\qquad S_x=-\sigma_x=-S_t,
\qquad S=\frac{S_x}{1-S_x}=-\frac{\sigma_x}{1+\sigma_x}.
$$

原書自由滾動校正用同負載、同速度下的受載半徑 $R_0$ 與 TIRF 原點 $SR_0$：

$$
R_e=\frac{R_0}{1+SR_0},
\qquad S=\frac{R_e}{R_l}(1+SR)-1.
$$

這解釋了為何同一條輪胎曲線的橫軸不能只看「slip ratio」名稱就直接混用。小滑移區的縱向剛度為：

$$
k_x=\left.\frac{\partial F_x}{\partial S}\right|_0,
\qquad F_x\simeq k_xS.
$$

## 5. 組合滑移、摩擦圓與側向力餘裕（pp. 41–46、57–60）

以 $V_b=\Omega R_e$ 表示輪胎圓周速度，接地相對速度的兩個分量和大小為：

$$
V_{\mathrm{long}}=V\cos\alpha-V_b,
\qquad V_{\mathrm{lat}}=V\sin\alpha,
$$

$$
V_{\mathrm{slip}}=
\sqrt{V_{\mathrm{long}}^2+V_{\mathrm{lat}}^2}
=\sqrt{V^2+V_b^2-2VV_b\cos\alpha},
\qquad F=\sqrt{F_x^2+F_y^2}.
$$

**工程近似：** 用橢圓表示同一負載下的可用力邊界：

$$
\left(\frac{F_x}{\mu_xZ}\right)^2+
\left(\frac{F_y}{\mu_yZ}\right)^2\le1,
$$

$$
|F_y|\le\mu_yZ\sqrt{1-\left(\frac{F_x}{\mu_xZ}\right)^2}.
$$

只有當根號內非負時此估算才有意義。原書的 friction circle 是理解耦合的工具，不保證所有輪胎的邊界都是完美圓或橢圓；精算應使用 Chapter 14 的組合滑移資料。

## 6. 輪胎力投影、滾動阻力與功率（pp. 63–75）

沿實際運動方向的有號推力／阻力分量為：

$$
T_{\mathrm{path}}=F_x\cos\alpha-F_y\sin\alpha.
$$

本節沿用原書 $F_R$ 的滾動損耗定義及其 $SR$ 滑移率約定。含滑移及側滑的關係式為：

$$
\boxed{F_R=\left[(SR+1)\frac{T_{\mathrm{in}}}{R_l}-F_x\right]\cos\alpha
-F_y\sin\alpha.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-001"
  data-expression="((SR+1)*T_in/R_l-F_x)*cos(alpha)-F_y*sin(alpha)"
  data-inputs="SR:slip ratio as a fraction,T_in:input torque N m,R_l:loaded radius m,F_x:longitudinal force N,alpha:slip angle rad,F_y:lateral force N"
  data-result="F_R"
  data-unit="N"
  data-constants=""
  data-note="Use the signed forces and slip-ratio convention defined in this chapter. Enter alpha in radians and R_l &gt; 0.">
</div>

原書 Eq. (2.2) 解出輸入扭矩：

$$
T_{\mathrm{in}}=
\frac{F_xR_l}{SR+1}+
\frac{F_RR_l}{(SR+1)\cos\alpha}+
\frac{F_yR_l\tan\alpha}{SR+1}.
$$

再加入外傾角對力矩投影的修正（p. 75）：

$$
\boxed{T_{\mathrm{in}}=
\frac{F_xR_l}{SR+1}+
\frac{F_RR_l\cos\gamma}{(SR+1)\cos\alpha}+
\frac{F_yR_l\tan\alpha}{SR+1}+M_z\sin\gamma.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-002"
  data-expression="F_x*R_l/(SR+1)+F_R*R_l*cos(gamma)/((SR+1)*cos(alpha))+F_y*R_l*tan(alpha)/(SR+1)+M_z*sin(gamma)"
  data-inputs="F_x:longitudinal force N,R_l:loaded radius m,SR:slip ratio as a fraction,F_R:rolling resistance N,gamma:camber angle rad,alpha:slip angle rad,F_y:lateral force N,M_z:aligning moment N m"
  data-result="T_in"
  data-unit="N m"
  data-constants=""
  data-note="Enter both angles in radians. SR must differ from -1 and cos(alpha) must be nonzero. Preserve the chapter force and moment signs.">
</div>

這些是原書對其阻力與滑移定義的表達，不可把其他試驗機的 $S$ 未經換算代入；$SR=-1$ 或 $\cos\alpha=0$ 時不可使用此解式。無滑移的基本輪軸力矩式 Eq. (2.1) 為：

$$
T=F_xR_l+M_y\cos\gamma+M_z\sin\gamma,
\qquad M_y=F_RR_l=Zd.
$$

$d$ 為正向負載合力的縱向偏移。翻覆力矩的大小則由垂直力橫向偏移 $e$ 給出 $\lvert M_x\rvert=Z\lvert e\rvert$，號誌依偏移方向決定。

前後輪側滑所造成的誘導阻力，以力與側滑角的對應大小表示為 $D_{\mathrm{ind}}=\lvert F_{yF}\sin\alpha_F\rvert+\lvert F_{yR}\sin\alpha_R\rvert$；若用帶符號的力，應先作上述路徑方向投影。

$$
P=DV,
\qquad P[\mathrm{hp}]=\frac{D[\mathrm{lbf}]\,V[\mathrm{mph}]}{375}.
$$

## 7. 計算範例與資料使用順序

**自行示例：** $V=30\ \mathrm{m/s}$、$R_e=0.30\ \mathrm m$、$\Omega=110\ \mathrm{rad/s}$、$\alpha=0$，得到 $S=0.10$。若實測小滑移剛度 $k_x=40{,}000\ \mathrm N$，線性外推為 $4{,}000\ \mathrm N$，但仍須查實測曲線確認 10% 滑移是否已超過線性區。

實際計算依序為：決定四輪負載與角度 → 對各輪查純滑移曲線 → 加入驅動／制動耦合 → 投影到車身座標 → 合成車身力矩。Goodyear 圖組（pp. 75–82）的各輪胎尺寸與試驗條件不同，不能把其中一條曲線當成所有賽車輪胎的通用參數。
