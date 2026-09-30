---
layout: base
---

# Chapter 11: Testing and Development (測試方法學、數據採集與實車開發)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=404)，書頁 373–386（PDF 第 404–417 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 測試的目的與可比較條件（pp. 373–379）

本章把駕駛者與車輛視為共同系統。圈速有用，但一個數字不足以分辨推頭、出彎牽引不足、顛簸接地或高速度空力平衡。試驗前應記錄輪胎、溫度、胎壓、油量、定位、車高、配重及空力設定，並設置可重複的基準組。

準確度是與標準的接近程度；精密度是重複結果的集中程度；解析度是可辨識的最小差；遲滯則取決於先前的載入方向。這些並非同一件事。

## 2. 感測器增益與零點（pp. 379–380）

原書加速度計示例的零點為 5 V、增益為 2.5 V/g，因此：

$$
E=E_0+S_A A,
\qquad A=\frac{E-E_0}{S_A},
\qquad a=gA.
$$

在該例 $E_0=5\ \mathrm V$、$S_A=2.5\ \mathrm{V/g}$，$E=7.5\ \mathrm V$ 對應 $+1g$。這是書中的示例，不是所有感測器的固定設定。

**資料處理推導：** 若零點漂移 $\Delta E_0$，加速度偏差為 $\Delta A=-\Delta E_0/S_A$。採兩個已知標定點時：

$$
S_A=\frac{E_2-E_1}{A_2-A_1},
\qquad E_0=E_1-S_AA_1.
$$

電壓轉成加速度後，仍要檢查感測器軸向、安裝位置和重力投影。IMU 的 specific force 不一定等於地面軌跡二階導數，傾斜路面尤其不能直接混用。

## 3. 定半徑 skid pad 的速度與側向 g（pp. 383–385）

若車在半徑 $R$ 的圓周用時間 $T$ 完成一圈：

$$
V=\frac{2\pi R}{T},
\qquad A_y=\frac{V^2}{Rg}
=\frac{4\pi^2R}{gT^2}.
$$

原書英制換算為：

$$
V[\mathrm{ft/s}]=1.4667\,V[\mathrm{mph}],
\qquad g\simeq32.2\ \mathrm{ft/s^2}.
$$

**自行示例：** $R=30\ \mathrm m$、$T=12\ \mathrm s$，得到 $V=15.708\ \mathrm{m/s}$、$A_y=0.8384$。實測若不是固定半徑或速度持續變化，整圈平均只能作近似，不能當成每一瞬間都達同一穩態。

## 4. 從方向盤角求轉向不足梯度（pp. 383–385）

令 $i_s=\delta_{SW}/\delta$ 是方向盤／路輪轉角比。在固定 $R$ 下：

$$
\delta=\delta_{\mathrm{Ack}}+K_gA_y,
\qquad \delta_{\mathrm{Ack}}\simeq\frac\ell R,
$$

$$
K_g=\frac1{i_s}\left.\frac{d\delta_{SW}}{dA_y}\right|_R.
$$

若方向盤角以度記錄，結果直接是 deg/g。原書示例方向盤斜率約 $18^\circ/g$，轉向比 $17:1$，故路輪轉向不足梯度約 $18/17=1.06^\circ/g$。

原書高側向 $g$ 區的曲線明顯變陡，因此應使用當下局部斜率：

$$
K_g(A_y)\simeq\frac1{i_s}
\frac{\delta_{SW}(A_y+\Delta A)-\delta_{SW}(A_y-\Delta A)}{2\Delta A}.
$$

不可把低 $g$ 的線性斜率套用整條極限曲線。若測試改成固定車速而不是固定半徑，必須扣除 Chapter 5 的 $g\ell/V^2$ 幾何項。

## 5. 重複測試、差異及誤差（本節為計算方法補充）

原書要求一次改一項並回到基準。可用相同條件重複量測的平均與標準差量化：

$$
\bar x=\frac1n\sum_{i=1}^n x_i,
\qquad s_x=\sqrt{\frac1{n-1}\sum_{i=1}^n(x_i-\bar x)^2}.
$$

$$
\Delta x=\bar x_B-\bar x_A,
\qquad \Delta x_{\%}=100\frac{\bar x_B-\bar x_A}{\bar x_A}.
$$

這些是補充的資料統計式，非本章原書編號公式。樣本需可比較；車手逐圈學習或胎況持續變化時，不能當成獨立同分布數據。

由 $A_y=4\pi^2R/(gT^2)$，小誤差傳播可得：

$$
\frac{\Delta A_y}{A_y}\simeq\frac{\Delta R}{R}-2\frac{\Delta T}{T},
\qquad
\left(\frac{\sigma_A}{A_y}\right)^2
\simeq\left(\frac{\sigma_R}{R}\right)^2+4\left(\frac{\sigma_T}{T}\right)^2.
$$

後式假設半徑與時間誤差互不相關。它說明計時誤差對 $g$ 值的相對影響約是兩倍，而跑偏半徑也會改變結果。

## 6. 空力試驗的跨章計算（p. 381；Chapters 3、15）

$$
q=H-p,\qquad V=\sqrt{\frac{2q}{\rho}},
\qquad C_p=\frac{p-p_\infty}{q_\infty},
$$

$$
C_DA=\frac{D}{q},
\qquad C_LA=\frac{L_a}{q}.
$$

若以滑行減速度估阻力，**整理推導**為 $-m\dot V=D+D_r$，因此 $D=-m\dot V-D_r$；不能把滾動損耗、坡度與傳動阻力全部當成氣動阻力。

## 7. 可直接採用的試驗記錄項目

每一組設定記錄時間、路段、速度區間、方向盤角、油門／煞車、四輪溫壓、車高與定位；結果列低 $g$ 轉向梯度、最大可維持 $A_y$、各路段時間及駕駛對「發生位置與操作」的描述。原書明確指出高速空力問題不能僅由低速 skid pad 取代驗證；若模型預測與實測不同，先檢查量測條件與模型假設。
