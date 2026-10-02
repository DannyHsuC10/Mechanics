---
layout: base
---

# Chapter 19: Steering Systems (轉向系統幾何與力矩反饋)

> 來源：RCVD 原書 PDF，書頁 709–728（PDF 第 740–759 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 轉向系統要一起看幾何、角度比與力（pp. 709–713）

原書先區分 caster、kingpin inclination、mechanical trail、scrub radius、spindle length。它們不只是決定方向盤輕重，也影響煞車時的偏轉、轉向外傾與車高。計算前應先確認轉向軸與輪胎接地點的三維位置。

本章统一用 $i_s=\delta_{SW}/\delta_w>1$ 表示常見的方向盤／路輪角比，另用 $G_s=1/i_s$ 表示路輪／方向盤增益。原書部分「steer ratio」公式使用後者，不能只看名稱代入。

## 2. Ackermann 幾何（pp. 713–716）

原書以構圖描述無側滑低速轉彎。將後軸中點至轉彎中心距離記為 $R$，前輪距 $t$，軸距 $\ell$，則可由圖整理成：

$$
\tan\delta_{\mathrm{in}}=\frac{\ell}{R-t/2},
\qquad \tan\delta_{\mathrm{out}}=\frac{\ell}{R+t/2},
$$

$$
\cot\delta_{\mathrm{out}}-\cot\delta_{\mathrm{in}}=\frac t\ell.
$$

這是純滾動幾何；高速輪胎有側滑且內外負載不同，最佳轉角差未必是 100% Ackermann，甚至可能使用反 Ackermann。應按輪胎在實際負載下的最佳側滑角決定。

**可比較的工程定義：** 在指定外輪角下，可定義：

$$
\boxed{\%Ack=100\frac{\cot\delta_{\mathrm{out}}-\cot\delta_{\mathrm{in}}}{t/\ell}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-031"
  data-expression="100*(cos(delta_out)/sin(delta_out)-cos(delta_in)/sin(delta_in))/(t/ell)"
  data-inputs="delta_out:outer road wheel angle rad,delta_in:inner road wheel angle rad,t:track width m,ell:wheelbase m"
  data-result="Ackermann"
  data-unit="%"
  data-constants=""
  data-note="Uses the percentage definition in this note. Enter both road-wheel angles in radians. Avoid zero or near-zero steering angles where cotangents are singular or ill-conditioned.">
</div>

這是本筆記用來量化構圖的定義，不聲稱所有車隊都採同一種百分比；零轉角附近餘切會發散，不宜直接計算。

## 3. 齒條 c-factor 與轉向角比（pp. 716–718）

原書 c-factor 是齒條每轉動一圈小齒輪的直線行程：

$$
c=\frac{\text{rack travel}}{\text{pinion revolutions}},
\qquad x_r=c\frac{\delta_{SW}[\mathrm{deg}]}{360}.
$$

轉向臂有效長度 $l_a$，小角度、連桿方向近似正交時：

$$
\delta_w[\mathrm{rad}]\simeq\frac{x_r}{l_a},
\qquad G_s\simeq\frac{c}{2\pi l_a},
\qquad i_s\simeq\frac{2\pi l_a}{c}.
$$

原書的有限角示意寫為：

$$
G_{s,\mathrm{book}}\simeq
\frac{\arcsin(c/l_a)[\mathrm{deg}]}{360^\circ}.
$$

這裡結果是路輪角／方向盤角；若要常見的「幾比一」，必須取倒數。此幾何估算要求 $\lvert c/l_a\rvert\le1$，且只適合所假定的連桿角度；更精確做法是用實測局部導數 $i_s=d\delta_{SW}/d\delta_w$，左右方向都測。

## 4. 轉向機、Pitman arm 與定義換算（p. 718）

原書寫出 box ratio 乘 Pitman arm／steering arm 的比例。為避免正倒數混用，若定義轉向機輸出增益 $G_{\mathrm{box}}=\theta_P/\delta_{SW}$：

$$
G_s\simeq G_{\mathrm{box}}\frac{l_P}{l_a}.
$$

若提供的是常見轉向機減速比 $i_{\mathrm{box}}=\delta_{SW}/\theta_P$，則等價式為：

$$
i_s\simeq i_{\mathrm{box}}\frac{l_a}{l_P}.
$$

$l_P$ 是 Pitman arm 有效長度。應先確認供應商的 ratio 是輸入／輸出還是輸出／輸入，再選相應式子。

## 5. Bump steer、roll steer 與量表換算（pp. 719–726）

原書以輪前後兩個量表的讀值差量測角度。量表水平間距 $s$，讀值差 $\Delta d$：

$$
\delta[\mathrm{rad}]\simeq\frac{\Delta d}{s},
\qquad \delta[\mathrm{deg}]\simeq\frac{180}{\pi}\frac{\Delta d}{s}.
$$

例如原書量表間距 14.25 in 時，讀值差 0.25 in 約為 1°。這里利用小角近似，量測幾何若較大角度應使用完整三角關係。

$$
K_{bs}=\frac{d\delta}{dz_w},
\qquad \Delta\delta\simeq K_{bs}\Delta z_w.
$$

前端向彎外的 steer 會減少前側力；後端向彎內的 steer 則有相反的前後平衡效果。機構完全剛性時 ride steer 與 roll steer 可由同一幾何推得，真車的轉向架、襯套與連桿柔度可能使兩種測試不一致。

## 6. 靜態 toe 與轉向遲滯

以輪圈或量測板前後距離 $s$ 為基準，可將單輪 toe 的差值轉角：

$$
\delta_{toe}\simeq\frac{d_{\mathrm{rear}}-d_{\mathrm{front}}}{s}.
$$

正負需按左輪／右輪及 toe-in/toe-out 分別定義。報告毫米 toe 時必須記錄量測直徑，否則不同輪圈无法比較。若同一方向盘位置由左、右回到中心時路輪角不同，可定義**量測整理式**：

$$
H_\delta(\delta_{SW})
=\delta_w^{\mathrm{increasing}}-\delta_w^{\mathrm{decreasing}}.
$$

原書的轉角試驗表呈現這類方向依賴，不能僅用一個平均轉向比掩蓋。

## 7. 轉向力矩的自由體整理

本章以幾何說明轉向力；完整計算最穩妥的表達是投影到轉向軸：

$$
M_{\mathrm{steer},i}
=\hat{\boldsymbol e}_{s,i}\cdot
\left(\boldsymbol r_{P/S,i}\times\boldsymbol F_i
+\boldsymbol M_{\mathrm{tire},i}\right).
$$

$\hat{\boldsymbol e}_{s,i}$ 是轉向軸單位向量，$\boldsymbol r_{P/S,i}$ 是軸上參考點到接地中心的向量。輪胎 $M_z$ 已含氣壓拖距效應，不能再把 $F_yt_p$ 當成另一個獨立力矩重複加入。幾何机械拖距與 scrub radius 的貢獻則由叉積算出。

**無助力、忽略慣性與摩擦的虛功近似：**

$$
T_{SW}\simeq\sum_iM_{\mathrm{steer},i}
\frac{d\delta_i}{d\delta_{SW}}.
$$

考慮傳動效率 $\eta_s$ 時，輸入力矩大小還須除以效率；停車轉向的接地剪切不能單靠行進時的氣壓拖距模型預測。

## 8. 代入例

**自行示例：** $c=50\ \mathrm{mm/rev}$、$l_a=100\ \mathrm{mm}$，中心附近 $i_s\simeq2\pi(100)/50=12.57$。這不是用 $\arcsin(0.5)$ 求得的一整圈平均比 12 的同一量；前者是小角局部比，後者是有限行程示意，應由實際左右轉角曲線驗證。
