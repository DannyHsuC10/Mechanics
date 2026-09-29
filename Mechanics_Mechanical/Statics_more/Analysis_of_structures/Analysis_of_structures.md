---
layout: base
---

# Analysis of structures

Structural analysis begins by identifying members, joints, supports, and the loads they transfer. The counts and equilibrium relations below help distinguish stable structures from mechanisms.

<div style="text-align: center;">
<img src="upload_d3e84eb3ba18a5e549a903fda19ef12b.png" alt="image" width="800">
</div>

## Stable structure analysis

<div style="text-align: center;">
<img src="upload_60c36f4c126295e9e289c785283913fc.png" alt="image" width="800">
</div>

One truss with two joint

$$m = 2n-3$$

$$2n = m+3$$

* number of joint : $n$
* number of Truss : $m$

## Mechanism analysis

$$\boxed{P = \frac32N-2}$$

<div
  data-calculator=""
  data-boxed-id="boxed-058"
  data-expression="1.5*N-2"
  data-inputs="N:number of joints"
  data-result="P"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* number of pairs : $P$
* number of link : $N$

structure : $2P > 3N-4$
mechanism (Kinematic chain) : $2P = 3N-4$
No constraints : $2P < 3N-4$

## Space Stable structure analysis

$$\boxed{m = 3n-6}$$

<div
  data-calculator=""
  data-boxed-id="boxed-059"
  data-expression="3*n-6"
  data-inputs="n:number of joints"
  data-result="m"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

* number of joint : $n$
* number of Truss : $m$

## Equilibrium

* statically indeterminate :

$$\text{unknowns}>\text{equation}$$

* nonrigid :

$$\text{unknowns}<\text{equation}$$
