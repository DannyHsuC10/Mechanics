---
layout: base
---

# Torsion

Torsion describes the deformation of a member subjected to a twisting moment. Relate torque to shear stress and angle of twist using the cross-section and material assumptions stated below.

<div style="text-align: center;">
<img src="upload_50bffedc91d768564f50ae3d451fd603.png" alt="image" width="400">
</div>

* Right-hand thread is positive (+) when it is loosened
* right-hand thread is negative (-) when it is tightened

## Torsional stress & shear strain

<div style="text-align: center;">
<img src="upload_24eb547fa399f98584d1bbdb52600c4e.png" alt="image" width="500">
</div>

$$r = \frac{R\phi}{L} = R\theta$$

$$\theta = \frac{\phi}{L}$$

$$\tau \propto R$$

$$\frac{\tau}{R} = \frac{\tau_1}{R_1} = \frac{\tau_2}{R_2} = \frac{\tau_{max}}{R_{tt}}$$

$$\tau = \frac{TR}{J}$$

$$J = \frac{\pi R^4}{2}$$

$$\boxed{\phi = \frac{TL}{GJ}}$$

<div
  data-calculator=""
  data-boxed-id="boxed-044"
  data-expression="T*L/(G*J)"
  data-inputs="T:torque N m,L:length m,G:shear modulus Pa,J:polar second moment m^4"
  data-result="phi"
  data-unit=""
  data-constants=""
  data-note="Enter the variables in consistent SI units. The calculator evaluates the boxed expression.">
</div>

## Material properties

tensile strength : $\sigma_{T\ ult}$
Compressive strength : $\sigma_{C\ ult}$
Shear strength : $\tau_{ult}$

* **Brittle**
$\sigma_{T\ ult} \simeq \sigma_{C\ ult} > \tau_{ult}$

<div style="text-align: center;">
<img src="upload_4e8859b8d16c4da491371c4b3ede5c34.png" alt="image" width="200">
</div>

* **Ductile**
$\sigma_{C\ ult} > \tau_{ult} > \sigma_{T\ ult}$

<div style="text-align: center;">
<img src="upload_932b4d86c9c92c8928c28efe2a3f830a.png" alt="image" width="200">
</div>

|Properties|     Ductile materials     |     Brittle materials     |
|:--------:|:-------------------------:|:-------------------------:|
| Material |           Steel           |          cement           |
| strength | Tensile=Compression>Shear | Compression>Shear>Tensile |

## Power and material relationship

$$P = T\omega$$

$$\frac{P_1}{P_2} = \frac{T_1}{T_2} = \frac{d^3_1}{d^3_2}$$

$$A \propto V \propto m \propto D^2$$

* Hollow axles are stronger than solid axles of the same area $(A_1 = A_2)$
