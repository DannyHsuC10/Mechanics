---
layout: base
---

# Periodic motion mechanism

Intermittent mechanisms alternate between motion and dwell. The relationships below describe how gear engagement and Geneva-drive geometry set the timing of each cycle.

## Periodic motion gear

* Time : $t$
* Teeth : $T$

$$t_A\frac{T_B}{T_A} = t_B$$

## Geneva drive

<div style="text-align: center;">
<img src="geneva%20wheel.jpg" alt="image" width="200">
</div>

>https://static.sdcpublications.com/multimedia/978-1-58503-767-4/files/krb/krb_gen_page3.htm

* Number of separators : $N > 4$

### Transmission angle

<div style="text-align: center;">
<img src="upload_2f31654b19dc3d988f07fab6ca004d0d.png" alt="image" width="350">
</div>

* transmission angle : $\theta_\text{on}$
* Non-transmission angle : $\theta_\text{off}$

$$\frac{2\pi}{2N} = \theta$$

$$\theta_\text{on} = 2(\frac\pi2-\theta) = \pi-\frac{2\pi}N = \pi(1-\frac2N)$$

$$\theta_\text{off} = 2\pi-\pi(1-\frac2N)$$

$$= \pi(2-(1-\frac2N)) =\pi(1+\frac2N)$$

### Transmission time

* transmission time : $t_\text{on}$
* Non-transmission time : $t_\text{off}$

$$t_\text{on} : \theta_\text{off} = \pi(1-\frac2N) : \pi(1+\frac2N)$$

$$\omega = \frac t{2\pi}$$

$$\boxed{t_\text{on} = \frac t{2\pi}(\pi(1-\frac2N)) = \frac t2-\frac tN}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-014"
  data-expression="t/2-t/N"
  data-inputs="t:complete cycle period s,N:number of slots"
  data-result="t_on"
  data-unit="s"
  data-constants=""
  data-note="Use the complete input-rotation period t and an integer slot count N &gt; 4 as stated on this page. This evaluates the final equality in the box.">
</div>

$$\boxed{t_\text{off} = \frac t{2\pi}(\pi(1+\frac2N)) = \frac t2+\frac tN}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-015"
  data-expression="t/2+t/N"
  data-inputs="t:complete cycle period s,N:number of slots"
  data-result="t_off"
  data-unit="s"
  data-constants=""
  data-note="Use the complete cycle period t and integer N &gt; 4. Motion time plus dwell time equals t.">
</div>
