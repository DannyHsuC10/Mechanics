---
layout: base
---

# RCVD 公式筆記索引與使用說明

來源是本資料夾的 rcvd ocr.pdf，共 926 頁。原有 23 份章節筆記；本次擴充 Chapter 2–12、14–23，共 21 份。Chapter 1、13 保留原狀。

## 1. 閱讀方式

- 每章開頭提供原 PDF 連結與章節頁碼；書頁加 31 即 PDF 頁碼。
- 小節標示公式對應的書頁及可辨識的方程號；統一記號的等價式不保證與原書字母完全相同。
- 「整理推導」「工程近似」「補充」與「自行示例」均有區分，不冒稱原書原式。
- 同一通用公式的逐步數字代入不逐行重複；圖表數據、經驗設定、歷史性能與材料表沒有偽造成通用解析公式。
- 本次沒有把全部圖表數位化。需要輪胎／空力曲線的公式仍須實測或相應圖表輸入，不能只靠筆記數式求出車輛性能。

## 2. 章節與公式區塊

以下計數是獨立的 display math 區塊（兩個 `$$` 為一組）；同區塊可能有多條方程，行內公式不計入，因此不是獨立物理定律的數量。由原先 **77** 組擴充為 **425** 組。

| Chapter | 書頁 | 主要補充內容 | 公式區塊（原 → 新） |
| --- | --- | --- | --- |
| [02](Chapter_02_Tire_Behavior.md) | 13–82 | 側偏剛度、滑移率換算、組合滑移、回正力矩、滾阻與輪軸扭矩 | 6 → 28 |
| [03](Chapter_03_Aerodynamic_Fundamentals.md) | 83–112 | 空氣密度、Bernoulli、壓力係數、Reynolds number、六分力 | 5 → 16 |
| [04](Chapter_04_Vehicle_Axis_Systems.md) | 113–122 | 軸系、側滑與路徑方向、旋轉座標加速度、逐輪力矩轉換 | 6 → 13 |
| [05](Chapter_05_Simplified_Steady_State_Stability_and_Control.md) | 123–230 | 六導數、四種穩態增益、側風／偏航擾動、K／SM／三種特徵速度 | 8 → 38 |
| [06](Chapter_06_Simplified_Transient_Stability_and_Control.md) | 231–278 | SMD、車輛狀態方程、特徵根、單自由度與含零點的階躍響應 | 7 → 22 |
| [07](Chapter_07_Steady_State_Pair_Analysis.md) | 279–292 | FLT、潛力圖交點、左右輪合力、有效重心高度 | 3 → 13 |
| [08](Chapter_08_Force_Moment_Analysis.md) | 293–344 | CN–CY、trim、構造線、局部穩定性、圈速離散計算 | 3 → 18 |
| [09](Chapter_09_g_g_Diagram.md) | 345–366 | g-g-speed、功率與輪胎限制、定轉角半徑變化、數據利用率 | 2 → 12 |
| [10](Chapter_10_Race_Car_Design.md) | 367–372 | 設計流程的質量／慣量／功率／剛度與圈速工作表 | 2 → 13 |
| [11](Chapter_11_Testing_and_Development.md) | 373–386 | 感測器標定、skid pad、轉向梯度與量測誤差 | 4 → 12 |
| [12](Chapter_12_Chassis_Set_Up.md) | 387–412 | 四角配重、側傾分配、動態定位、入彎／彎中／出彎調校 | 2 → 14 |
| [14](Chapter_14_Tire_Data_Treatment.md) | 473–488 | 原書 14.1–14.21 正規化、主曲線與兩類組合滑移 | 5 → 20 |
| [15](Chapter_15_Applied_Aerodynamics.md) | 489–578 | 有限翼、端板、地面效應、冷卻流、平板與負載敏感度 | 3 → 24 |
| [16](Chapter_16_Ride_and_Roll_Rates.md) | 579–606 | ride／wheel／spring rate、輪胎串聯、幾何剛度與防傾桿 | 4 → 22 |
| [17](Chapter_17_Suspension_Geometry.md) | 607–664 | IC／RC、外傾增益、anti、roll steer 與原書印式疑點 | 3 → 17 |
| [18](Chapter_18_Wheel_Loads.md) | 665–708 | 秤重重心、三質量轉移、banking、地形、空力、扭矩反作用與偏置重心 | 3 → 46 |
| [19](Chapter_19_Steering_Systems.md) | 709–728 | Ackermann、齒條 c-factor、轉向比、bump steer 與轉向力矩 | 2 → 14 |
| [20](Chapter_20_Driving_and_Braking.md) | 729–754 | 驅動扭矩、差速器、動態制動分配、卡鉗壓力與踏板比 | 2 → 19 |
| [21](Chapter_21_Suspension_Springs.md) | 755–780 | 原書 21.1–21.22 扭力桿、螺旋／葉片彈簧及串並聯 | 3 → 23 |
| [22](Chapter_22_Dampers_Shock_Absorbers.md) | 781–832 | 四分之一車、傳遞率、阻尼加速度、台架速度、耗能及接地率 | 2 → 25 |
| [23](Chapter_23_Compliances.md) | 833–840 | 順應性係數、量測、轉向梯度、矩陣柔度與輪胎回授 | 2 → 16 |

## 3. 共通符號與單位

| 量 | 約定 |
| --- | --- |
| 質量與重量 | $m$ 為 kg；$W=mg$ 為 N，不可把 kg 當 N 代入 |
| 加速度 | $a_x,a_y$ 用 m/s²；$A_x=a_x/g,A_y=a_y/g$ 用 g 值 |
| 輪胎負載 | $Z>0$ 表負載大小；車身 $z$ 向下時地面反力 $F_z<0$ |
| 車身座標 | $x$ 向前、$y$ 向右、$z$ 向下，右轉 $r>0$ |
| 側偏剛度 | Chapter 5、6 沿用帶符號 $C_F,C_R<0$；正剛度另寫 $C_\alpha=-C$ |
| 角度 | 方程預設 rad；deg 數據要連同斜率、角剛度一起換算 |
| 安裝比 | $IR=$ 彈簧／避震器行程除以輪心行程；相反定義先取倒數 |
| 轉向比 | $i_s=$ 方向盤角／路輪角；增益 $G_s=1/i_s$ |
| 下壓力 | 原書 $C_L$ 以向上為正；正下壓力大小 $D_f=-C_LqA$ |
| 負載轉移 | $\Delta W$ 為由內輪移至外輪的量；兩輪負載差為 $2\Delta W$ |

## 4. 原頁核對時發現的特殊問題

1. **Chapter 7，p. 288：** 偏置重心修正分母印成 $A_Z$，附近未明確定義。筆記保留並標示；中線重心使該項消失，偏置車改用 Chapter 18 明確的模型。
2. **Chapter 17，p. 618，圖 17.13：** 內置煞車 anti 百分比的制動份額出現在分母，與按同頁定義的自由體力比不一致。筆記保留印式，另列採用明確分母定義的力平衡推導。
3. **Chapter 18，pp. 699–700：** 左後輪扭矩反作用的文字式與數值例正負不一致；筆記按自由體與數值例說明負號來源。
4. **Chapter 19，p. 718：** 書中 steer ratio 的式子使用角度增益方向；筆記明確區分角度比與倒數，並區分局部比與有限轉角估算。
5. **Chapter 5，pp. 205–210：** 特徵速度的 SI 敘述與圖上帶號斜率不同；筆記依方程說明 $SI=-2SM$，並區分原書簡式與保留 $Y_r$ 耦合項的完整導數式。

這些項目不是只靠 OCR 猜測，已回看對應掃描頁。其餘公式也仍需按章內列出的模型範圍使用，不能視為已核對任意實車工況。

## 5. 推薦計算順序

先讀 Chapter 4 的符號 → Chapter 2、14 建立輪胎模型 → Chapter 18 計算負載 → Chapter 7、8 求車軸能力與全車 trim → Chapter 5、6 理解線性穩態與瞬態 → Chapter 9、15 加入速度與空力 → Chapter 16–23 設計並核對零件與實際變形 → Chapter 11 用量測修正模型。

所有筆記仍位於私人 RCVD 資料夾。原筆記備份存於專案忽略的 `.site-check/rcvd-review/original-notes/`；此索引與筆記不需要公開 PDF 才能在本機閱讀。
