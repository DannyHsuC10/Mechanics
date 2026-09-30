---
layout: base
---

# Chapter 14: Tire Data Treatment (輪胎數據處理與無因次化擬合模型)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=504)，書頁 473–488（PDF 第 504–519 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 正規化的目的與符號（pp. 473–474）

本章把不同負載下的輪胎曲線縮放到較接近的一條主曲線，再恢復為有單位的力與力矩。縮放不代表所有輪胎具有相同曲線，也不代表胎壓、溫度與路面改變後仍可沿用參數。

以下 $Z>0$ 是垂直負載，$\mu_x,\mu_y$ 是相應峰值係數，$C$ 為此章資料曲線方向下的側偏剛度，$k_x$ 為縱向滑移剛度，$G$ 為外傾剛度。**本章圖形與正規化的角度／側力方向須成套使用**；若輸入 Chapter 5 的負剛度 convention，應先轉成同一正向曲線，再套擬合，不能混用正 $C$ 與反向 $F_y$。

## 2. 純側滑的力與力矩正規化（pp. 475–476；Eqs. 14.1–14.4）

$$
\bar F=\frac{F_y}{\mu_yZ},
\qquad \bar M_z=\frac{M_z}{T_z\mu_yZ},
\qquad \bar M_x=\frac{M_x}{P_x\mu_yZ},
$$

$$
\bar\alpha=\frac{C\tan\alpha}{\mu_yZ}.
$$

$T_z$ 與 $P_x$ 是原書的小側滑氣壓拖距與翻覆拖距，分別由小側滑區的 $M_z/F_y$ 與 $M_x/F_y$ 取得，需遵守本章資料的力矩正負慣例。它們是隨負載而變的長度尺度，不是可以任意設為 1 的無因次常數。恢復實際值時：

$$
F_y=\mu_yZ\bar F,
\qquad M_z=T_z\mu_yZ\bar M_z,
\qquad M_x=P_x\mu_yZ\bar M_x.
$$

小角度時 $\tan\alpha\simeq\alpha$，故 $F_y\simeq C\alpha$。若 $C$ 為 N/deg，先換為 N/rad 再與 $\tan\alpha$ 結合。

## 3. 對稱化與 Magic Formula 擬合（pp. 476–477；Eqs. 14.5–14.7）

原書先平均正、負側滑曲線，以降低錐度／簾布偏向偏置。可整理為：

$$
F_{y,\mathrm{odd}}(\alpha)
=\frac{F_y(\alpha)-F_y(-\alpha)}2,
\qquad
F_{y,\mathrm{even}}(\alpha)
=\frac{F_y(\alpha)+F_y(-\alpha)}2.
$$

奇對稱部分用於主曲線，偶對稱部分保存偏置資訊。原書採下列三層擬合：

$$
\bar F=D'\sin\varphi,
\qquad \varphi=C'\arctan(B'\eta),
$$

$$
\eta=(1-E')\bar\alpha+
\frac{E'}{B'}\arctan(B'\bar\alpha).
$$

等價合併式為：

$$
\bar F=D'\sin\left\{C'\arctan\left[
B'\bar\alpha-E'\bigl(B'\bar\alpha-\arctan(B'\bar\alpha)\bigr)
\right]\right\}.
$$

原書圖 14.1 的示例參數為 $B'=0.714,C'=1.40,D'=1.0,E'=-0.20$；回正力矩圖 14.2 另用 $B'=0.852,C'=2.3,D'=0.51,E'=-2.75$。這些只是該組數據的 fit，不能直接視為自己的輪胎係數。

**整理推導：** 原點正規化斜率為 $B'C'D'$；實際側力斜率為 $C B'C'D'$。前一組參數乘積約為 1，使正規化的小角度斜率保持一致。

## 4. 純外傾與純縱向滑移（pp. 478–479；Eqs. 14.8–14.12）

$$
\bar\gamma=\frac{G\sin\gamma}{\mu_yZ}.
$$

在純外傾近似線性區，$\bar F\simeq\bar\gamma$，即 $F_y\simeq G\sin\gamma$。這裡的 $G$ 是外傾剛度，不是剪切模數。

$$
\bar F_x=\frac{F_x}{\mu_xZ},
\qquad \bar S=\frac{k_xS}{\mu_xZ},
$$

$$
S=\frac{\Omega R_e-V\cos\alpha}{V\cos\alpha},
\qquad \alpha=0:\quad S=\frac{\Omega R_e}{V}-1.
$$

$R_e$ 是自由滾動有效半徑。轉速為零且車前進時 $S=-1$；車速為零時這個定義不能直接使用。恢復縱向力用 $F_x=\mu_xZ\bar F_x$。

## 5. 側滑角＋外傾角（pp. 480–481；Eqs. 14.13–14.14）

為避免與車身側滑角混淆，保留原書的正規化組合量 $\bar\beta$。對正的 $\bar\gamma$：

$$
\bar\beta=\frac{\bar\alpha}{1-\bar\gamma\operatorname{sgn}\alpha},
\qquad
FN=\frac{\bar F-\bar\gamma}{1-\bar\gamma\operatorname{sgn}\alpha}.
$$

若主曲線是 $FN=f(\bar\beta)$，反算為：

$$
\bar F=\bar\gamma+
\left(1-\bar\gamma\operatorname{sgn}\alpha\right)f(\bar\beta).
$$

當 $\bar\gamma=0$，回到純側滑；當 $\alpha=0$ 且主曲線通過原點，回到純外傾力。分母為零附近不能直接代入。負外傾可利用經偏置處理後的輪胎對稱性：

$$
F_y(\alpha,\gamma)=-F_y(-\alpha,-\gamma),
\qquad F_y(-\alpha,\gamma)=-F_y(\alpha,-\gamma).
$$

非對稱輪胎或未除去 ply steer/conicity 時不能強制套用上述對稱。

## 6. 側滑角＋縱向滑移（pp. 482–483；Eqs. 14.15–14.21）

先定義正規化滑移長度 $k$ 與合力：

$$
k=\sqrt{\bar S^2+\bar\alpha^2},
\qquad R(k)=\sqrt{\bar F_x^2+\bar F^2}.
$$

注意此處 $R(k)$ 是正規化合力，不是輪胎半徑或轉彎半徑。原書的方向分配關係為：

$$
\bar F\,S=\eta(k)\bar F_x\tan\alpha,
\qquad \eta_0=\frac{C\mu_x}{k_x\mu_y},
$$

$$
\eta(k)=
\begin{cases}
\frac12(1+\eta_0)-\frac12(1-\eta_0)\cos(k/2),& |k|\le2\pi,\\
1,&|k|>2\pi.
\end{cases}
$$

最後分解成兩個方向：

$$
\bar F=\eta(k)R(k)
\frac{\tan\alpha}{\sqrt{S^2+\eta(k)^2\tan^2\alpha}},
$$

$$
\bar F_x=R(k)
\frac{S}{\sqrt{S^2+\eta(k)^2\tan^2\alpha}}.
$$

恢復有單位的力：

$$
F_y=\mu_yZ\bar F,\qquad F_x=\mu_xZ\bar F_x.
$$

在 $k\to0$ 時 $\eta\to\eta_0$，原書驗算的關係為：

$$
\frac{F_y}{C\tan\alpha}=\frac{F_x}{k_xS}\to1.
$$

實作遇到 $S=\alpha=0$，方向分解是 $0/0$，應直接回傳零滑移力或使用解析極限，而不是以極小分母任意放大。原書範例以純側滑同形主曲線擬合 $R(k)$，但仍須驗證自己的輪胎組合滑移資料是否成立。

## 7. 如何建立可用的輪胎計算資料（pp. 484–488）

1. 統一力、角度、滑移率、負載與溫度的定義。
2. 對每個負載提取 $C,k_x,G,\mu_x,\mu_y$ 及力矩尺度。
3. 保留偏置資料，再對稱化主要曲線。
4. 計算 $\bar\alpha,\bar\gamma,\bar S$，擬合純滑移主曲線。
5. 用原始有單位資料驗證逆轉換、零點、峰值與飽和區。
6. 分別驗證側滑＋外傾與側滑＋縱滑的模型，不把兩者未經試驗地直接串接成任意三重組合模型。

每一步都應保留負載、胎壓、外傾與速度範圍。正規化可減少資料量，但不會產生原本沒有量過的輪胎物理資訊。
