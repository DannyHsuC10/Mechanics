---
layout: base
---

# Pulley

Levers and pulley systems trade input travel for output force. Identify the moving parts and supporting rope segments before applying the mechanical-advantage relationships.

## Lever

<div style="text-align: center;">
<img src="Lever_(PSF).png" alt="image" width="600">
</div>

>https://en.wikipedia.org/wiki/Lever

$$\text{IMA} = \frac WF$$

### Class 1 lever

$$\text{IMA} = \frac WF \in R$$

### Class 2 lever

$$\text{IMA} = \frac WF > 1$$

### Class 3 lever

$$\text{IMA} = \frac WF < 1$$

## Pulley type

### Fixed pulley (Class 1 lever)

$\text{IMA}  = 1$

<div style="text-align: center;">
<img src="upload_ab397451910615a52177219ec34d7020.png" alt="image" width="150">
</div>

$$\frac WF = \frac{v_F}{v_w} = 1$$

### Movable pulley (Class 2 lever)

$\text{IMA}  = 2$

<div style="text-align: center;">
<img src="upload_6a3bf6c9f80f0ce7b5b4b6750231997b.png" alt="image" width="140">
</div>

$$\frac WF = \frac{v_F}{v_w} = 2$$

### Movable pulley (Class 3 lever)

$\text{IMA}  = 1/2$
<div style="text-align: center;">
<img src="https://hackmd.io/_uploads/rykhNMKvxx.png" alt="image" width="140">
</div>

$$\frac WF = \frac{v_F}{v_w} = \frac12$$

## Block and tackle

### Gun tackle pulleys

<div style="text-align: center;">
<img src="upload_6a3bf6c9f80f0ce7b5b4b6750231997b.png" alt="image" width="140">
</div>

$$\text{IMA} = \frac WF =\frac {2F}{F} = 2$$

<div style="text-align: center;">
<img src="570px-Tackles.png" alt="image" width="400">
</div>

>https://en.wikipedia.org/wiki/Block_and_tackle

* Number of line : $n$

$$\text{IMA} = \frac WF =\frac {nF}{F} = n$$

### Spanish burton

<div style="text-align: center;">
<img src="upload_d3f42c3402227cee7e0c7a21f6bc035e.png" alt="image" width="350">
</div>

$$\text{IMA} = \frac WF =\frac {2F+F}{F} = 3$$

**Multi-spanish burton**

* Number of movable pulleys : $n$

$$\boxed{M = 2^{(n+1)}-1}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-025"
  data-expression="2^(n+1)-1"
  data-inputs="n:number of movable pulleys"
  data-result="M"
  data-unit=""
  data-constants=""
  data-note="Ideal mechanical advantage of the stated multi-Spanish-burton arrangement. Use a positive integer n; friction and rope elasticity are excluded.">
</div>

### Luff upon luff

<div style="text-align: center;">
<img src="upload_f707410eadc6f874702197e210aed46d.png" alt="image" width="380">
</div>

number of line : $m$,$n$

$$M = \frac WF = mn$$

### Differential pulley block

The smaller the difference between $D$ and $d$, the larger $F$
<div style="text-align: center;">
<img src="upload_010b31297ae2522e9e1a52697d5fe21b.png" alt="image" width="150">
</div>

$$F(\pi D) = \frac W2(\pi D)-\frac W2(\pi d)$$

$$FD = \frac W2(D-d)$$

$$\boxed{M = \frac WF = \frac{2D}{D-d}}$$

<div
  data-calculator=""
  data-boxed-id="mechanical-026"
  data-expression="2*D/(D-d)"
  data-inputs="D:large pulley diameter m,d:small pulley diameter m"
  data-result="M"
  data-unit=""
  data-constants=""
  data-note="Ideal load-to-effort ratio W/F. Use D &gt; d &gt; 0 with both diameters in the same unit; D = d makes the expression undefined.">
</div>
