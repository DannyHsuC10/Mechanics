clc;clear;
function tools = thermalToolkit()
% Constants
tools.constants.CtoF_scale = 9/5;
tools.constants.CtoF_offset = 32;
tools.constants.CtoK_offset = 273.15;

% Specific heat relations
tools.heat_Q = @(m, c, dT) m .* c .* dT;               % Q = m*c*DeltaT
tools.mass_from_Q = @(Q, c, dT) Q ./ (c .* dT);
tools.specific_heat_from_Q = @(Q, m, dT) Q ./ (m .* dT);
tools.deltaT = @(Tf, Ti) Tf - Ti;

% Absolute temperature conversions (affine where required)
tools.C_to_F = @(Tc) tools.constants.CtoF_scale .* Tc + tools.constants.CtoF_offset;
tools.F_to_C = @(Tf) (Tf - tools.constants.CtoF_offset) ./ tools.constants.CtoF_scale;
tools.C_to_K = @(Tc) Tc + tools.constants.CtoK_offset;
tools.K_to_C = @(Tk) Tk - tools.constants.CtoK_offset;
tools.F_to_K = @(Tf) tools.C_to_K(tools.F_to_C(Tf));
tools.K_to_F = @(Tk) tools.C_to_F(tools.K_to_C(Tk));

% Relative (delta) temperature conversions: apply only linear scale, no offsets
tools.deltaC_to_deltaF = @(dTc) tools.constants.CtoF_scale .* dTc;
tools.deltaF_to_deltaC = @(dTf) dTf ./ tools.constants.CtoF_scale;
tools.deltaF_to_deltaK = @(dTf) (5/9) .* dTf;     % deltaK = 5/9 * deltaF
tools.deltaC_to_deltaK = @(dTc) dTc;              % deltaC equals deltaK

end


tools = thermalToolkit;        % runs demo if no output
% Compute heat to raise 2 kg of aluminium (c=900 J/kgK) by 30 C:
Q = tools.heat_Q(2, 900, 30)

% Convert temperatures:
F = tools.C_to_F(100)         % boiling point: 100 C -> F
K = tools.C_to_K(0)           % 0 C -> K

% Convert relative change 18 F into kelvin:
dK = tools.deltaF_to_deltaK(18)