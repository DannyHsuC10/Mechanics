---
layout: base
---

# Chapter 17: Suspension Geometry (懸吊幾何學與運動學設計)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=638)，書頁 607–664（PDF 第 638–695 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 自由度與瞬時中心（pp. 607–614）

原書用自由度、瞬時中心（IC）和虛擬擺臂描述懸吊。剛體在三維有 6 自由度；忽略輪胎自轉後，獨立懸吊的輪架通常保留 1 個跳動自由度，需要 5 個獨立約束。整體車軸保留升沉與側傾兩自由度，需要 4 個約束。

$$
n_{\mathrm{DOF}}=6-\operatorname{rank}(\boldsymbol J_c).
$$

此式是對書中自由度計數的矩陣整理；只有約束獨立時才能把「桿件數」直接當成矩陣秩。A-arm 相當於兩個幾何約束，球接頭的位置或機構奇異點會影響獨立性。

## 2. 前視 IC 與滾動中心（pp. 612–615）

在前視平面，把上、下控制臂的投影線延長求交得到瞬時中心。**幾何整理：** 若兩條線為 $z=m_Uy+c_U$、$z=m_Ly+c_L$：

$$
y_{IC}=\frac{c_L-c_U}{m_U-m_L},
\qquad z_{IC}=m_Uy_{IC}+c_U.
$$

平行時 IC 在無限遠，這是可能的幾何情況，不應除以零。對單側輪胎接地點 $(y_P,0)$，由接地點連 IC 的線在車身中線 $y=0$ 的交點高度：

$$
z_{RC}=\frac{z_{IC}y_P}{y_P-y_{IC}}.
$$

左右不對稱或車身已側傾時，應把左右接地點—IC 連線相交求當下滾心，不再強制滾心位於中線。IC 與 RC 都是當下幾何量，會隨行程移動。

## 3. 頂升與幾何負載轉移（pp. 614–615）

接地點到 IC 的線與水平夾角 $\lambda$，局部幾何力分解可整理為：

$$
F_{z,\mathrm{geom}}=F_y\tan\lambda.
$$

正負依左右輪與力方向決定。較高滾心會增大部分幾何負載傳遞，不代表總負載轉移消失；整體仍須滿足 $WA_yh$ 的力矩平衡。原書以 jacking 討論高滾心與車身抬升等副作用。

## 4. 外傾增益、fvsa 與 roll camber（pp. 615、627–628）

原書把前視擺臂長度 $l_{fv}$ 與每一單位跳動的外傾變化連結。微分小角度形式為：

$$
\left|\frac{d\gamma}{dz_w}\right|\simeq\frac1{l_{fv}}
\quad[\mathrm{rad/m}].
$$

書中以「一英吋位移」示意的角度為 $\arctan(1/l_{fv})$ 度／英吋，前提是 $l_{fv}$ 也用英吋；更明確地寫成有限增量：

$$
|\Delta\gamma|\simeq\arctan\left(\frac{\Delta z_w}{l_{fv}}\right).
$$

正負與幾何位置有關，不可把絕對值直接加到兩側車輪。原書定義 roll camber 為車輪對地外傾變化與車身對地側傾變化的比例：

$$
RC_\gamma=\frac{\Delta\gamma_{\mathrm{road}}}{\Delta\phi},
\qquad l_{fv}\simeq\frac{t/2}{1-RC_\gamma}.
$$

這是小角度、對稱幾何的初始配置式。$RC_\gamma=0$ 表示車輪對地外傾被完全補償；不代表靜態外傾必須為零。

## 5. 縱向負載轉移與 anti 定義（pp. 616–619）

先從整車平衡求總負載轉移，不論懸吊是否有 anti：

$$
\Delta W_x=\frac{W A_xh}{\ell}.
$$

制動段以 $A_B>0$ 表示減速度大小，$B_F$ 為前制動力占比（0–1）。前懸吊幾何承受的反作用力若為 $F_{z,\mathrm{geom}}=WA_BB_F\tan\phi_F$，則前 anti-dive 百分比為：

$$
AD_F=100\frac{F_{z,\mathrm{geom}}}{WA_Bh/\ell}
=100B_F\frac{\ell}{h}\tan\phi_F.
$$

外置煞車的側視角 $\phi_F$ 是**接地點到 IC** 的連線角；後軸 anti-lift 對應：

$$
AL_R=100(1-B_F)\frac{\ell}{h}\tan\phi_R.
$$

100% anti 指這個工況下的縱向負載轉移反力完全由幾何傳遞、彈簧不必以相同方式壓縮／伸長，不代表輪胎沒有負載轉移。

## 6. 原書圖 17.13 的內置煞車公式疑點

**原頁核對記錄（p. 618）：** 圖 17.13 印出的前、後百分比，將制動分配放在分母：

$$
AD_{F,\mathrm{printed}}=100\frac{\tan\theta_F}{(h/\ell)B_F},
\qquad
AL_{R,\mathrm{printed}}=100\frac{\tan\theta_R}{(h/\ell)(1-B_F)}.
$$

其中 $\theta$ 是**輪心到 IC** 的連線角，因為煞車扭矩由車身承受。此分配因子的印刷寫法與同頁文字的力比推導不一致；例如 $B_F\to0$ 時前 anti 反而發散，不能直接用作計算依據。

**按本筆記「幾何垂直反力／全車縱向負載轉移」定義重新推導：**

$$
AD_{F,\mathrm{balance}}=100B_F\frac{\ell}{h}\tan\theta_F,
\qquad
AL_{R,\mathrm{balance}}=100(1-B_F)\frac{\ell}{h}\tan\theta_R.
$$

這裡保留原書印式供對照，明示計算所採的力平衡式，不將疑似原書排版問題悄悄當成已核實定律。若使用不同 anti 分母定義，應先重新建立自由體圖。

## 7. 前驅 anti-lift、後驅 anti-squat（p. 619）

原書圖 17.14、17.15 的單一驅動軸工況：

$$
F_{A-L}=F_{\mathrm{thrust}}\tan\theta,
\qquad \%\mathrm{Anti}=100\frac{\ell}{h}\tan\theta.
$$

整體式後橋由連桿承受驅動扭矩，使用接地點到 IC 的角 $\phi_R$；獨立後懸吊／de Dion、差速器固定於車身時，使用輪心到 IC 的角 $\theta_R$：

$$
AS_{\mathrm{solid}}=100\frac{\ell}{h}\tan\phi_R,
\qquad AS_{\mathrm{IRS}}=100\frac{\ell}{h}\tan\theta_R.
$$

若改成多軸分配驅動，需按實際扭矩反力路徑與驅動力份額重新推導，不能無條件沿用 100% 後軸驅動的公式。

## 8. 整體車軸的 roll steer（pp. 620–624）

原書將車軸側傾軸的前後斜率對應 roll steer。若側視斜率為 $\tan\lambda=\Delta z/\Delta x$：

$$
\mathrm{Roll\ steer\ (\%)}=100\tan\lambda,
\qquad \left|\frac{d\delta_{\mathrm{axle}}}{d\phi}\right|\simeq|\tan\lambda|.
$$

角度比須使用一致單位。前低後高或前高後低的符號要依原書側視方向判讀；對後軸，輪子向彎心轉通常形成轉向不足的影響，向彎外轉則相反。

## 9. 轉向軸與機構全行程檢查（pp. 624–664）

後段比較雙 A-arm、MacPherson、拖曳臂及多種車軸定位方式，主要以幾何構圖呈現，並沒有每個懸吊都共用的閉式 IC 公式。可把各球接頭距離約束寫成：

$$
g_j(\boldsymbol q)=\|\boldsymbol r_{j,1}(\boldsymbol q)-\boldsymbol r_{j,2}\|^2-l_j^2=0,
$$

$$
\boldsymbol J_c\frac{d\boldsymbol q}{dz_w}
=-\frac{\partial\boldsymbol g}{\partial z_w}.
$$

此為計算機構導數的整理方法。逐步掃描 jounce/rebound 與轉向，輸出 camber、toe、IC、RC、track、wheelbase、安裝比及 anti；不要只核對靜態車高一個位置。原書特別指出瞬時中心會移動，靜態設計數值不保證動態仍保持相同。
