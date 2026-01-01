---
layout: base
---

# Electricity

$$F = \frac{kQq}{r^2}$$

$$E = \frac{kq}{r^2}$$

$$U = \frac{kQg}{r}$$

$$V = \frac{kq}{r}$$

$$\Phi_E = \int E\ dA$$

## Capacitance

$$C = \frac{Q}{\Delta V}$$

## Voltage

$$V = IR$$

$$V  = \frac{E}{Q}$$

## Current

$$I = \frac{Q}{t}$$

$$I = nqvA$$

## Resistance

$$R = \frac{V}{I}$$

$$R = \frac{Pl}{A}$$

$P =$ resistivity, unit : $\Omega\cdot m$
$l =$ length
$A =$ area

## Energy

$$E = QV = IVt$$

## Power

$$P = \frac{E}{t} = IV = I^2R = \frac{V^2}{R}$$

## Series and parallel circuits

|         |            Series             |           parallel            |
|:-------:|:-----------------------------:|:-----------------------------:|
| Voltage |   $$V_{tt} = V_1+V_2...+V_n$$   | $$V_{tt} = V_1 = V_2... = V_n$$ |
| Current | $$I_{tt} = I_1 = I_2... = I_n$$ |   $$I_{tt} = I_1+I_2...+I_n$$   |

## Hall effect

$$V_H = \frac{IB}{nqA}$$

## Electromagnetism

$$F_B = qvB$$

## Blot Savart's law

$$B = \frac{\mu}{4\pi}\int\frac{I\ dl\times \vec r}{r^2}$$

## Ampère's circuital law

$$B_{line} = \frac{\mu I}{4\pi}\int\frac{\ dl \cos\theta}{r^2}$$

$$r = \frac{s}{cos\theta}$$

$$l = s\tan\theta$$

$$dl = l\sec^2\theta d\theta = \frac{l}{\cos^2\theta}d\theta$$

$$B_{line} = \frac{\mu I}{4\pi}\int\frac{s\cos^3\theta d\theta}{s^2cos^2\theta} = \frac{\mu I}{4\pi s}\int\cos\theta d\theta$$

$$\frac{\mu I}{4\pi s}\int^\frac{\pi}{2}_{-\frac{\pi}{2}}\cos\theta d\theta = \frac{\mu I}{4\pi s}(1-(-1)) = \frac{\mu I}{2\pi s}$$

$$\oint B\ ds = \frac{\mu I}{2\pi s}2\pi s = \mu I$$

## Faraday's law

$$\epsilon = -\frac{d\Phi_B}{dt} = -\frac{\Delta BA}{\Delta t}$$

## Maxwell's equations

$$\Phi_E = \int E\ dA = \frac{q}{\epsilon_0}$$

$$\Phi_B = \int B\ dA = 0$$

$$\int E\ ds = \frac{-d\Phi_B}{dt}$$

$$\int B\ d = \mu_0 I+\mu_0\epsilon_0\frac{\Phi_E}{dt}$$
***
$$\nabla\cdot E = \frac\rho\epsilon_0$$

$$\nabla\cdot B = 0$$

$$\nabla\times E = -\frac{\partial B}{\partial t}$$

$$\nabla\times H = \mu_0J_f+\mu_0\epsilon_0\frac{\partial E}{\partial t}$$