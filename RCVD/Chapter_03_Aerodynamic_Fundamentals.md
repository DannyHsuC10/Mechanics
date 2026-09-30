---
layout: base
---

# Chapter 3: Aerodynamic Fundamentals (空氣動力學基礎)

> 來源：[RCVD 原書 PDF](rcvd%20ocr.pdf#page=114)，書頁 83–112（PDF 第 114–143 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 空氣性質與一致單位（pp. 84–87）

空力先由空氣密度與相對速度建立尺度，再乘上實驗得到的係數。壓力必須區分絕對壓力、靜壓、動壓與總壓；溫度使用絕對溫標。

$$
\rho=\frac{p}{R_{\mathrm{air}}T},
\qquad \frac{\rho}{\rho_0}=\frac{p}{p_0}\frac{T_0}{T},
\qquad \nu=\frac{\mu}{\rho}.
$$

SI 中 $\rho$ 為 kg/m³、$p$ 為 Pa、$T$ 為 K、$R_{\mathrm{air}}$ 為空氣比氣體常數，$\mu$ 是動力黏度 Pa s，$\nu$ 是運動黏度 m²/s。$T[\mathrm K]=T[{}^\circ\mathrm C]+273.15$。原書使用英制密度時為 slug/ft³，不能把 lbm/ft³ 不經處理代入 $q=\rho V^2/2$。

## 2. 連續方程與 Bernoulli 關係（pp. 87–97）

同一流管的質量流率守恆：

$$
\dot m=\rho AV,
\qquad \rho_1A_1V_1=\rho_2A_2V_2.
$$

若密度視為常數，則 $A_1V_1=A_2V_2$。穩定、低速、可忽略黏性損耗的同一流線上：

$$
H=p+q,
\qquad q=\frac12\rho V^2,
\qquad p_1+\frac12\rho V_1^2=p_2+\frac12\rho V_2^2.
$$

因此量到總壓與靜壓，就可求速度：

$$
V=\sqrt{\frac{2(H-p)}{\rho}}.
$$

若加入高度變化，整理成能量式為 $p+\rho V^2/2+\rho gz=\mathrm{constant}$。車身附近通常忽略空氣重力項，但不能忽略分離、邊界層與尾流造成的總壓損失。不同流線也未必具有相同總壓。

## 3. 壓力係數與表面力（pp. 95–101、107–108）

$$
C_p=\frac{p-p_\infty}{q_\infty},
\qquad q_\infty=\frac12\rho V_\infty^2.
$$

在可用 Bernoulli 的位置：

$$
C_p=1-\left(\frac{V}{V_\infty}\right)^2,
\qquad \frac{V}{V_\infty}=\sqrt{1-C_p}.
$$

停滯點理想值為 $C_p=1$；負 $C_p$ 表示低於遠場的靜壓，並不代表負的絕對壓力。不能把此理想反算用在有顯著總壓損失的尾流內。

**整理推導：** 若 $\boldsymbol n$ 是車體表面向外法向量，壓力貢獻為：

$$
\boldsymbol F_p=-\int_S(p-p_\infty)\boldsymbol n\,dS,
\qquad
\boldsymbol M_p=-\int_S\boldsymbol r\times[(p-p_\infty)\boldsymbol n],dS.
$$

這把原書的表面壓力分布轉成可數值積分的形式；完整空氣阻力還包含表面剪力，不能只積分壓力就宣稱得到所有阻力。

## 4. Reynolds number 與模型相似（pp. 101–106）

$$
Re=\frac{\rho VL}{\mu}=\frac{VL}{\nu}.
$$

$L$ 是選定的特徵長度；翼弦、車長和輪胎直徑不能交替使用而不交代。若風洞模型與實車使用相同空氣性質，幾何比例 $\lambda=L_m/L_f$，要求相同 $Re$ 時：

$$
V_m=\frac{V_f}{\lambda}.
$$

**由定義推導：** 相似且係數不變時，力比與力矩比為：

$$
\frac{F_m}{F_f}=\frac{\rho_m}{\rho_f}
\left(\frac{V_m}{V_f}\right)^2\lambda^2,
\qquad
\frac{M_m}{M_f}=\frac{\rho_m}{\rho_f}
\left(\frac{V_m}{V_f}\right)^2\lambda^3.
$$

縮尺模型的地面邊界層、輪胎旋轉、支架干擾及阻塞比也會影響結果，維持 $Re$ 並不足以消除所有試驗差異。

## 5. SAE 空力軸系、六分力與係數（pp. 109–112）

本章原點在地面、軸距中點與輪距中線的交點。升力 $L_a$ 向上為正、阻力 $D$ 向後為正、側力 $S$ 向右為正；俯仰力矩 $PM$ 以抬頭為正、偏航力矩 $YM$ 以車頭向右為正、側傾力矩 $RM$ 以右側下沉為正。這些空力正號不能直接當成 Chapter 4 所有車身力分量的正號。

$$
L_a=C_LqA,\qquad D=C_DqA,\qquad S=C_SqA,
$$

$$
PM=C_{PM}qA\ell,\qquad
YM=C_{YM}qA\ell,\qquad
RM=C_{RM}qA\ell.
$$

$A$ 為指定參考面積，$\ell$ 為軸距。常用車身正面投影面積，但翼型資料常用翼面積；換面積後係數必須跟著換：

$$
C_{F,2}=C_{F,1}\frac{A_1}{A_2},
\qquad C_{M,2}=C_{M,1}\frac{A_1\ell_1}{A_2\ell_2}.
$$

將總升力與俯仰力矩等效成前、後軸升力：

$$
L_F=\frac{L_a}{2}+\frac{PM}{\ell},
\qquad L_R=\frac{L_a}{2}-\frac{PM}{\ell},
$$

$$
C_{LF}=\frac12C_L+C_{PM},
\qquad C_{LR}=\frac12C_L-C_{PM}.
$$

同樣，前後等效側力為：

$$
S_F=\frac S2+\frac{YM}{\ell},
\qquad S_R=\frac S2-\frac{YM}{\ell}.
$$

若另行把原點搬到重心，必須依 $\boldsymbol M_{\mathrm{new}}=\boldsymbol M_{\mathrm{old}}-\boldsymbol r_{\mathrm{new/old}}\times\boldsymbol F$ 轉換力矩；尤其不能把地面原點的 $C_{PM}$ 當成重心原點的係數。

## 6. 代入範例與適用邊界

**自行示例：** $\rho=1.20\ \mathrm{kg/m^3}$、$V=40\ \mathrm{m/s}$、$A=1.8\ \mathrm{m^2}$，則 $q=960\ \mathrm{Pa}$。若 $C_L=-1.0$、$C_{PM}=0.10$，得到總升力 $-1{,}728\ \mathrm N$，前後升力分別為 $-691.2$ 與 $-1{,}036.8\ \mathrm N$，即對應大小的向下負載。

固定係數且空氣密度不變時，速度加倍使力增加為四倍，阻力功率 $P_D=DV$ 增加為八倍。實車高度、姿態或流動分離改變後，係數不一定維持固定；應接續 Chapter 15 的空力圖譜處理。
