---
layout: base
---

# Chapter 20: Driving and Braking (驅動、制動與差速器動力學)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=760)，書頁 729–754（PDF 第 760–785 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 驅動與制動都由輪胎可用力限制（pp. 729–734）

引擎扭矩、齒比和煞車壓力只是輸入，車輛能否加速或減速還取決於每輪垂直負載、縱滑及過彎時已使用的側向力。原書前段比較前驅、後驅、四驅與各種差速器；後段給出煞車尺寸與踏板力的計算。

## 2. 輪端扭矩、牽引力與功率（基礎力學整理）

$$
T_w=\eta_d i_gi_fT_e,
\qquad F_x\simeq\frac{T_w}{R_e},
\qquad P_w=T_w\Omega_w=\eta_dP_e.
$$

$i_g,i_f$ 是變速箱與終傳的輸入／輸出減速比，$\eta_d$ 是效率，$R_e$ 是有效滾動半徑。輪胎力仍需滿足其 $F_x(S,Z,\alpha)$ 特性。若需要輪速瞬態，應使用：

$$
I_w\dot\Omega_w=T_w-T_b-F_xR_e-M_{\mathrm{loss}}.
$$

這些是把書中傳動與滑移討論寫成可計算形式，並非本章另列的原式。忽略輪轉慣量的 $F_x=T_w/R_e$ 只適合準穩態估算。

## 3. 過彎內外輪所需轉速差（pp. 734–735）

以後軸中心路徑半徑 $R$、輪距 $t$，且兩輪滾動半徑相同：

$$
R_o=R+t/2,\quad R_i=R-t/2,
\qquad \frac{\Omega_o}{\Omega_i}=\frac{R_o}{R_i}.
$$

原書相對於內輪速度的差異為：

$$
V_{\mathrm{diff}}=\frac{R_o}{R_i}-1
=\frac{t}{R-t/2}\simeq\frac tR\quad(t\ll R).
$$

例：$R=30\ \mathrm{ft}$、$t=5\ \mathrm{ft}$，精確差約 18.2%。固定鎖死車軸無法在此幾何下讓兩輪同時純滾動，必有輪胎縱向滑移。

## 4. 開放式差速器（pp. 735–738）

理想對稱差速器满足：

$$
\Omega_L+\Omega_R=2\Omega_c,
\qquad T_L=T_R=\frac{T_{\mathrm{in}}}{2}.
$$

$\Omega_c$ 為差速器殼體角速度，$T_{\mathrm{in}}$ 是進入殼體的總扭矩。若左右可傳遞扭矩上限為 $T_{L,\max},T_{R,\max}$，則：

$$
T_{\mathrm{axle},\max}=2\min(T_{L,\max},T_{R,\max}).
$$

這是內輪易打滑時整軸牽引力降低的原因。實際開放差速器仍有齒輪摩擦與油液阻力，並非完全零扭矩差。

## 5. LSD 與鎖定差速器：不要用一條通用鎖定率取代（pp. 738–748）

原書用左右轉速差與扭矩差的圖比較機構：

$$
\Delta n=n_L-n_R,
\qquad \Delta T=T_R-T_L,
\qquad T_L+T_R=T_{\mathrm{in}}.
$$

鎖定式滿足 $\Omega_L=\Omega_R$，但不要求 $T_L=T_R$。摩擦片、預載、速度敏感與扭矩敏感機構各有不同曲線，驅動與收油也可能不同，因此沒有本章通用的 $T_{\mathrm{lock}}=k\Delta\Omega$ 定律。

**若供應商提供 torque bias ratio，額外換算為：**

$$
B_T=\frac{T_{\mathrm{high}}}{T_{\mathrm{low}}},
\qquad T_{\mathrm{high}}=\frac{B_T}{1+B_T}T_{\mathrm{in}},
\qquad T_{\mathrm{low}}=\frac1{1+B_T}T_{\mathrm{in}}.
$$

這只是給定比值時的代數，不代表整個 LSD 在所有工況都有固定比值。左右縱向力差帶來的偏航力矩為：

$$
N_{\mathrm{drive}}=\frac t2(F_{xL}-F_{xR})
\quad\text{（$y$ 向右、$N$ 向右轉為正）}.
$$

## 6. 制動時前後動態負載（pp. 750–752）

原書以正 $A_B=a_B/g$ 表示減速度大小：

$$
W_{F,\mathrm{braked}}=W_F+WA_B\frac h\ell,
\qquad
W_{R,\mathrm{braked}}=W_R-WA_B\frac h\ell.
$$

其中 $W_F,W_R$ 應包括該速度的空力升／下壓與相應力矩影響，$W$ 為車重。按負載取得有效摩擦係數後：

$$
F_{BF,\max}=\mu_F(W_{F,\mathrm{braked}})W_{F,\mathrm{braked}},
$$

$$
F_{BR,\max}=\mu_R(W_{R,\mathrm{braked}})W_{R,\mathrm{braked}}.
$$

**理想同時達峰的分配推導：**

$$
B_F=\frac{F_{BF,\max}}{F_{BF,\max}+F_{BR,\max}}.
$$

乾濕地摩擦係數與可達減速度不同，負載轉移也不同，所以原書要求兩種路面都算，找出調整範圍。前後相同胎並不意味着應固定 50:50 制動。

## 7. 輪胎制動力轉成管路壓力（p. 752）

每輪所需制動力大小 $F_B$、輪胎受載半徑 $R_l$、煞車有效作用半徑 $r_b$、來令片摩擦係數 $\mu_p$、有效活塞總面積 $A_c$：

$$
T_b=F_BR_l=pA_c\mu_pr_b,
\qquad
p=\frac{F_B(R_l/r_b)}{A_c\mu_p}.
$$

原書 $A_c$ 是兩側有效活塞面積總和。固定對向卡鉗直接加總兩側活塞；滑動卡鉗須把反作用側的夾緊效果換成等效總面積，不能只加一側又忘記另一側，也不能已加總後再乘二。

由活塞直徑求面積的整理式：

$$
A_c=\sum_j\frac{\pi d_j^2}{4}.
$$

使用 N、m² 時壓力為 Pa；使用 lbf、in² 時為 psi。有效半徑是摩擦合力中心半徑，不一定等於碟盤外半徑。

## 8. 踏板比、主缸與平衡桿（p. 753）

原書單主缸關係：

$$
R_{\mathrm{pedal}}=
\frac{l_{\mathrm{foot}}}{l_{\mathrm{pushrod}}}
=\frac{pA_m}{F_{\mathrm{foot}}},
\qquad
p=\frac{R_{\mathrm{pedal}}F_{\mathrm{foot}}}{A_m}.
$$

兩個主缸時，還要加入平衡桿的推桿力分配。若前、後主缸推力比例為 $\lambda_F,\lambda_R$，且兩者和為 1，則**理想化整理式**為：

$$
p_F=\frac{\lambda_FR_{\mathrm{pedal}}F_{\mathrm{foot}}}{A_{mF}},
\qquad p_R=\frac{\lambda_RR_{\mathrm{pedal}}F_{\mathrm{foot}}}{A_{mR}}.
$$

液量與行程還須相容：

$$
\Delta V=A_mx_m,\qquad
x_{\mathrm{foot}}\simeq R_{\mathrm{pedal}}x_m.
$$

增大踏板比可以減少所需腳力，但也增加踏板行程。原書要求確認主缸全行程與機構空間，而不是只驗算壓力。

## 9. 制動距離與熱量（計算用途補充）

原書本章以能力與系統選型為主。若需把制動力轉成距離與能量，可用基礎力學：

$$
s=\frac{V_0^2-V_1^2}{2a_B}
\quad\text{（近似恆定減速度）},
\qquad
E_k=\frac12m(V_0^2-V_1^2).
$$

若計入輪系轉動能，另加 $\sum I_i(\Omega_{i0}^2-\Omega_{i1}^2)/2$；實際進入煞車的熱量須扣除空力及其他損耗，不把全車動能全部分給單片碟盤。ABS 的目的是避免輪胎長時間鎖死並接近適當滑移，不能把 $S=-1$ 當成最大制動的設計點。
