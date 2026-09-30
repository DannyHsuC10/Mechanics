---
layout: base
---

# Chapter 5: Simplified Steady-State Stability and Control (簡化穩態穩定性與控制)

> 來源：RCVD 原書 PDF，書頁 123–230（PDF 第 154–261 頁）。以下頁碼均指**書上印刷頁碼**；PDF 頁碼 = 書頁 + 31。
>
> 整理方式：以原書關係式為主，統一成可代入的 LaTeX，並用中文解釋。標為「整理推導」的式子是從書中模型重寫或延伸，並非原書逐字公式。圖表提供的輪胎、空力及材料數據仍須由相應圖表或實測取得，不能用通用常數替代。

## 1. 模型假設、參數與符號（pp. 123–151）

兩自由度自行車模型把同一軸兩輪合併，假設平路、固定前進速度、小側滑角、小轉角、線性輪胎，忽略側傾與左右負載轉移。前後軸至重心距離 $a,b$，軸距 $\ell=a+b$，質量 $m$，重量 $W=mg$，偏航慣量 $I_z$。

**本章依原書使用帶符號剛度 $C_F,C_R<0$。** 若資料提供正的側偏剛度，先令 $C_F=-C_{\alpha F}$、$C_R=-C_{\alpha R}$。這些是整個車軸的剛度，不是單條輪胎值。

## 2. 輪胎幾何、總側力與偏航力矩（pp. 144–150）

原書 Eqs. (5.1)–(5.6) 的基本關係為：

$$
I_z\dot r=N,\qquad ma_y=Y,
\qquad a_y=V(r+\dot\beta),
$$

$$
\alpha_F=\beta+\frac{ar}{V}-\delta,
\qquad \alpha_R=\beta-\frac{br}{V},
\qquad Y_F=C_F\alpha_F,\quad Y_R=C_R\alpha_R,
$$

$$
\boxed{Y=(C_F+C_R)\beta+\frac{aC_F-bC_R}{V}r-C_F\delta,}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-005"
  data-expression="(C_F+C_R)*beta+(a*C_F-b*C_R)/V*r-C_F*delta"
  data-inputs="C_F:signed front axle stiffness N/rad,C_R:signed rear axle stiffness N/rad,beta:body sideslip rad,a:CG to front axle m,b:CG to rear axle m,V:speed m/s,r:yaw rate rad/s,delta:road wheel steer rad"
  data-result="Y"
  data-unit="N"
  data-constants=""
  data-note="Use negative signed axle stiffnesses C_F and C_R as defined in Chapter 5; angles are radians and V &gt; 0. This is a local linear tire model.">
</div>

$$
\boxed{N=(aC_F-bC_R)\beta+\frac{a^2C_F+b^2C_R}{V}r-aC_F\delta.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-006"
  data-expression="(a*C_F-b*C_R)*beta+(a^2*C_F+b^2*C_R)/V*r-a*C_F*delta"
  data-inputs="C_F:signed front axle stiffness N/rad,C_R:signed rear axle stiffness N/rad,beta:body sideslip rad,a:CG to front axle m,b:CG to rear axle m,V:speed m/s,r:yaw rate rad/s,delta:road wheel steer rad"
  data-result="N"
  data-unit="N m"
  data-constants=""
  data-note="Use negative signed axle stiffnesses C_F and C_R as defined in Chapter 5; angles are radians and V &gt; 0. This is a local linear tire model.">
</div>

線性輪胎只在實測曲線局部有效。前後外力與側滑角不宜直接套入輪胎飽和區。

## 3. 六個穩定性與控制導數（pp. 149–153）

原書 Eqs. (5.7)–(5.10) 將幾何與輪胎資訊收進局部偏導數：

$$
Y=Y_\beta\beta+Y_rr+Y_\delta\delta,
\qquad N=N_\beta\beta+N_rr+N_\delta\delta,
$$

$$
\begin{aligned}
Y_\beta&=C_F+C_R,&Y_r&=\frac{aC_F-bC_R}{V},&Y_\delta&=-C_F,\\
N_\beta&=aC_F-bC_R,&N_r&=\frac{a^2C_F+b^2C_R}{V},&N_\delta&=-aC_F.
\end{aligned}
$$

$$
mV(\dot\beta+r)=Y_\beta\beta+Y_rr+Y_\delta\delta,
\qquad I_z\dot r=N_\beta\beta+N_rr+N_\delta\delta.
$$

$Y_\beta$ 為側滑阻尼、$N_r$ 為偏航阻尼；本符號下兩者為負。$N_\delta>0$ 是轉向控制能力。$N_\beta$ 決定本模型的靜態方向穩定性，但不能只看它就斷言任意速度下的完整瞬態穩定性。

## 4. 穩態轉向響應（pp. 153–156；Eqs. 5.13–5.17）

令 $\dot\beta=\dot r=0$，定義：

$$
Q=N_\beta Y_r-N_\beta mV-Y_\beta N_r,
\qquad B=Y_\beta N_\delta-N_\beta Y_\delta.
$$

$$
\frac{1/R}{\delta}=\frac{B}{VQ},
\qquad \frac r\delta=\frac BQ,
\qquad \frac{a_y}{\delta}=\frac{VB}{Q},
$$

$$
\frac\beta\delta=\frac{Y_\delta N_r-N_\delta(Y_r-mV)}{Q}.
$$

這四種增益分別回答方向盤改變後，路徑彎曲多少、車頭轉多快、產生多少側向加速度，以及車身偏離路徑多少。使用方向盤角而非前輪角時，還須除以方向盤／路輪轉角比 $i_s$。

## 5. 外加側力與外加偏航力矩（pp. 155–160）

令 $F_e$ 是施於重心的外加側力，$M_e$ 是外加偏航力矩。原書 Eqs. (5.18)–(5.25) 可整合為下列同一解式：

$$
\boxed{\beta=\frac{N_r(Y_\delta\delta+F_e)-(Y_r-mV)(N_\delta\delta+M_e)}{Q},}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-007"
  data-expression="(N_r*(Y_delta*delta+F_e)-(Y_r-m*V)*(N_delta*delta+M_e))/(N_beta*Y_r-N_beta*m*V-Y_beta*N_r)"
  data-inputs="N_r:yaw damping derivative N m s/rad,Y_delta:steer force derivative N/rad,delta:road wheel steer rad,F_e:external lateral force N,Y_r:yaw rate force derivative N s/rad,m:vehicle mass kg,V:speed m/s,N_delta:steer moment derivative N m/rad,M_e:external yaw moment N m,N_beta:sideslip moment derivative N m/rad,Y_beta:sideslip force derivative N/rad"
  data-result="beta"
  data-unit="rad"
  data-constants=""
  data-note="Q is computed from the six signed stability derivatives using the definition above. Use SI units and radians; a zero Q has no unique steady solution. Set unused external force or moment to zero.">
</div>

$$
\boxed{r=\frac{Y_\beta(N_\delta\delta+M_e)-N_\beta(Y_\delta\delta+F_e)}{Q}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-008"
  data-expression="(Y_beta*(N_delta*delta+M_e)-N_beta*(Y_delta*delta+F_e))/(N_beta*Y_r-N_beta*m*V-Y_beta*N_r)"
  data-inputs="N_r:yaw damping derivative N m s/rad,Y_delta:steer force derivative N/rad,delta:road wheel steer rad,F_e:external lateral force N,Y_r:yaw rate force derivative N s/rad,m:vehicle mass kg,V:speed m/s,N_delta:steer moment derivative N m/rad,M_e:external yaw moment N m,N_beta:sideslip moment derivative N m/rad,Y_beta:sideslip force derivative N/rad"
  data-result="r"
  data-unit="rad/s"
  data-constants=""
  data-note="Q is computed from the six signed stability derivatives using the definition above. Use SI units and radians; a zero Q has no unique steady solution. Set unused external force or moment to zero.">
</div>

逐項展開的擾動增益為：

$$
\begin{aligned}
\frac r{F_e}&=-\frac{N_\beta}{Q},&
\frac{1/R}{F_e}&=-\frac{N_\beta}{VQ},&
\frac{a_y}{F_e}&=-\frac{VN_\beta}{Q},&
\frac\beta{F_e}&=\frac{N_r}{Q},\\
\frac r{M_e}&=\frac{Y_\beta}{Q},&
\frac{1/R}{M_e}&=\frac{Y_\beta}{VQ},&
\frac{a_y}{M_e}&=\frac{VY_\beta}{Q},&
\frac\beta{M_e}&=-\frac{Y_r-mV}{Q}.
\end{aligned}
$$

這裡每個比值指其餘輸入為零的單獨增益；線性範圍可疊加。側風若作用在重心以外，必須同時輸入 $F_e$ 和 $M_e=x_eF_e$。

中性轉向 $N_\beta=0$ 時，$Q=-Y_\beta N_r$，原書 Eqs. (5.26)–(5.37) 簡化為：

$$
\frac r\delta=-\frac{N_\delta}{N_r}=\frac V\ell,
\qquad \frac{1/R}{\delta}=\frac1\ell,
\qquad \frac{a_y}{\delta}=\frac{V^2}{\ell},
$$

$$
\frac\beta\delta=-\frac{Y_\delta}{Y_\beta}
+\frac{N_\delta(Y_r-mV)}{Y_\beta N_r},
\qquad \frac\beta{F_e}=-\frac1{Y_\beta},
\qquad \frac r{F_e}=0,
$$

$$
\frac r{M_e}=-\frac1{N_r},
\qquad \frac\beta{M_e}=\frac{Y_r-mV}{Y_\beta N_r}.
$$

所以施於重心的純側力可造成車身側滑，但在此中性模型的穩態不改變路徑曲率。

## 6. 轉向不足梯度與穩定因子（pp. 160–173）

原書穩定因子 $K$ 的單位是速度平方的倒數：

$$
K=\frac{mN_\beta}{\ell(N_\beta Y_\delta-Y_\beta N_\delta)}
=\frac m{\ell^2}\left(\frac b{C_{\alpha F}}-\frac a{C_{\alpha R}}\right).
$$

$$
\frac r\delta=\frac{V/\ell}{1+KV^2},
\qquad \delta=\frac\ell R(1+KV^2).
$$

為避免把三種「understeer coefficient」混用，本筆記另定義：

$$
K_a=K\ell\quad[\mathrm{rad/(m/s^2)}],
\qquad K_g=g\ell K\quad[\mathrm{rad/g}],
$$

$$
K_g=\frac{W_F}{C_{\alpha F}}-\frac{W_R}{C_{\alpha R}},
\quad W_F=W\frac b\ell,\quad W_R=W\frac a\ell,
\qquad \delta=\frac\ell R+K_g A_y.
$$

$K>0$ 為轉向不足、$K=0$ 為中性、$K<0$ 為轉向過度。角度為 rad；若要 deg/g，乘 $180/\pi$。

輪胎幾何亦給出原書 Eq. (5.50)：

$$
\delta=\frac\ell R-\alpha_F+\alpha_R,
\qquad -\alpha_F+\alpha_R=K\ell a_y.
$$

Bundorf 前、後側偏柔度（正剛度寫法）為：

$$
D_F=\frac{180}{\pi}\frac{W_F}{C_{\alpha F}},
\qquad D_R=\frac{180}{\pi}\frac{W_R}{C_{\alpha R}},
\qquad UG=D_F-D_R=\frac{180}{\pi}g\ell K.
$$

$D_F,D_R,UG$ 的單位都是 deg/g。真車的有效柔度還包括側傾轉向、外傾與順應性，因此不能只用裸輪胎剛度代表實車所有效應。

## 7. 中性轉向點、靜態裕度與阻尼中心（pp. 164–172、186–190）

中性轉向點距前軸 $d$，在該點施加側力不產生穩態偏航：

$$
\frac d\ell=\frac1\ell\left(a-\frac{N_\beta}{Y_\beta}\right)
=\frac{C_R}{C_F+C_R}
=\frac{C_{\alpha R}}{C_{\alpha F}+C_{\alpha R}}.
$$

$$
SM=\frac{d-a}{\ell}
=-\frac{N_\beta}{\ell Y_\beta}
=\frac{bC_{\alpha R}-aC_{\alpha F}}
{\ell(C_{\alpha F}+C_{\alpha R})}.
$$

$SM$ 無因次，不是長度。它為正時，中性轉向點在重心後方，本模型轉向不足。以正剛度表示 $K$ 與 $SM$ 的關係為：

$$
\boxed{K=\frac{m(C_{\alpha F}+C_{\alpha R})}{\ell C_{\alpha F}C_{\alpha R}}SM.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-009"
  data-expression="m*(C_alphaF+C_alphaR)/(ell*C_alphaF*C_alphaR)*SM"
  data-inputs="m:vehicle mass kg,C_alphaF:positive front axle stiffness N/rad,C_alphaR:positive rear axle stiffness N/rad,ell:wheelbase m,SM:static margin fraction"
  data-result="K"
  data-unit="s^2/m^2"
  data-constants=""
  data-note="Use positive axle stiffness magnitudes here. SM is a dimensionless fraction rather than a percentage; K is the coefficient in 1 + K*V^2.">
</div>

輪胎可類比為對側向速度的阻尼器：

$$
Y_i\simeq-\frac{C_{\alpha i}}Vv_i,
\qquad c_i=\frac{C_{\alpha i}}V,
\qquad c_{\mathrm{yaw}}=\frac{a^2C_{\alpha F}+b^2C_{\alpha R}}V=-N_r.
$$

因此提高車速會降低同一組輪胎對側向速度與偏航角速度的阻尼係數。阻尼中心位置與上述中性轉向點相同。

## 8. 特徵速度、臨界速度與切線速度（pp. 173–185）

$$
V_{\mathrm{char}}=\frac1{\sqrt K}=\sqrt{\frac{g\ell}{K_g}}
\quad(K>0),
$$

$$
V_{\mathrm{crit}}=\frac1{\sqrt{-K}}=\sqrt{-\frac{g\ell}{K_g}}
\quad(K<0).
$$

在特徵速度，維持相同半徑的轉角是 Ackermann 角的兩倍，且 $r/\delta$ 達峰值；在臨界速度，線性模型分母為零，代表模型的發散界線，並非可實際達到的無限偏航率。

切線速度是穩態 $\beta=0$ 的速度。由 Eq. (5.54) 的隱式關係或本模型的正剛度形式求得：

$$
mV_t=Y_r-\frac{Y_\delta N_r}{N_\delta},
\qquad V_t=\sqrt{\frac{b\ell C_{\alpha R}}{ma}}.
$$

第一式中的導數必須在 $V_t$ 評估，因 $Y_r,N_r$ 隨速度變化；不能把任意速度下的導數當常數後再多開一次根號。

## 9. 路徑曲率剛度與試驗解讀（pp. 193–230）

在固定 $\beta,\delta$ 下，曲率 $\kappa=1/R$ 造成的偏航力矩為：

$$
N_\kappa\kappa=(a^2C_F+b^2C_R)\kappa,
\qquad N_\kappa=VN_r.
$$

原書後段以靜態圖解說明控制、恢復力矩和曲率阻力矩的組合；它們與前述六導數是同一力矩平衡，不是另一套可任意相加的附加力。

固定半徑試驗與固定速度試驗的轉角斜率不同：

$$
\left.\frac{d\delta}{dA_y}\right|_R=K_g,
\qquad
\left.\frac{d\delta}{dA_y}\right|_V=\frac{g\ell}{V^2}+K_g.
$$

第二式必須扣除 Ackermann 幾何項才是轉向不足梯度。非線性範圍改用局部輪胎斜率 $\partial F_y/\partial\alpha$ 並反覆求解 $Y=ma_y,N=0$；只把峰值 $\mu Z$ 塞入線性 $K$ 公式並不能預測極限行為。

## 10. Stability index 與 Moment Method 的橋接（pp. 205–215、224–228）

原書 Eqs. (5.66)–(5.68) 定義無因次量：

$$
C_N=\frac{N}{W\ell},\qquad C_Y=\frac YW,
\qquad C_0=\frac{C_FC_R}{(C_F+C_R)W}<0.
$$

消去 $\beta$ 後，仍未要求偏航力矩平衡的關係為：

$$
C_N=-SM\,C_Y+C_0\frac{r\ell}{V}-C_0\delta.
$$

在側力已滿足 $C_Y=A_y$、$r=gA_y/V$ 的曲率條件下：

$$
C_N=\left(-SM+C_0\frac{g\ell}{V^2}\right)A_y-C_0\delta,
\qquad
SI=\left.\frac{\partial C_N}{\partial A_y}\right|_{\delta,V}
=-SM+C_0\frac{g\ell}{V^2}.
$$

本號誌下恢復型的 $SI<0$。中性轉向車雖 $SM=0$，有限速度仍有负 $SI$；轉向過度車在臨界速度 $SI=0$；轉向不足車在特徵速度 $SI=-2SM$。原書 p. 205 的敘述寫成 $2SM$，與 p. 209 圖的帶號斜率不同，此處依方程及圖保留負號。

原書 Eq. (5.65) 以導數寫出 $SI\simeq(W/Y_\beta)C_{N\beta}+(g/V)C_{Nr}$ 的簡式。若不忽略側力—偏航耦合 $Y_r$，從完整平衡求導可得到：

$$
SI=C_{N\beta}\frac{W-Y_rg/V}{Y_\beta}+C_{Nr}\frac gV,
\qquad C_{N\beta}=\frac{N_\beta}{W\ell},
\quad C_{Nr}=\frac{N_r}{W\ell}.
$$

這個完整式與上述 $C_0$ 形式相同，避免把省略耦合項的近似當成精確恆等式。

固定速度的方向盤靈敏度，以路輪 $UG$ 為 deg/g、$i_s$ 為方向盤／路輪比：

$$
\boxed{S_{SW}\ [g/100^\circ]
=\frac{100}{i_s\left[UG+(180/\pi)g\ell/V^2\right]}.}
$$

<div
  data-calculator=""
  data-boxed-id="rcvd-010"
  data-expression="100/(i_s*(UG+(180/pi)*g*ell/V^2))"
  data-inputs="i_s:steering wheel to road wheel angle ratio,UG:understeer gradient deg/g,g:gravity m/s^2,ell:wheelbase m,V:speed m/s"
  data-result="S_SW"
  data-unit="g/100 deg"
  data-constants="pi=3.141592653589793"
  data-note="UG is in degrees per g for this formula. Use steering-wheel/road-wheel ratio i_s and V &gt; 0. A near-zero denominator is outside a reliable linear gain estimate.">
</div>

分母接近零或輪胎進入非線性時，此低加速度線性式不再可靠。原書 p. 218 說明轉角斜率同時混合穩定、阻尼與控制能力；斜率變大不能單獨證明車更穩定。

## 11. Olley 側力判準（pp. 167–168、227）

外加側力 $F_e$ 與向心慣性項共同形成總側力；在零轉向、忽略 $Y_r$ 耦合時，原書 Eq. (5.49a) 的形式為：

$$
\frac{1/R}{F_e-mV^2/R}\simeq\frac{N_\beta}{VN_rY_\beta}.
$$

保留全部六導數，由同一力矩及側力平衡整理出的完整式為：

$$
\frac{1/R}{F_e-mV^2/R}
=\frac{N_\beta}{V(Y_\beta N_r-Y_rN_\beta)}.
$$

這和前述 $r/F_e$ 增益的分母不同，因輸入已扣除向心項。它用於解釋路徑相對於外加側力方向的彎曲：中性車保持直線；understeer／oversteer 的路徑反應方向不同。

## 12. 計算範例

**自行示例：** $m=1{,}000\ \mathrm{kg}$、$\ell=2.5\ \mathrm m$、$a=1.0\ \mathrm m$、$b=1.5\ \mathrm m$，前後正剛度各 $80{,}000\ \mathrm{N/rad}$。得到 $K=0.001\ \mathrm{s^2/m^2}$、$K_g=0.024525\ \mathrm{rad/g}=1.405\ \mathrm{deg/g}$、$SM=0.10$、$V_{\mathrm{char}}=31.62\ \mathrm{m/s}$。

若 $V=20\ \mathrm{m/s}$、$R=100\ \mathrm m$，$A_y=0.4077$，需要 $\delta=0.035\ \mathrm{rad}\approx2.01^\circ$。這是路輪角；方向盤角還須乘上方向盤／路輪比。
