---
layout: base
---

# Chapter 12: Chassis Set-Up (底盤設定與調校指南)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=418)，書頁 387–412（PDF 第 418–443 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 本章是調校關係表，不是單一最佳化公式（pp. 387–412）

原書分 primary set-up 與 secondary effects。前者處理車輛當下的主要問題；後者提醒同一改動會影響制動、出彎、顛簸、瞬態與轉向力。以下依這些因果關係建立計算框架，**公式為相關章節引用或明示推導**。原書本章的調校表不能簡化成對所有車都有效的固定數字。

## 2. 秤重、配重與 cross weight（跨章：Chapter 18）

$$
W=W_{FL}+W_{FR}+W_{RL}+W_{RR},
\qquad f_F=\frac{W_{FL}+W_{FR}}W,
$$

$$
f_R=1-f_F,
\qquad CW=\frac{W_{FL}+W_{RR}}W.
$$

本筆記明定 cross weight 使用左前＋右後；若車隊採另一對角，數值就是 $1-CW$，必須註明。前後配重與總重固定仍不足以唯一決定四個角重，因為可改變對角預載。

量測時保持相同油量、車手／等效配重、水平秤面及車高。調整彈簧座可能同時改變車高與對角負載，不是只改其中一項。

## 3. 彈簧、防傾桿與負載轉移分配（pp. 390–397、410–411）

定義前側傾剛度比例與實際前負載轉移比例：

$$
\eta_{K,F}=\frac{K_{\phi F}}{K_{\phi F}+K_{\phi R}},
\qquad
\eta_{\Delta W,F}=\frac{\Delta W_F}{\Delta W_F+\Delta W_R}.
$$

這兩者通常不相等。單質量簡化式為：

$$
\Delta W_F=\frac{WA_y}{t_F}
\left(H\eta_{K,F}+\frac b\ell z_{RF}\right),
$$

$$
\Delta W_R=\frac{WA_y}{t_R}
\left(H(1-\eta_{K,F})+\frac a\ell z_{RR}\right).
$$

增加前側傾剛度通常增加前軸的負載差，但是否減少前抓地力還取決於外傾改善、接地狀況及輪胎負載敏感度。不能把「加硬前桿必定增加推頭」當成無條件定律。

總側傾角的小角度近似為：

$$
\phi\simeq-\frac{WA_yH}{K_{\phi F}+K_{\phi R}}.
$$

此式忽略重力幾何柔化與簧下分離；完整式見 Chapter 18。不要在側傾剛度單位 N m/deg 與 N m/rad 間直接相加。

## 4. 行駛頻率、行程與觸底（pp. 399、409–411；Chapter 16）

$$
f_n=\frac1{2\pi}\sqrt{\frac{k_r}{m_s}},
\qquad k_{r,\mathrm{new}}=k_{r,\mathrm{old}}
\left(\frac{f_{n,\mathrm{new}}}{f_{n,\mathrm{old}}}\right)^2,
$$

$$
\Delta z\simeq\frac{\Delta W}{k_r},
\qquad k_r\ge\frac{\Delta W_{\max}}{z_{\mathrm{available}}}.
$$

後式是局部線性、不觸止擋時的初估。限位塊一旦接觸，總剛度會改變，不能再用同一 $k_r$。原書「前後頻率差有助平順跨越顛簸」是應用條件下的調校經驗，不能把剛度增加 10% 誤當成頻率也增加 10%。

## 5. 定位、側傾外傾與順應性（pp. 397–400、405–407）

**局部線性化整理：** 車輪對地外傾可按實測導數組合：

$$
\Delta\gamma_i\simeq
\frac{\partial\gamma_i}{\partial z_i}\Delta z_i+
\frac{\partial\gamma_i}{\partial\phi}\Delta\phi+
\frac{\partial\gamma_i}{\partial\delta_i}\Delta\delta_i+
\frac{\partial\gamma_i}{\partial F_y}\Delta F_{yi}.
$$

如果懸吊幾何導數已包含車身側傾，不能再多加一次 $\phi$。同理，動態前束／轉角為：

$$
\Delta\delta_i\simeq
\frac{\partial\delta_i}{\partial z_i}\Delta z_i+
\frac{\partial\delta_i}{\partial F_x}\Delta F_{xi}+
\frac{\partial\delta_i}{\partial F_y}\Delta F_{yi}+
\frac{\partial\delta_i}{\partial M_z}\Delta M_{zi}.
$$

這些導數須由幾何、K&C 或量測取得。改變車高、輪圈 offset、轉向臂長度後，應重新測 bump steer，而非只保留原本靜態 toe 值。

## 6. 入彎、彎中、出彎要分開檢查（pp. 391–411）

制動使前軸增載、後軸減載；加速相反：

$$
\Delta W_x=\frac{m a_xh}{\ell},
\qquad W_F'=W_F-\Delta W_x,
\qquad W_R'=W_R+\Delta W_x.
$$

其中 $a_x>0$ 為加速。加煞車或油門還會占用輪胎側力餘裕；以橢圓近似示意：

$$
|F_{yi}|\le F_{yi,\max}
\sqrt{1-\left(\frac{F_{xi}}{F_{xi,\max}}\right)^2}.
$$

所以收油可能同時改變後輪負載、驅動滑移與差速器鎖定狀態。這解釋了為什麼只在穩態圓周有效的調校，可能在收油或 trail braking 時呈現不同結果。

## 7. 高速空力平衡與低速機械平衡（Chapter 15）

$$
Z_F=W_F+D_{fF},\qquad Z_R=W_R+D_{fR},
\qquad
B_{\mathrm{aero}}=\frac{D_{fF}}{D_{fF}+D_{fR}}.
$$

空力前配比不是總輪載的前配比，後者為：

$$
B_{\mathrm{load}}(V)=
\frac{W_F+D_{fF}(V)}{W+D_{fF}(V)+D_{fR}(V)}.
$$

若下壓力總和為零，$B_{\mathrm{aero}}$ 沒有定義。車高與俯仰改變空力圖譜時，須重新計算，不能只用 $V^2$ 放大固定係數。

## 8. 調校比較表與回到基準

| 改動 | 先計算／量測 | 需同時檢查的副作用 |
| --- | --- | --- |
| 配重位置 | $a,b,h,I_z$、四角負載 | 制動平衡、牽引力、瞬態 |
| 防傾桿 | $K_{\phi F},K_{\phi R},\Delta W_F,\Delta W_R$ | 單輪顛簸、內輪卸載、外傾 |
| 彈簧 | $f_n,k_r,\Delta z$ | 車高、止擋、空力平台 |
| 車高／定位 | 動態 camber、toe、bump steer | 轉向力、滾心、空力 |
| 差速器 | 左右轉速差、扭矩差 | 出彎輪滑、收油偏航 |
| 翼角 | $C_LA,C_DA$、前後空力配比 | 直線速度、底盤壓縮 |

**資料比較推導：** 局部調校靈敏度可用 $\Delta y/\Delta p$ 表示，但須記錄速度與工況。先一次改一項，回到 baseline 確認胎況／赛道變化，再决定是否保留；這對應原書強調的多重副作用，而不是保證某一方向改動永遠更快。
