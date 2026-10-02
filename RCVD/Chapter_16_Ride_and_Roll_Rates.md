---
layout: base
---

# Chapter 16: Ride and Roll Rates (行駛與側傾剛度計算)

> 來源：RCVD 原書 PDF，書頁 579–606（PDF 第 610–637 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 三種垂直剛度不能混用（pp. 579–582）

| 量 | 定義 |
| --- | --- |
| $k_s$ spring rate | 彈簧本體軸向力／壓縮量 |
| $k_w$ wheel center rate | 在輪心量到的懸吊力／輪心相對車身位移 |
| $k_r$ ride rate | 車身到地面的等效剛度，包含輪胎柔度 |
| $k_t$ tire rate | 輪胎垂直負載／壓縮量 |
| $K_\phi$ roll rate | 整軸或全車的側傾力矩／側傾角 |

以下垂直剛度使用 N/m，角剛度使用 N m/rad，質量 kg，長度 m。原書常用 lb/in 與 lb-ft/deg，不能把英制換算常數帶進 SI 公式。

## 2. 頻率、靜態壓縮與所需 ride rate（pp. 582–589）

$$
f_n=\frac1{2\pi}\sqrt{\frac{k_r}{m_s}},
\qquad k_r=(2\pi f_n)^2m_s,
\qquad x_{\mathrm{static}}=\frac{m_sg}{k_r}.
$$

$$
f_n=\frac1{2\pi}\sqrt{\frac g{x_{\mathrm{static}}}},
\qquad f[\mathrm{cpm}]=60f[\mathrm{Hz}].
$$

$m_s$ 是該角等效簧上質量。原書第一個簡化例子未完整分離簧下重量，後一例則另外扣除，使用時應註明模型層級。

由某工況的增量輪載 $\Delta W$ 與可用額外行程 $z_{\mathrm{allow}}$ 初選：

$$
k_r\ge\frac{\Delta W}{z_{\mathrm{allow}}},
\qquad \frac{k_{r,2}}{k_{r,1}}=\left(\frac{f_{n,2}}{f_{n,1}}\right)^2.
$$

後式假設質量不變。頻率增 20% 需要剛度增 44%，不是增 20%。

## 3. 輪胎與懸吊串聯（pp. 591–594）

$$
\frac1{k_r}=\frac1{k_w}+\frac1{k_t},
\qquad k_r=\frac{k_wk_t}{k_w+k_t},
\qquad k_w=\frac{k_rk_t}{k_t-k_r}.
$$

要求 $0<k_r<k_t$。若設計需求 $k_r\ge k_t$，單靠把懸吊彈簧無限加硬仍無法達到；輪胎柔度成為上限。

## 4. 獨立懸吊的側傾剛度（pp. 589–592）

左右相同 ride rate $k_r$、輪距 $t$ 時：

$$
\boxed{K_{\phi,\mathrm{springs}}=\frac{k_rt^2}{2}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-018"
  data-expression="k_r*t^2/2"
  data-inputs="k_r:each side ride rate N/m,t:track width m"
  data-result="K_phi_springs"
  data-unit="N m/rad"
  data-constants=""
  data-note="Use the ride rate of one side (including tire compliance) and the full track width in meters. Both sides have equal rates.">
</div>

原書對左右不同剛度，在無額外淨垂直力、允許升沉調整的條件下給出：

$$
\boxed{K_\phi=\frac{k_Lk_R}{k_L+k_R}t^2.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-019"
  data-expression="k_L*k_R/(k_L+k_R)*t^2"
  data-inputs="k_L:left vertical rate N/m,k_R:right vertical rate N/m,t:track width m"
  data-result="K_phi"
  data-unit="N m/rad"
  data-constants=""
  data-note="Use positive rates. This formula permits heave adjustment with no additional net vertical force; it is not the fixed-heave formula.">
</div>

若車身升沉被強制固定，則是另一個條件，角剛度為 $(k_L+k_R)t^2/4$；兩式不能混用。左右相同時兩者一致。

換算角度單位：

$$
K_\phi[\mathrm{N\,m/deg}]
=K_\phi[\mathrm{N\,m/rad}]\frac\pi{180}.
$$

原書 $k_r$ 用 lb/in、$t$ 用 ft 時，$K_\phi[\mathrm{lb\!\cdot\!ft/rad}]=12k_rt^2/2$；其中 12 只是長度單位換算。

## 5. 選防傾桿前，先把輪胎角柔度移除（pp. 592–594）

輪胎與懸吊在側傾方向也呈串聯。先定義：

$$
K_{\phi t}=\frac{k_tt^2}{2},
\qquad K_{\phi w}=\frac{k_wt^2}{2},
$$

$$
\boxed{K_{\phi,\mathrm{effective}}
=\frac{K_{\phi t}(K_{\phi w}+K_{\phi B})}
{K_{\phi t}+K_{\phi w}+K_{\phi B}}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-020"
  data-expression="K_phit*(K_phiw+K_phiB)/(K_phit+K_phiw+K_phiB)"
  data-inputs="K_phit:tire roll stiffness N m/rad,K_phiw:wheel center spring roll stiffness N m/rad,K_phiB:added anti-roll stiffness N m/rad"
  data-result="K_phi_effective"
  data-unit="N m/rad"
  data-constants=""
  data-note="All angular stiffnesses must be expressed per radian and at the same axle reference. Tire compliance is in series with the wheel-center spring and bar combination.">
</div>

若期望接地端有效側傾剛度為 $K_{\phi,\mathrm{target}}$，所需額外輪心端防傾剛度是：

$$
\boxed{K_{\phi B}
=\frac{K_{\phi,\mathrm{target}}K_{\phi t}}
{K_{\phi t}-K_{\phi,\mathrm{target}}}-K_{\phi w}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-021"
  data-expression="K_target*K_phit/(K_phit-K_target)-K_phiw"
  data-inputs="K_target:target effective roll stiffness N m/rad,K_phit:tire roll stiffness N m/rad,K_phiw:wheel center spring roll stiffness N m/rad"
  data-result="K_phiB"
  data-unit="N m/rad"
  data-constants=""
  data-note="Require 0 &lt; K_target &lt; K_phit. A negative answer means existing springs are already stiffer than the target; it is not a realizable positive added bar stiffness.">
</div>

不能簡單把「目標接地側傾剛度－現有接地彈簧剛度」當成防傾桿本體剛度。若反算為負，代表現有彈簧已比目標硬；若目標大於輪胎角剛度，該線性串聯系統無法實現。

## 6. 整體式車軸：彈簧輪距與輪胎輪距（pp. 592–595）

令輪胎輪距 $t$、彈簧間距 $t_s$、每側車軸垂直剛度 $k_a$：

$$
K_{\phi s}=\frac{k_at_s^2}{2},
\qquad K_{\phi t}=\frac{k_tt^2}{2},
\qquad
K_\phi=\frac{K_{\phi t}(K_{\phi s}+K_{\mathrm{aux}})}
{K_{\phi t}+K_{\phi s}+K_{\mathrm{aux}}}.
$$

$K_{\mathrm{aux}}$ 包含防傾桿或其他側傾支撐。原書葉片彈簧例子以 $K_{\mathrm{aux}}=0.4K_{\phi s}$ 表示額外側向／扭轉作用，40% 是該例假設，非所有葉片彈簧通用修正。

彈簧安裝位置向內移，即使保持相同 ride rate，也會降低側傾剛度，因為它與 $t_s^2$ 成正比。

## 7. 安裝比與幾何剛度（pp. 595–599）

原書安裝比定義為彈簧壓縮量除以輪心行程：

$$
IR=\frac{dx_s}{dz_w},
\qquad F_w=F_sIR.
$$

若 $IR$ 隨行程改變，微分得到原書 p. 596 的完整關係：

$$
k_w=\frac{dF_w}{dz_w}
=k_sIR^2+F_s\frac{dIR}{dz_w}.
$$

第一項是彈簧剛度的傳遞，第二項是幾何剛度。忽略第二項的近似才是：

$$
k_w\simeq k_sIR^2,
\qquad k_s\simeq\frac{k_w}{IR^2},
\qquad F_s\simeq\frac{F_w}{IR}.
$$

如果 $IR$ 是從實際機構位移量得，彈簧傾角已包含其中，不能再多乘一次 $\cos^2\theta$。若資料定義是「輪行程／彈簧行程」，則需先取倒數。

## 8. 扭力桿及防傾桿安裝比（pp. 599–600）

扭力桿角剛度 $K_\theta$、安裝比 $I_b=d\theta_b/dz_w$，若全用 rad 與 m：

$$
k_w\simeq K_\theta I_b^2.
$$

原書使用 $K_b$ 為 lb-in/deg、$I_b$ 為 deg/in 時，則：

$$
k_w[\mathrm{lb/in}]=\frac{K_bI_b^2}{57.3}.
$$

對常見防傾桿，桿端臂長 $L_B$、輪距 $t$、直線安裝比 $I_B$，原書給出：

$$
K_{\phi B}=K_{\theta B}I_B^2\frac{t^2}{L_B^2},
\qquad
K_{\theta B}=K_{\phi B}\frac{L_B^2}{I_B^2t^2}.
$$

左右相對行程在純側傾時約為 $t\phi$，這是 $t/L_B$ 的來源。車軸式安裝的 $I_B$ 必須用側傾運動量測，不能拿雙輪同向升沉的比值代替。

## 9. 車輛側傾與分配迭代（pp. 585–590、601–605）

簧上重量與重心高度：

$$
W_s=W-W_{uF}-W_{uR},
\qquad h_s=\frac{Wh-W_{uF}h_{uF}-W_{uR}h_{uR}}{W_s}.
$$

若簧上重心距前軸 $a_s$，側傾軸在該縱向位置的高度與垂直力臂為：

$$
z_{RA}=z_{RF}+\frac{a_s}{\ell}(z_{RR}-z_{RF}),
\qquad H_s=h_s-z_{RA}.
$$

目標側傾梯度 $RG=\lvert\phi\rvert/A_y$（rad/g）對應初估：

$$
K_{\phi,\mathrm{total}}\simeq\frac{W_sH_s}{RG}.
$$

每一軸的負載轉移還包括幾何與簧下項，可用下列忽略重力柔化的近似決定前後剛度分配：

$$
\frac{\Delta W_F}{A_y}
\simeq\frac{K_{\phi F}RG+W_{sF}z_{RF}+W_{uF}h_{uF}}{t_F},
$$

$$
\frac{\Delta W_R}{A_y}
\simeq\frac{K_{\phi R}RG+W_{sR}z_{RR}+W_{uR}h_{uR}}{t_R}.
$$

由所需負載轉移反算 $K_{\phi F}$，再用總和求後軸。原書第一例另包含傾斜彎道的 $W'=W(A_\alpha\sin\alpha+\cos\alpha)$ 與 $A_y=A_\alpha\cos\alpha-\sin\alpha$，詳細負載式見 Chapter 18。

## 10. 代入例與計算順序

**自行示例：** 每角 $m_s=250\ \mathrm{kg}$、目標 $f_n=2\ \mathrm{Hz}$、$k_t=200{,}000\ \mathrm{N/m}$、$IR=0.70$，得到 $k_r=39{,}478\ \mathrm{N/m}$、$k_w\approx49{,}188\ \mathrm{N/m}$、$k_s\approx100{,}383\ \mathrm{N/m}$。最後一式忽略幾何剛度。

完整順序：選頻率與行程 → 算 ride rate → 移除輪胎柔度 → 依安裝比求彈簧 → 算彈簧側傾剛度 → 依負載轉移／側傾梯度補防傾桿 → 重算四輪負載與行程。若觸底或幾何位置改變，就重新迭代。
