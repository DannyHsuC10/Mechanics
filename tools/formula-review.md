# Formula review — 2026-09-30

This review covers the formulas explicitly listed by the owner, their calculator definitions, and directly related derivation steps. It is not a physical-correctness audit of every formula in the repository.

## Removed calculators

The maximum-entropy distribution label, the particle-kinematics radius expression, and the incomplete radial-acceleration expression retain their original content but no longer use `boxed` or calculator markers. Their definitions (001, 015, 017) were removed without renumbering the remaining IDs. The unboxed expressions were not mathematically revised.

## Corrections and conventions

| Calculator | Correction |
| --- | --- |
| 013 | Elastic collision: the second final velocity uses `(m_2-m_1)*v_2i + 2*m_1*v_1i`, divided by total mass. Velocities are signed along a shared axis. |
| 045 | Volumetric strain uses Young modulus E in `3*(P/A)*(1-2*mu)/E`. E_V remains bulk modulus. Stress is tensile-positive; positive compressive pressure produces negative volume strain. The nearby fractional-volume derivation was also corrected. |
| 047 | Signed beam curvature uses the first derivative squared in the denominator and the second derivative in the numerator. The deflection symbol nu is not Poisson ratio here. |
| 054 | The previously corrected shear modulus `E/[2*(1+nu)]` was verified and retained. |
| 073 | Ideal gas law is `PV=nRT`; the calculator solves for volume. |
| 076 | Original BWR equation uses molar volume V_m consistently, starts with RT/V_m, and adds the density correction terms. It requires fluid-specific coefficients in a consistent unit system. |
| 096 | Spring potential energy is positive `k*x^2/2`, referenced to the unstretched spring. Nearby work and energy-change signs and integration limits were repaired. |
| 101 | Rolling energy combines `m*v_com^2/2` and `I_com*omega^2/2`. |
| 102 | The yo-yo equation is solved for downward acceleration: `g/[1+I/(m*R^2)]`. R is the string winding radius; the string is fixed, massless, and unwinds without slipping. The local torque equations now use string tension consistently. |
| 117 | Surface tension is `F/(2L)` for effective total contact length 2L. The factor two is not universal: if L already denotes the total effective contact length, use F/L. The adjacent buoyancy term now includes g. |
| 125, 126 | Relabeled the most probable speed v_p and mean speed v_avg; their numerical expressions are unchanged. Nearby molecular/molar conversions were corrected to M=N_A*m. |
| 140 | Restored the squares in v^2/c^2 and enabled the calculator. The page uses the relativistic-mass convention; rest mass remains invariant. Valid speeds have magnitude below c. |

Both the Markdown markers and `boxed_calculators.json` were updated. There are 153 remaining boxes and 154 working forms because the speed/velocity box has two calculators.

## References

- [OpenStax: elastic collisions](https://openstax.org/books/college-physics/pages/8-4-elastic-collisions-in-one-dimension) — momentum and kinetic-energy conservation.
- [University of Florida: strength of materials](https://web.mae.ufl.edu/uhk/strength.htm) and [OpenStax: elastic modulus](https://openstax.org/books/university-physics-volume-1/pages/12-3-stress-strain-and-elastic-modulus) — Young, shear, and bulk moduli and pressure convention.
- [MIT: moderately large deflection of beams](https://ocw.mit.edu/courses/2-080j-structural-mechanics-fall-2013/f827582935b884270771d43cdeba860d_MIT2_080JF13_Lecture6.pdf) — first-derivative denominator in curvature; curvature sign depends on the deflection convention.
- [David Young: equations of state](https://server.ccl.net/cca/documents/dyoung/topics-orig/eq_state.html) — the BWR density form was converted using density = 1/V_m.
- [OpenStax: potential energy](https://openstax.org/books/university-physics-volume-1/pages/8-1-potential-energy-of-a-system) and [rolling motion](https://openstax.org/books/university-physics-volume-1/pages/11-1-rolling-motion) — spring and rotational energy.
- [ENSCR: surface tension experiment](https://physique.ensc-rennes.fr/tp_tension_surface_en.php) — the two-face film force relation.
- [OpenStax: molecular speeds](https://openstax.org/books/university-physics-volume-2/pages/2-4-distribution-of-molecular-speeds) — most probable, mean, and RMS speeds.
