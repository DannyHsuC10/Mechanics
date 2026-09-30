---
layout: base
---

# Chapter 10: Race Car Design (賽車設計流程與工程螺旋)

> 來源：RCVD 原書 PDF，書頁 367–372（PDF 第 398–403 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 本章內容與計算定位（pp. 367–372）

原書本章是設計流程章，重點是限制、整體配置、詳細設計、製作與測試之間的反覆修正，**沒有一套獨立編號的車輛設計公式**。以下將書中要求量化的項目整理成計算工作表；公式明確標示為跨章引用或基礎力學推導，不把自行補充內容冒稱為本章原式。

## 2. 約束與規格：先定義什麼是可行（pp. 368–369）

原書先列競賽規範、資源、車手空間與安全、輪胎選擇及可調機構。可以把規格表寫成下列**設計記錄形式**：

$$
\boldsymbol p=(m,a,b,h,t_F,t_R,I_z,C_DA,C_LA,\ldots),
\qquad g_j(\boldsymbol p)\le0.
$$

每個 $g_j$ 是具體限制，例如質量、尺寸、行程或結構應力裕度；此處不替任何賽事指定限值。不要先選單一「最佳」彈簧或輪胎，再忽略包裝、車手與調整空間。

## 3. 質量預算與重心配置（跨章：Chapter 18）

將引擎、傳動、車手、油液與底盤視為具有重量及位置的部件，計算整車質量與重心：

$$
m=\sum_i m_i,
\qquad \boldsymbol r_{CG}=\frac{\sum_i m_i\boldsymbol r_i}{m}.
$$

若以從前軸向後量的部件位置 $x_i$：

$$
a=\frac{\sum_i m_ix_i}{m},
\qquad b=\ell-a,
\qquad W_F=mg\frac b\ell,
\qquad W_R=mg\frac a\ell.
$$

重心高度 $h=\sum_i m_ih_i/m$，不是以前後軸反力除以側傾剛度得到。若在 $\boldsymbol r_b$ 加入配重 $m_b$，則：

$$
\boxed{\boldsymbol r'_{CG}=\frac{m\boldsymbol r_{CG}+m_b\boldsymbol r_b}{m+m_b}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-013"
  data-expression="(m*r_CG+m_b*r_b)/(m+m_b)"
  data-inputs="m:original vehicle mass kg,r_CG:original CG coordinate m,m_b:added ballast mass kg,r_b:ballast coordinate m"
  data-result="r_CG_new (one coordinate)"
  data-unit="m"
  data-constants=""
  data-note="Evaluate the vector formula component by component: run once for x, once for y and once for z using the same coordinate origin. m + m_b must be positive. Signed m_b can model removed mass at its known location.">
</div>

燃油消耗也用同一公式逐個油量狀態計算，不能只核對滿油重心。

## 4. 慣量預算與集中配置（基礎力學整理）

$$
I_z=\sum_i\left(I_{z,i}^{CG}+m_i[(x_i-x_{CG})^2+(y_i-y_{CG})^2]\right),
\qquad k_z=\sqrt{\frac{I_z}{m}}.
$$

同樣總質量與前後配重，不代表相同偏航慣量。把質量移遠離重心會按距離平方增加 $I_z$，因此不能只靠前後秤重判斷轉向瞬態。實際改善仍須配合輪胎剛度及 Chapter 6 的動態分析。

## 5. 輪胎、重心與輪距（跨章：Chapters 2、7、18）

$$
\Delta W_{\mathrm{lat}}=\frac{m a_yh}{t},
\qquad \Delta W_{\mathrm{long}}=\frac{m a_xh}{\ell}.
$$

此處 $\Delta W$ 是從一側／一軸轉移到另一側／軸的力，$a_x,a_y$ 使用 m/s²。若使用 $g$ 值，改寫為 $WA_yh/t$ 與 $WA_xh/\ell$。這兩種寫法不要再次混乘或除以 $g$。

前後負載轉移分配要加上側傾中心、簧下質量及側傾剛度；單一平均輪距式只適合整體初估。先由輪胎資料建立每輪能力，再決定車身配置是否能利用這些能力。

## 6. 空力、功率與速度預算（跨章：Chapters 3、15、20）

$$
D=\frac12\rho(C_DA)V^2,
\qquad D_f=-\frac12\rho(C_LA)V^2,
\qquad P_D=DV.
$$

在平路穩定最高速的初估：

$$
P_w=(D+D_r)V.
$$

若先忽略其他阻力且輪端功率近似固定，可得到：

$$
V_{\max}\simeq\left(\frac{2P_w}{\rho C_DA}\right)^{1/3}.
$$

這是初估而非整車設計定律，還須檢查齒比、引擎轉速與輪胎速度限制。下壓力增加的過彎利益與阻力功率成本應放進圈速比較，而不是只追求最大的 $|C_L|$。

## 7. 詳細設計與可調範圍（pp. 371–372；跨章引用）

本章要求在詳細設計之前固定大致配置，再核對結構、懸吊、轉向、冷卻與煞車等系統。常用的尺寸反推關係包括：

$$
k_r=(2\pi f_n)^2m_s,
\qquad k_w=\frac{k_rk_t}{k_t-k_r},
\qquad k_s\simeq\frac{k_w}{IR^2}
\quad\text{（Chapter 16）},
$$

$$
K_{\mathrm{torsion}}=\frac{T}{\Delta\phi},
\qquad C_{\mathrm{torsion}}=\frac1{K_{\mathrm{torsion}}}
\quad\text{（Chapters 18、23）}.
$$

原書沒有在此章規定「底盤剛度必須至少是懸吊的十倍」；這類倍數不可當作普遍合格標準。應以預期輪載、轉角及外傾變形，檢查底盤柔度是否足以改變調校結果。

## 8. 用圈速和試驗回饋完成迭代

依 Chapter 8 的方法，將候選配置的速度曲線積分：

$$
t_{\mathrm{lap}}(\boldsymbol p)=\int_0^{s_{\mathrm{lap}}}\frac{ds}{V(s;\boldsymbol p)}.
$$

**整理推導：** 比較參數敏感度時可以有限差分：

$$
\frac{\partial t_{\mathrm{lap}}}{\partial p_j}
\simeq\frac{t_{\mathrm{lap}}(p_j+\Delta p_j)-t_{\mathrm{lap}}(p_j-\Delta p_j)}{2\Delta p_j}.
$$

但這只在同樣輪胎、賽道與約束下有意義。設計工作表應保存每項輸入的來源、預估誤差、可調範圍，以及製成後的量測值。原書的設計流程是反覆修正：初步配置 → 力學檢查 → 包裝與結構 → 製作 → Chapter 11 的測試 → 回修模型。
