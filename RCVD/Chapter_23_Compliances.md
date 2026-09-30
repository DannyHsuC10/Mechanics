---
layout: base
---

# Chapter 23: Compliances (懸吊襯套與結構彈性變形分析)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=864)，書頁 833–840（PDF 第 864–871 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 順應性是剛度的倒數（pp. 833–834）

輪胎定位在有負載時會因橡膠、接頭、拉桿、轉向架與底盤變形而改變。本章按「外力來源」與「車輪變化」分類，重點是順應轉向、順應外傾及它們對操控的影響。

單一線性自由度的定義為：

$$
k=\frac{dF}{dx},\qquad C=\frac{dx}{dF}=\frac1k,
\qquad \Delta x\simeq C\Delta F.
$$

轉動自由度則是：

$$
k_\theta=\frac{dM}{d\theta},
\qquad C_\theta=\frac{d\theta}{dM}=\frac1{k_\theta}.
$$

順應性對**力或力矩**取導數，不是 $d\delta/dk$。線性位移順應性單位為 m/N，角度對側力為 rad/N，角度對力矩為 rad/(N m)，不能相互混用。

## 2. 外力與定位變化矩陣（pp. 834–838 的整理）

原書主要考慮側力 $F_y$、縱力 $F_x$、回正力矩 $M_z$ 與翻覆力矩 $M_x$。可將實測的 toe／camber 變化寫成局部線性模型：

$$
\begin{bmatrix}\Delta\delta\\\Delta\gamma\end{bmatrix}
=\begin{bmatrix}
C_{\delta x}&C_{\delta y}&C_{\delta M_x}&C_{\delta M_z}\\
C_{\gamma x}&C_{\gamma y}&C_{\gamma M_x}&C_{\gamma M_z}
\end{bmatrix}
\begin{bmatrix}\Delta F_x\\\Delta F_y\\\Delta M_x\\\Delta M_z\end{bmatrix}.
$$

例如原書圖 23.2 的兩個主要量就是：

$$
C_{\delta y}=\left.\frac{\partial\delta}{\partial F_y}\right|_{\mathrm{test}},
\qquad C_{\gamma y}=\left.\frac{\partial\gamma}{\partial F_y}\right|_{\mathrm{test}}.
$$

條件下標表示其餘自由度、車高與載入方式固定。左、右輪的正負方向要分別記錄；同一數值在 toe-in 與全車右轉角的 convention 下可能有相反號。

## 3. 實測斜率、非線性與遲滯（pp. 837–839）

原書以 K&C／VHF 平台在接地點施力，量車輪轉角與外傾。局部斜率可用：

$$
C_{\delta y}(F_{y0})\simeq
\frac{\delta(F_{y0}+\Delta F)-\delta(F_{y0}-\Delta F)}{2\Delta F},
$$

$$
C_{\gamma y}(F_{y0})\simeq
\frac{\gamma(F_{y0}+\Delta F)-\gamma(F_{y0}-\Delta F)}{2\Delta F}.
$$

這是資料處理推導。原書曲線不是每個工作點都呈直線；若正反載入不重合，應分別保留加載／卸載曲線，而不是用一條斜率忽略間隙或摩擦。

$$
\Delta\delta_{\mathrm{hys}}(F_y)
=\delta_{\mathrm{loading}}(F_y)-\delta_{\mathrm{unloading}}(F_y).
$$

## 4. 順應性對前後平衡的方向（pp. 835–837）

原書的判讀規則是：把前輪轉離彎心通常增加轉向不足；把後輪轉離彎心則傾向轉向過度。外側輪在側力下向外傾會降低其有效抓地，发生在前軸通常是推头影響，发生在後軸則是甩尾影響，但强度仍取决於輪胎的外倾敏感度。

**用 Chapter 5 定義整理：** 若順應性造成前後額外轉角 $\delta_{cF},\delta_{cR}$，其對所需驾驶轉向角的改變約為：

$$
\Delta\delta_{\mathrm{driver}}
\simeq-\delta_{cF}+\delta_{cR},
$$

$$
\Delta K_g\simeq
-\frac{d\delta_{cF}}{dA_y}
+\frac{d\delta_{cR}}{dA_y}.
$$

若僅考虑側力順應轉向並以線性稳态軸力 $Y_F=W_FA_y,Y_R=W_RA_y$ 近似：

$$
\Delta K_g\simeq-C_{\delta y,F}W_F+C_{\delta y,R}W_R.
$$

這里系數必須是整軸的等效右轉角／側力。完整修正還包含外傾、回正力矩與左右負載差，不能僅用本式决定最终調校。

## 5. 原書更換轉向架襯套的例子（pp. 834–835）

在相同圓周、$0.4g$ 時，原本方向盤角 78°，加硬轉向架固定後為 72°，方向盤／路輪比 20：

$$
\Delta K_{SW}=\frac{72^\circ-78^\circ}{0.4}
=-15^\circ/g,
$$

$$
\Delta K_g=\frac{-15}{20}=-0.75^\circ/g.
$$

因此改動朝轉向過度方向，或說減少了 $0.75^\circ/g$ 的轉向不足。只看變化量，不能斷言整車已由轉向不足變成轉向過度；還需知道原本總梯度。

## 6. 多自由度剛度、底盤與串聯柔度（基礎力學補充）

若使用功共軛的廣義位移 $\boldsymbol q$ 與廣義力 $\boldsymbol Q$：

$$
\Delta\boldsymbol Q=\boldsymbol K\Delta\boldsymbol q,
\qquad \Delta\boldsymbol q=\boldsymbol C\Delta\boldsymbol Q,
\qquad \boldsymbol C=\boldsymbol K^{-1}.
$$

矩陣的逆不是每個元素取倒數，交叉耦合項也可能很重要。只有在同一負載路徑、同一自由度的線性串聯中，才有：

$$
C_{\mathrm{total}}=\sum_iC_i,
\qquad k_{\mathrm{total}}=\left(\sum_i\frac1{k_i}\right)^{-1}.
$$

若機構本身也影響剛度，可用局部幾何 Jacobian 將部件剛度投影到輪端；必須一致處理幾何剛度與預載，而非只依材料彈性模數比較。

## 7. 順應性與輪胎剛度形成回授（整理推導）

為說明量測的「有效側偏剛度」可能不同，改用正的向彎心有效側滑角 $\alpha_e$，$F_y=C_\alpha\alpha_e$。若順應轉向讓這個角度減少 $c_\delta F_y$：

$$
\alpha_e=\alpha_{\mathrm{command}}-c_\delta F_y,
\qquad
F_y=\frac{C_\alpha}{1+C_\alpha c_\delta}\alpha_{\mathrm{command}}.
$$

$$
C_{\alpha,\mathrm{effective}}=
\frac{C_\alpha}{1+C_\alpha c_\delta}.
$$

這是明確指定「減小有效側滑」方向的示例，不可與本章其他帶號系數直接混用。分母若接近零，局部線性假設與穩定性須重新檢查；公式不是設計極大增益的捷徑。

## 8. 工程使用順序

先用無載幾何算定位 → 用四輪實際負載計算順應變化 → 用修正後角度查輪胎力 → 重新檢查負載與變形，直到收斂。記錄元件溫度、預載、襯套方向及車高。原書結論是賽車通常應盡量減少難以預測的懸吊順應效應；若刻意設計順應轉向，必須有模型與量測相互支持。
