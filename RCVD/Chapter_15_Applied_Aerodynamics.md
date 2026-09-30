---
layout: base
---

# Chapter 15: Applied Aerodynamics (賽車應用空氣動力學實務)

> 來源：RCVD 原書 PDF，書頁 489–578（PDF 第 520–609 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 空力負載、係數與參考面積（pp. 489–495）

本章把 Chapter 3 的基本式用到擾流板、翼、地面效應、阻力、內部冷卻流與前後平衡。大量數據來自特定車型與幾何，不能把圖上的係數當成通用值。以下升力 $L_a$ 向上為正，下壓力大小 $D_f=-L_a$。

$$
q=\frac12\rho V^2,
\qquad L_a=C_LqA,
\qquad D=C_DqA,
\qquad D_f=-C_LqA.
$$

增設裝置後應比較整車差值：

$$
\Delta L_a=qA\Delta C_L,
\qquad \Delta D=qA\Delta C_D,
\qquad \Delta P=\Delta D\,V.
$$

$$
\Delta P[\mathrm{hp}]=\frac{\Delta D[\mathrm{lbf}]V[\mathrm{mph}]}{375}.
$$

原書 p. 494 的例子增加 $128\ \mathrm{lbf}$ 阻力，在 140 mph 耗用約 48 hp。擾流板也會改變車身其他區域的壓力，不能只拿板面積乘孤立平板係數就代表總增阻。

## 2. 翼的幾何、Reynolds number 與有限翼展（pp. 498–502）

$$
AR=\frac{b_w^2}{A_w},
\qquad A_w=b_wc\ \text{（矩形翼）},
\qquad AR=\frac{b_w}{c}.
$$

$b_w$ 是翼展，$c$ 是翼弦，$A_w$ 是翼面積。翼型相似常用翼弦計算：

$$
Re_c=\frac{\rho Vc}{\mu}.
$$

原書的英制標準空氣近似為 $Re\simeq9230\,c[\mathrm{ft}]V[\mathrm{mph}]$；它隱含空氣性質，不宜拿來跨高度、溫度直接比較。

二維翼型升力斜率 $a_0$ 換成有限展弦比近似：

$$
a_w=\left(\frac{dC_L}{d\alpha}\right)_{AR}
=\frac{a_0}{1+a_0/(\pi AR)},
\qquad C_L\simeq a_w(\alpha-\alpha_0).
$$

斜率全以每 rad 表示。原書示例 $a_0=6.19/\mathrm{rad}$、$AR=2.77$，得到 $a_w\approx3.62/\mathrm{rad}=0.0632/\mathrm{deg}$。這是未失速區的近似，不能用直線無限外推到大迎角。

## 3. 端板與車體干擾（pp. 511–520）

原書以有效展弦比表示端板效應：

$$
AR_{\mathrm{eff}}=AR+\Delta AR,
\qquad \frac{AR_{\mathrm{eff}}}{AR}=1+\frac{\Delta AR}{AR}.
$$

對原圖所示上下對稱端板，在 $h/b_w\lesssim0.5$ 的示例範圍：

$$
\frac{\Delta AR}{AR}\simeq2\frac h{b_w}.
$$

較高端板不能繼續線性外推，須用原圖修正。翼與車身距離用 $h/c$、襟翼間隙用 gap/$c$ 等比值表達；這些參數改變流場與失速，係數仍須從對應圖譜取得。

## 4. 翼的阻力如何改變前後輪載（pp. 503–510）

翼的阻力作用高度 $h_D$，地面驅動力抵銷阻力時，形成抬頭力矩：

$$
\Delta W_F=-\frac{Dh_D}{\ell},
\qquad \Delta W_R=+\frac{Dh_D}{\ell}.
$$

原書示例 $D=95\ \mathrm{lbf}$、$h_D=4.75\ \mathrm{ft}$、$\ell=7.5\ \mathrm{ft}$，前軸減載約 60 lbf、後軸增載同量。若輸入的整車空力 $PM$ 已是在地面原點量測且包含此作用，不能再額外加一次 $Dh_D$。

表面壓力變化的均勻近似為：

$$
\Delta F=\Delta p\,A_{\mathrm{surface}}.
$$

原書後甲板示例 $\Delta p=3\ \mathrm{lbf/ft^2}$、面積約 $24.3\ \mathrm{ft^2}$，形成約 72.9 lbf 向上力。單一翼設定的淨輪載效果，因此要加總翼、車身壓力變化與阻力力矩。

## 5. 抽吸下壓力與地面效應（pp. 521–526）

如果有效摩擦係數近似固定，重量 $W_0$ 加下壓力 $D_f$：

$$
F_y=\mu(W_0+D_f),
\qquad A_y=\mu\left(1+\frac{D_f}{W_0}\right),
\qquad D_f=W_0\left(\frac{A_y}{\mu}-1\right).
$$

原書 Chaparral 2J 初估使用 $W_0=2500\ \mathrm{lbf}$、$\mu=1.3$、$A_y=1.7$，得到約 769 lbf 下壓力。若底部有效面積 50 ft²，所需壓降大小約 15.4 lbf/ft²。

理想密封流管的連續方程與 Bernoulli 式：

$$
\rho A_1V_1=\rho A_2V_2,
\qquad V_2=V_1\frac{A_1}{A_2},
$$

$$
p_2-p_1=\frac12\rho(V_1^2-V_2^2),
\qquad C_p=1-\left(\frac{V_2}{V_\infty}\right)^2.
$$

若 $V_1=V_\infty$，則：

$$
C_p=1-\left(\frac{A_1}{A_2}\right)^2,
\qquad \frac{A_1}{A_2}=\sqrt{1-C_p}.
$$

$C_p=-0.5$ 對應局部速度比 $\sqrt{1.5}\approx1.225$。原書特別指出，不知道入口停滯點或質量流率，就不能只憑底部間隙唯一預測下壓力。裙板漏流、邊界層、分離與擴散器回壓都會破壞這個簡單模型。

## 6. 阻力與滑行試驗（pp. 536–545）

$$
C_D=\frac D{qA},\qquad F_x=-D.
$$

**整理推導：** 平路滑行時，$m\dot V=-(D+D_r)$；若 $D_r$ 已另外辨識，可反算 $C_DA=2(-m\dot V-D_r)/(\rho V^2)$。有風時用相對空氣速度計算 $q$，有坡度時先扣除重力沿坡分量。

整車阻力包含壓力阻力、摩擦阻力、輪胎／外露部件及冷卻流等貢獻。各裝置交互影響，不能把孤立測試的 $C_D$ 不經面積及干擾修正直接相加。

## 7. 冷卻氣流的三個參數（pp. 554–559）

原書 p. 557–558 定義：

$$
K_P=\frac{\Delta p_{\mathrm{core}}}{\tfrac12\rho V_F^2},
\qquad R_V=\frac{V_F}{V_0},
\qquad C_{D,\mathrm{rad}}=\frac{D_{\mathrm{rad}}}{\tfrac12\rho V_0^2A_{\mathrm{rad}}}.
$$

$V_F$ 是散熱器表面速度、$V_0$ 是自由流速度、$A_{\mathrm{rad}}$ 是散熱器面積。**整理推導：**

$$
\dot m=\rho A_{\mathrm{rad}}V_F
=\rho A_{\mathrm{rad}}R_VV_0,
\qquad
\Delta p_{\mathrm{core}}=K_PR_V^2q_0.
$$

進出口面積、芯體壓降與可用壓差需一起匹配。原書的入口比例範例對應特定芯體阻力，並不是入口愈大就必然有更多冷卻流量。

## 8. 平板與側板的法向力分解（pp. 560–565）

原書在高迎角、平板已分離的適用條件下，用法向力係數 $C_{\mathrm{normal}}$ 分解：

$$
C_D=C_{\mathrm{normal}}\sin\alpha,
\qquad C_L=C_{\mathrm{normal}}\cos\alpha,
$$

$$
C_{\mathrm{normal}}=\sqrt{C_D^2+C_L^2},
\qquad N_{\mathrm{plate}}=C_{\mathrm{normal}}qA.
$$

原書高迎角示例取 $C_{\mathrm{normal}}=1.15$；在 $\alpha=42^\circ$、$q=25.6\ \mathrm{lbf/ft^2}$、$A=15\ \mathrm{ft^2}$ 時，約得 $D=295\ \mathrm{lbf}$、側向／升力分量 $328\ \mathrm{lbf}$、合力 $442\ \mathrm{lbf}$。角度較小或展弦比不同時，應回到相應圖表，不使用固定 1.15。

## 9. 表面粗糙度與輪胎周邊流場（pp. 566–570）

原書用來近似圖 15.72 的英制經驗式為：

$$
d_{\mathrm{grain}}[\mathrm{in}]\simeq\frac{0.126}{V[\mathrm{mph}]}.
$$

**單位換算：** 相當於 $d_{\mathrm{grain}}[\mathrm{mm}]\simeq1.4307/V[\mathrm{m/s}]$。它是該圖條件下不顯著增加表面摩擦的粗糙度尺度，不是任何表面與邊界層都適用的加工規範。

輪胎附近仍用 $C_p=(p-p_0)/q$、$Re_D=\rho VD/\mu$；旋轉與靜止輪胎、接地與離地的壓力分布不同。輪胎阻力係數若以輪胎正面積定義，不能與整車正面積係數直接比較。

## 10. 空力平衡與輪胎負載敏感度（pp. 570–577）

以地面軸距中點的力矩係數換算前後升力：

$$
C_{LF}=\tfrac12C_L+C_{PM},
\qquad C_{LR}=\tfrac12C_L-C_{PM},
\qquad D_{fF}=-qAC_{LF},\quad D_{fR}=-qAC_{LR}.
$$

若四輪負載等分，原書簡化的線性負載敏感度模型可寫為：

$$
Z_{\mathrm{total}}=W+D_f,
\qquad \mu(Z_i)=\mu_0-s_ZZ_i,
$$

$$
F_{y,\max}=\left(\mu_0-s_Z\frac{Z_{\mathrm{total}}}{4}\right)Z_{\mathrm{total}},
\qquad F_{\mathrm{centripetal}}=\frac Wg\frac{V^2}{R}.
$$

兩條力—速度曲線的交點滿足 $F_{y,\max}=WV^2/(gR)$，給出該半徑的極限速度。原書另比較高負載時係數不再下降、以及完全沒有負載敏感度的假想情形。這些是敏感度分析，不代表可把線性 $\mu(Z)$ 外推成負摩擦係數。

**整理推導：** 若完全忽略負載敏感度，且 $D_f=k_AV^2$，則：

$$
\boxed{V^2=\frac{\mu W}{W/(gR)-\mu k_A}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-017"
  data-expression="mu*W/(W/(g*R)-mu*k_A)"
  data-inputs="mu:constant friction coefficient,W:vehicle weight N,g:gravity m/s^2,R:turn radius m,k_A:downforce coefficient N s^2/m^2"
  data-result="V_squared"
  data-unit="m^2/s^2"
  data-constants=""
  data-note="Outputs V squared, not speed. Assumes constant friction and downforce = k_A*V^2. Only a positive denominator gives a finite physical speed limit; zero or negative denominator means this idealized model supplies no finite limit.">
</div>

分母接近零時，這個理想模型失去有限速度上限；實車仍受功率、輪胎、空力失速與結構等條件限制。這正是本章比較輪胎負載敏感度的目的。
