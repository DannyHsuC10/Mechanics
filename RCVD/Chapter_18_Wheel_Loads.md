---
layout: base
---

# Chapter 18: Wheel Loads (輪胎動態垂直負載精確計算)

> 來源：RCVD 原書 PDF，書頁 665–708（PDF 第 696–739 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 定義、單位與模型層級（pp. 665–666）

本章以車輛自由體與側傾剛度計算四輪負載。$W$ 為重量（力），不是 kg 質量；$A_x=a_x/g,A_y=a_y/g$ 是以 g 為單位的加速度。$a,b$ 為重心至前、後軸距離，$\ell=a+b$；$t_F,t_R$ 為輪距，$h$ 為總重心高度。

車輪編號依原書：1 左前、2 右前、3 左後、4 右後。所有 $W_i$ 都是正的垂直負載大小。負載轉移 $\Delta W$ 表示某輪增加、對側減少的量，不是兩輪差值的全量。

## 2. 四角秤重求水平重心（pp. 667–668）

$$
W=\sum_{i=1}^4W_i,
\qquad W_F=W_1+W_2,
\qquad W_R=W_3+W_4,
$$

$$
b=\frac{W_F\ell}{W},\qquad a=\ell-b=\frac{W_R\ell}{W}.
$$

以車身中線為 $y=0$、向右為正，可把原書左右輪距不等的力矩式整理成：

$$
\boxed{y_{CG}=\frac{(W_2-W_1)t_F+(W_4-W_3)t_R}{2W}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-025"
  data-expression="((W_2-W_1)*t_F+(W_4-W_3)*t_R)/(2*(W_1+W_2+W_3+W_4))"
  data-inputs="W_2:right front wheel load N,W_1:left front wheel load N,t_F:front track m,W_4:right rear wheel load N,W_3:left rear wheel load N,t_R:rear track m"
  data-result="y_CG"
  data-unit="m"
  data-constants=""
  data-note="Computes total W from all four measured wheel loads. Positive y_CG points right. Use level-ground static measurements and a positive total weight.">
</div>

若輪距相同 $t$：

$$
\boxed{y_{CG}=t\left(\frac{W_2+W_4}{W}-\frac12\right).}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-026"
  data-expression="t*((W_2+W_4)/W-0.5)"
  data-inputs="t:common front and rear track m,W_2:right front load N,W_4:right rear load N,W:total four-wheel weight N"
  data-result="y_CG"
  data-unit="m"
  data-constants=""
  data-note="Only for equal front and rear track widths. W includes all four wheel loads, not just the right side; positive offset points right.">
</div>

反過來只知道 $W,a,y_{CG}$ 並不能唯一求出四輪角重，還少一個對角預載／底盤相容條件。後續簡化式若假設左右按比例分配，會特別注明。

## 3. 抬高後軸求重心高度（pp. 669–671）

鎖住懸吊行程、抬高後軸，使前後輪心連線與水平形成角 $\theta$。前軸重量由水平時 $W_{F0}$ 變成 $W_{F\theta}$，則重心相對輪心連線高度：

$$
h_1=\frac{W_{F\theta}\ell-Wb}{W\tan\theta}
=\frac{(W_{F\theta}-W_{F0})\ell}{W\tan\theta}.
$$

若前後受載半徑 $R_{LF},R_{LR}$ 不同：

$$
R_{LCG}=R_{LF}\frac b\ell+R_{LR}\frac a\ell,
\qquad h=R_{LCG}+h_1.
$$

半徑相同時 $h=R_L+h_1$。測試前須控制輪胎變形、燃油流動與秤面；$\theta$ 很小時分母小，重量誤差會被放大，原書建議多個抬升角度比較。

## 4. 簧上質量的重心（pp. 671–673）

$$
W_s=W-\sum_iW_{ui},
\qquad W_{uF}=W_{u1}+W_{u2},
\qquad W_{uR}=W_{u3}+W_{u4},
$$

$$
b_s=\frac{Wb-W_{uF}\ell}{W_s},
\qquad a_s=\ell-b_s,
$$

$$
y_s=\frac{Wy_{CG}-\sum_iW_{ui}y_{ui}}{W_s},
\qquad h_s=\frac{Wh-\sum_iW_{ui}h_{ui}}{W_s}.
$$

後兩式是原書分量力矩平衡的向量化整理，可直接處理不同輪距與左右簧下重量不等。簧下重心高度可先用輪心高度近似，但重型整體後橋須依實際部件分布評估。

## 5. 底盤扭轉剛度量測（pp. 674–677）

$$
K_c=\frac{dT}{d\phi}\simeq\frac{\Delta T}{\Delta\phi}.
$$

若兩個量表相距 $s$，垂直讀值差 $\Delta z$，小角度近似：

$$
\phi[\mathrm{rad}]\simeq\frac{\Delta z}{s},
\qquad \phi[\mathrm{deg}]\simeq57.3\frac{\Delta z}{s}.
$$

原書例 $\Delta z=0.050\ \mathrm{in}$、$s=45\ \mathrm{in}$，得約 $0.064^\circ$。沿底盤不同截面量測能找出局部柔弱位置，而不只是得到一個總剛度數字。

## 6. 總側向負載轉移（pp. 678–679）

相同前後輪距且簡化成單軸：

$$
\Delta W=\frac{WA_yh}{t},
\qquad \frac{\Delta W}{W}=\frac{A_yh}{t}.
$$

若原本左右等載：

$$
W_{\mathrm{outside}}=\frac W2+\Delta W,
\qquad W_{\mathrm{inside}}=\frac W2-\Delta W.
$$

原書例 $A_y=1.2$、$h=1.5\ \mathrm{ft}$、$t=5.42\ \mathrm{ft}$，轉移約總重的 33.2%，左右約為 83.2% 與 16.8%。此式尚未決定前後軸各承受多少。

## 7. 含簧下質量與重力柔化的前後分配（pp. 680–684）

以原書中性側傾軸 NRA 定義幾何：簧上重心至該軸的垂直／近似法向距離 $h_2$，前後滾心高度 $z_{RF},z_{RR}$，簧下重心高度 $z_{WF},z_{WR}$，前後有效側傾剛度 $K_F,K_R$（力矩/rad）。原書 p. 682：

$$
\frac\phi{A_y}=-\frac{W_sh_2}{K_F+K_R-W_sh_2}.
$$

定義修正剛度：

$$
K_F'=K_F-\frac{(\ell-a_s)W_sh_2}{\ell},
\qquad K_R'=K_R-\frac{a_sW_sh_2}{\ell}.
$$

則前後每側增減量為：

$$
\frac{\Delta W_F}{A_y}
=\frac{W_s}{t_F}
\left[\frac{h_2K_F'}{K_F+K_R-W_sh_2}
+\frac{\ell-a_s}{\ell}z_{RF}\right]
+\frac{W_{uF}}{t_F}z_{WF},
$$

$$
\frac{\Delta W_R}{A_y}
=\frac{W_s}{t_R}
\left[\frac{h_2K_R'}{K_F+K_R-W_sh_2}
+\frac{a_s}{\ell}z_{RR}\right]
+\frac{W_{uR}}{t_R}z_{WR}.
$$

分母的 $-W_sh_2$ 代表重力造成的幾何柔化。分母接近零不是可放心外推的大側傾結果，而是小角度穩定模型已接近失效。

## 8. 簡化單質量分配（pp. 682–684）

將簧下重量併入整車、忽略重力柔化，令 $H=h-z_{RA}$：

$$
\phi\simeq-\frac{WA_yH}{K_F+K_R},
$$

$$
\Delta W_F=\frac{WA_y}{t_F}
\left(\frac{HK_F}{K_F+K_R}+\frac b\ell z_{RF}\right),
$$

$$
\Delta W_R=\frac{WA_y}{t_R}
\left(\frac{HK_R}{K_F+K_R}+\frac a\ell z_{RR}\right).
$$

原書比較兩種方法，簡化式在示例中低估負載轉移。兩個常用比例為：

$$
\mathrm{FRRD}=\frac{K_F}{K_F+K_R},
\qquad \mathrm{FLLTD}=\frac{\Delta W_F}{\Delta W_F+\Delta W_R}.
$$

它們不同，是因為幾何及簧下項不按防傾剛度比例分配。

## 9. 縱向加速與制動（pp. 684–685）

$$
\Delta W_x=\frac{Wh}{\ell}A_x,
\qquad W_F'=W_F-\Delta W_x,
\qquad W_R'=W_R+\Delta W_x.
$$

$A_x>0$ 為加速，$A_x<0$ 為制動。Anti-dive 或 anti-squat 改變力經彈簧或連桿的傳遞方式，不會在相同 $h$ 和加速度下消除整車力矩平衡所需的負載轉移。

## 10. 傾斜彎道 banking（pp. 685–690；Eqs. 18.1–18.5）

原書以右轉為正，$R$ 是水平投影半徑，bank 角 $\alpha$ 隨方向帶號：

$$
A_\alpha=\frac{V^2}{Rg},
\qquad A_y=A_\alpha\cos\alpha-\sin\alpha,
$$

$$
W'=W(A_\alpha\sin\alpha+\cos\alpha),
\qquad F_y^{\mathrm{inertia+gravity}}=-WA_y.
$$

有效前後基礎負載為 $W_F'=W'b/\ell,W_R'=W'a/\ell$。負載轉移使用上一節簡化式，但 **$WA_y$ 保留原重量 $W$**，不能再用 $W'A_y$ 重複計入 banking。

$$
W_{Fo}=\frac{W_F'}2+\Delta W_F,
\quad W_{Fi}=\frac{W_F'}2-\Delta W_F,
\quad W_{Ro}=\frac{W_R'}2+\Delta W_R,
\quad W_{Ri}=\frac{W_R'}2-\Delta W_R.
$$

這裡需配合方向識別外內輪。若 $A_\alpha\cos\alpha<\sin\alpha$，負載轉移會反向。**推導：** 無需橫向輪胎力的中性速度滿足 $V_{\mathrm{neutral}}=\sqrt{Rg\tan\alpha}$，只在 $R\tan\alpha>0$ 且幾何定義一致時有實數解。

## 11. 坡度、坡頂與谷底（pp. 690–694）

上坡角 $\theta>0$，沿坡縱向加速度為 $A_xg$：

$$
W_F'=W\frac b\ell\cos\theta-W\frac h\ell(A_x+\sin\theta),
$$

$$
W_R'=W\frac a\ell\cos\theta+W\frac h\ell(A_x+\sin\theta).
$$

相對平地靜態負載的改變：

$$
\Delta W_F=W\frac b\ell(\cos\theta-1)-W\frac h\ell(A_x+\sin\theta),
$$

$$
\boxed{\Delta W_R=W\frac a\ell(\cos\theta-1)+W\frac h\ell(A_x+\sin\theta).}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-027"
  data-expression="W*a/ell*(cos(theta)-1)+W*h/ell*(A_x+sin(theta))"
  data-inputs="W:vehicle weight N,a:front axle to CG m,ell:wheelbase m,theta:uphill slope angle rad,h:CG height m,A_x:along-slope acceleration in g"
  data-result="delta_W_R"
  data-unit="N"
  data-constants=""
  data-note="Change of rear axle load relative to flat static load. theta &gt; 0 is uphill; A_x is acceleration divided by g. This is not the final rear load.">
</div>

若路面有垂直曲率半徑 $R_v$，以 $\epsilon=-1$ 表坡頂、$\epsilon=+1$ 表谷底，原書兩組式可合併為：

$$
\Delta W_F=W\frac b\ell
\left(\cos\theta+\epsilon\frac{V^2}{gR_v}-1\right)
-W\frac h\ell(A_x+\sin\theta),
$$

$$
\boxed{\Delta W_R=W\frac a\ell
\left(\cos\theta+\epsilon\frac{V^2}{gR_v}-1\right)
+W\frac h\ell(A_x+\sin\theta).}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-028"
  data-expression="W*a/ell*(cos(theta)+epsilon*V^2/(g*R_v)-1)+W*h/ell*(A_x+sin(theta))"
  data-inputs="W:vehicle weight N,a:front axle to CG m,ell:wheelbase m,theta:uphill slope angle rad,epsilon:crest -1 or valley +1,V:speed m/s,g:gravity m/s^2,R_v:positive vertical curve radius m,h:CG height m,A_x:along-slope acceleration in g"
  data-result="delta_W_R"
  data-unit="N"
  data-constants=""
  data-note="Use epsilon = -1 at a crest or +1 in a valley. R_v &gt; 0 and angles are radians. Add to flat static rear load; a negative final wheel load means loss of contact.">
</div>

這使用前後軸法向近似平行的大曲率半徑假設。算出負輪載時表示離地，不能繼續用四輪接地模型。

## 12. 空力升力、俯仰與側傾力矩（pp. 694–697）

$$
L_a=C_LqA,\qquad PM=C_{PM}qA\ell,\qquad RM=C_{RM}qA\ell,
$$

$$
L_F=qA(\tfrac12C_L+C_{PM}),
\qquad L_R=qA(\tfrac12C_L-C_{PM}).
$$

正升力減少輪載，正 $RM$ 增加右輪負載。按前後有效側傾剛度分配：

$$
\begin{aligned}
\Delta W_1&=-L_F/2-\frac{K_F}{K_F+K_R}\frac{RM}{t_F},\\
\Delta W_2&=-L_F/2+\frac{K_F}{K_F+K_R}\frac{RM}{t_F},\\
\Delta W_3&=-L_R/2-\frac{K_R}{K_F+K_R}\frac{RM}{t_R},\\
\Delta W_4&=-L_R/2+\frac{K_R}{K_F+K_R}\frac{RM}{t_R}.
\end{aligned}
$$

此處 $PM$ 必須使用原書地面、軸距中點原點；原點若不同，先換算，避免重複計入阻力作用高度的力矩。

## 13. 引擎／傳動軸扭矩反作用（pp. 697–700；Eqs. 18.8–18.12）

本節適用引擎與整體驅動後橋之間的傳動軸扭矩反作用。前有效側傾剛度 $K_F$、後輪胎角剛度 $K_T=k_tt_R^2/2$、後懸吊對車軸的剛度 $K_S=K_B+k_st_s^2/2$；車身側傾 $\phi_C$、後橋側傾 $\phi_A$：

$$
-K_T\phi_A+K_S(\phi_C-\phi_A)-T_D=0,
$$

$$
-K_F\phi_C-K_S(\phi_C-\phi_A)+T_D=0.
$$

解得：

$$
\phi_C=\frac{T_D}{K_F+K_S+K_FK_S/K_T},
\qquad \phi_A=\frac{-T_D+K_S\phi_C}{K_T+K_S}.
$$

按正右側下沉的角度與原書數值例的號誌，四輪變化是：

$$
\Delta W_2=\frac{K_F\phi_C}{t_F},\quad
\Delta W_1=-\Delta W_2,\quad
\Delta W_3=-\frac{K_T\phi_A}{t_R},\quad
\Delta W_4=-\Delta W_3.
$$

原書 p. 699 的左後輪文字式少了與其 p. 700 數值代入一致的負號；這裡按力矩方向與數值例寫成 $-K_T\phi_A/t_R$，正 $T_D$ 時左後與右前增載。差速器固定在車身的獨立後懸吊不具有相同的整體後橋對角頂升機制。

## 14. 橫向偏置重心與傾斜彎道（pp. 701–707）

原書單質量偏置模型令 $y''>0$ 向右，定義：

$$
\gamma_F=\frac{2y''}{t_F},\quad\gamma_R=\frac{2y''}{t_R},
\quad C_{X1}=\frac{1-\gamma_F}{2},\quad C_{X2}=\frac{1+\gamma_F}{2},
$$

$$
C_{X3}=\frac{1-\gamma_R}{2},\qquad C_{X4}=\frac{1+\gamma_R}{2}.
$$

其縱向轉移分配：

$$
\Delta W_{1,2}=-C_{X1,2}\frac{Wh}{\ell}A_x,
\qquad \Delta W_{3,4}=+C_{X3,4}\frac{Wh}{\ell}A_x.
$$

使用 banking 的 $A_y,W'$，令 $D_\phi=K_F+K_R-WA_yy''-W'H$：

$$
\phi=\frac{-WA_yH+(W'-W)y''}{D_\phi},
$$

$$
\Delta W_F=\frac{K_F[WA_yH-(W'-W)y'']}{t_FD_\phi}
+WA_y\frac b\ell\frac{z_{RF}}{t_F},
$$

$$
\boxed{\Delta W_R=\frac{K_R[WA_yH-(W'-W)y'']}{t_RD_\phi}
+WA_y\frac a\ell\frac{z_{RR}}{t_R}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-029"
  data-expression="K_R*(W*A_y*H-(W_prime-W)*y_offset)/(t_R*(K_F+K_R-W*A_y*y_offset-W_prime*H))+W*A_y*a/ell*z_RR/t_R"
  data-inputs="K_R:rear roll stiffness N m/rad,W:vehicle weight N,A_y:banking-adjusted lateral acceleration in g,H:CG height above roll axis m,W_prime:banking-adjusted normal load N,y_offset:rightward CG offset m,t_R:rear track m,K_F:front roll stiffness N m/rad,a:front axle to CG m,ell:wheelbase m,z_RR:rear roll center height m"
  data-result="delta_W_R"
  data-unit="N"
  data-constants=""
  data-note="Computes D_phi from the definition above; it must be nonzero. Use the banking-adjusted A_y and W_prime. Positive transfer is right to left in this section. This is the single-mass offset-CG model.">
</div>

以上正值定義為右向左轉移。有效基礎輪載用：

$$
W_{1,2}'=C_{X1,2}W'\frac b\ell,
\qquad W_{3,4}'=C_{X3,4}W'\frac a\ell.
$$

這是原書的比例分配假設；如果實測存在額外 wedge／對角預載，須保留其偏差，不能用上述式子抹平實際四角秤重。

## 15. 加總與核對（pp. 707–708）

$$
\boxed{W_i^{\mathrm{final}}=W_i^{\mathrm{base}}
+\Delta W_i^{\mathrm{lateral}}
+\Delta W_i^{\mathrm{longitudinal}}
+\Delta W_i^{\mathrm{aero}}
+\Delta W_i^{\mathrm{torque}}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-030"
  data-expression="W_base+dW_lateral+dW_longitudinal+dW_aero+dW_torque"
  data-inputs="W_base:base load for this wheel N,dW_lateral:signed lateral increment N,dW_longitudinal:signed longitudinal increment N,dW_aero:signed aero increment N,dW_torque:signed torque increment N"
  data-result="W_final"
  data-unit="N"
  data-constants=""
  data-note="Run separately for each wheel and enter zero for unused increments. All increments must use compatible models and signs; do not count banking or slope corrections twice. Negative final load invalidates the all-wheels-contact model.">
</div>

只在各子模型的線性化與幾何假設相容時疊加。Banking 或坡度後的 $W_i^{\mathrm{base}}$ 已改變，不能再重複加一次「靜態重量修正」。最後核對總負載、前後俯仰力矩、左右側傾力矩與每輪非負；有輪離地、止擋接觸或顯著幾何移動時，須改用新的接觸／剛度條件重新求解。
