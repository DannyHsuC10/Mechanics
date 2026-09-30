---
layout: base
---

# Sprocket

A chain drive transfers motion through sprocket teeth engaging the chain. These notes connect tooth geometry, center distance, chain length, and transmitted power.

## contact angle

<div style="text-align: center;">
<img src="qada_spr_ans53_en.jpg" alt="image" width="300">
</div>

> https://tt-net.tsubakimoto.co.jp/tecs/engd/cdc/engd_cdc_tri_sue.as

$$\theta_A,\theta_B>120^o$$

## Chain length

$$D = \frac P{\sin\theta}$$

$$D = \frac{PT}\pi$$

$$\theta = \frac\pi T$$

$$\boxed{L = \frac\pi2(D_1+D_2)+2C\frac{(D_1-D_2)^2}{4C}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-027"
  data-expression="pi/2*(D_1+D_2)+2*C*(D_1-D_2)^2/(4*C)"
  data-inputs="D_1:first sprocket diameter,D_2:second sprocket diameter,C:center distance"
  data-result="L (as written)"
  data-unit=""
  data-constants="pi=3.141592653589793"
  data-note="Evaluates the boxed expression literally: 2C multiplies the following fraction. The resulting terms have incompatible length dimensions and a plus sign may be missing. This is a raw numerical result, not a validated chain length. Use C &gt; 0.">
</div>

$$n = \frac LP$$

## Chain tension effect

$$r_{\min} = r\cos\theta$$

$$\Delta r = r(1-\cos\theta)$$

$$v_{\min} = r\cos\theta2\pi N$$

$$v_{\max} = r2\pi N$$

## Power

Power measures the rate of energy transfer. Use the translational or rotational expression that matches the mechanism.

$$\boxed{P = Fv = F\frac{\pi DN}{60}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-028"
  data-expression="F*pi*D*N/60"
  data-inputs="F:tangential chain force N,D:pitch diameter m,N:rotational speed rpm"
  data-result="P"
  data-unit="W"
  data-constants="pi=3.141592653589793"
  data-note="Uses v = pi*D*N/60 with D in meters and N in revolutions per minute. F is tangential driving force.">
</div>

$$PS = \frac{P}{735} = \frac{FV}{735} = \frac{F\pi DN}{44100}$$
