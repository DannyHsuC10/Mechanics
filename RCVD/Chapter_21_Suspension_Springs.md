---
layout: base
---

# Chapter 21: Suspension Springs (懸吊彈簧類型與設計計算)

> 來源：RCVD 原書 PDF，書頁 755–780（PDF 第 786–811 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 本章計算的共同規則（pp. 755–756）

本章包括扭力桿、螺旋彈簧、串並聯、葉片彈簧及疲勞。以下把原書 $f$ 的應力記號改用 $\tau$（剪應力）或 $\sigma$（彎曲應力），把直線彈簧率 $S$ 寫成 $k$；等價關係與原書方程號均保留。長度與力須全程一致；$G$ 為剪切模數，$E$ 為楊氏模數。

## 2. 扭力桿最大應力（pp. 756–757；Eqs. 21.1–21.5）

外力 $F$ 垂直作用於臂長 $R$，扭矩 $T=FR$。實心圓桿直徑 $d$ 與正方形桿邊長 $d$：

$$
T_{\mathrm{round}}=\frac{\pi d^3\tau_{\max}}{16},
\qquad T_{\mathrm{square}}=\frac{d^3\tau_{\max}}{4.8},
$$

$$
\tau_{\max,\mathrm{round}}=\frac{16FR}{\pi d^3},
\qquad
\tau_{\max,\mathrm{square}}=\frac{4.8FR}{d^3}.
$$

應力與扭矩成正比，與截面尺寸立方成反比；在相同扭矩下不直接由桿長決定。每單位扭矩應力為：

$$
\frac\tau T=\frac{16}{\pi d^3}\quad\text{（圓）},
\qquad \frac\tau T=\frac{4.8}{d^3}\quad\text{（方）}.
$$

方形截面不能使用圓桿的極慣性矩公式代替其扭轉常數。

## 3. 扭角、角剛度與臂端直線率（pp. 757–759；Eqs. 21.6–21.12）

$$
\theta_{\mathrm{round}}=\frac{32TL}{\pi d^4G},
\qquad \theta_{\mathrm{square}}=\frac{7.11TL}{d^4G},
$$

$$
k_\theta=\frac T\theta,\qquad x\simeq R\theta,
\qquad k=\frac Fx\simeq\frac{k_\theta}{R^2}.
$$

因此原書直線率：

$$
k_{\mathrm{round}}=\frac{\pi Gd^4}{32R^2L}
\simeq\frac{0.098Gd^4}{R^2L},
\qquad k_{\mathrm{square}}\simeq\frac{0.141Gd^4}{R^2L}.
$$

在相同 $G,R,L$ 下：

$$
\frac{k_c}{k_s}\simeq0.695\left(\frac{d_c}{d_s}\right)^4.
$$

若兩截面面積相同，$\pi d_c^2/4=d_s^2$，原書約得 $k_c/k_s=1.127$；圓截面約硬 13%，且同面積下最大剪應力較低。

**延伸到空心圓桿的基礎力學式：**

$$
J=\frac\pi{32}(d_o^4-d_i^4),
\qquad k_\theta=\frac{GJ}{L},
\qquad \tau_{\max}=\frac{Td_o}{2J}.
$$

此式標為延伸，不是把原書實心桿式偷偷改成空心桿；花鍵根部、圓角及加工缺口的集中應力仍需另外處理。

## 4. 扭力桿設計反算（pp. 761–762）

先由目標頻率求輪端剛度，再由應力與剛度聯立定尺寸：

$$
k_w=m_w(2\pi f_n)^2,
\qquad d\ge\left(\frac{16F_{\max}R}{\pi\tau_{\mathrm{allow}}}\right)^{1/3},
$$

$$
\boxed{L=\frac{\pi Gd^4}{32R^2k_w}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-033"
  data-expression="pi*G*d^4/(32*R^2*k_w)"
  data-inputs="G:shear modulus Pa,d:solid bar diameter m,R:lever arm m,k_w:wheel rate N/m"
  data-result="L"
  data-unit="m"
  data-constants="pi=3.141592653589793"
  data-note="Solid torsion bar with the wheel acting directly at the lever end. Use SI units and positive G, d, R and k_w; convert linkage motion ratio before applying this equation.">
</div>

最後一式假設輪端直接作用於臂端；若經過連桿，須先依 Chapter 16 換算。原書取 $R=5$ in 的示例得到約 $d=0.386$ in、$L=10.41$ in，但那是其 225 lbf、2 Hz 與指定應力的結果，不是可直接移植的尺寸。

## 5. 螺旋壓縮彈簧（pp. 762–765；Eqs. 21.13–21.15）

線徑 $d$、平均圈徑 $D$、有效圈數 $N$，外力 $F$：

$$
\tau_{\mathrm{uncorrected}}=\frac{8DF}{\pi d^3}
\simeq\frac{2.55DF}{d^3},
$$

$$
k_s=\frac{Gd^4}{8D^3N},
\qquad x=\frac{F}{k_s}=\frac{8FD^3N}{Gd^4}.
$$

原書比較相同力與未修正應力的螺旋彈簧與扭力桿，得到 Eq. (21.14)：

$$
D\simeq1.99\left(\frac{d_c}{d_t}\right)^3R.
$$

其中 $d_c,d_t$ 分別是螺旋線徑與扭力桿直徑。$D$ 是**平均圈徑**，不是外徑；$N$ 是有效圈數，不是總圈數。原書指出端圈形式會改變有效圈數，因此最好實測工作區間刚度。

## 6. Wahl 修正、圈數與安裝負載（pp. 763–772）

原書要求將未修正應力乘上 Wahl factor，以考慮線材曲率等效應：

$$
\boxed{\tau_{\mathrm{corrected}}=K_W\frac{8DF}{\pi d^3}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-034"
  data-expression="K_W*8*D*F/(pi*d^3)"
  data-inputs="K_W:Wahl correction factor,D:mean coil diameter m,F:axial spring force N,d:wire diameter m"
  data-result="tau_corrected"
  data-unit="Pa"
  data-constants="pi=3.141592653589793"
  data-note="Supply K_W from the Wahl-factor equation above. D is mean coil diameter, not outer diameter. Lengths are meters and the output is pascals; divide by 1e6 for MPa.">
</div>

原書以圖／參考資料給出因子，例如 $D/d=5$ 時約 1.3，$D/d=12$ 時約 1.1；不能省略後拿未修正值直接對照材料極限。本筆記不另假造書中未列的材料疲勞係數。

設計反算與安裝比關係：

$$
N=\frac{Gd^4}{8D^3k_s},
\qquad F_s=\frac{F_w}{IR},
\qquad k_s\simeq\frac{k_w}{IR^2}.
$$

如果 $IR=0.5$，彈簧靜態力是輪端的兩倍，剛度是輪端的四倍；不能只換算剛度而忘記應力計算的彈簧實際力。

有效圈數會在逐步 coil bind 時減少，局部率 $k_s=dF/dx$ 因而上升。工作長度需避開未預期的完全壓實，並检查柱狀失穩、導向與端座條件。

## 7. 彈簧串聯、並聯與壓實轉折（pp. 766–770；Eqs. 21.16–21.18）

串聯時兩彈簧承受相同力，位移相加：

$$
x=x_1+x_2=F\left(\frac1{k_1}+\frac1{k_2}\right),
\qquad k_{\mathrm{series}}=\frac{k_1k_2}{k_1+k_2},
$$

$$
\frac1{k_{\mathrm{series}}}=\sum_i\frac1{k_i}.
$$

若一支彈簧壓實，該支後續的增量柔度視為零，剩餘彈簧決定增量剛度；力—位移曲線需保留轉折點以前已累積的位移，不能從新斜率重新從原點起算。

並聯且承受相同位移時：

$$
F=\sum_iF_i=x\sum_i k_i,
\qquad k_{\mathrm{parallel}}=\sum_i k_i,
\qquad x=\frac{F}{k_1+k_2}.
$$

柔軟的彈簧座、車架或橡膠隔離墊常相當於串聯柔度，會讓安裝後剛度低於彈簧本體剛度。兩個不同位置的彈簧若車身可傾斜，並不總是「同位移並聯」。

## 8. 葉片彈簧（pp. 772–775；Eqs. 21.19–21.22）

原書先用矩形等截面懸臂，長 $l$、寬 $b$、厚 $t$、端力 $F$：

$$
\sigma_{\max}=\frac{6lF}{bt^2},
\qquad k=\frac Fx=\frac{Ebt^3}{4l^3}.
$$

單片拋物線車用葉簧為兩側各長 $l$、中央總力 $2F$、中央厚度 $t_0$，原書給出：

$$
\sigma_{\max}=\frac{6lF}{bt_0^2},
\qquad k=\frac{2F}{x}=\frac{Ebt_0^3}{4l^3}.
$$

不能因外觀是兩支懸臂就忘記拋物線厚度分布；上述 $F$ 是單側反力，中央總載荷為 $2F$。

對 $n$ 片相同厚寬、端部有 $n'$ 片的原書漸變疊片模型：

$$
\sigma_{\max}=\frac{6lF}{nbt^2},
\qquad k=\frac{2F}{x}
=\frac{(2+n'/n)Enbt^3}{6l^3}.
$$

這是原書圖 21.9 的特定葉片配置。片間摩擦、夾持、吊耳角度與葉片的橫向／扭轉變形，會使實際安裝曲線不同。

## 9. 材料、預壓與疲勞（pp. 759–760、764–765、775–779）

原書材料表與疲勞圖對應特定鋼材、處理與試驗，不可把其中最大應力當成所有彈簧的允許值。比較疲勞工況可先整理：

$$
\sigma_m=\frac{\sigma_{\max}+\sigma_{\min}}2,
\qquad \sigma_a=\frac{\sigma_{\max}-\sigma_{\min}}2,
\qquad R_\sigma=\frac{\sigma_{\min}}{\sigma_{\max}}.
$$

以上平均／交變應力式是資料整理，壽命仍須用相應 S-N／原書疲勞圖或製造商資料，不能由靜態剛度推得。

$$
1\ \mathrm{MPa}\simeq145.04\ \mathrm{psi},
\qquad G=\frac{E}{2(1+\nu)}\quad\text{（等向線彈性材料）}.
$$

預壓改變工作點與最小應力；在線性彈簧中，預壓本身不改變 $dF/dx$。若因預壓導致部分圈已接觸或機構比改變，則系統有效剛度才會改變。
