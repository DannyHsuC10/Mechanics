clc;clear;
function tools = electricityToolkit()

% Fundamental constants optionally (user can override)
tools.constants.epsilon0 = 8.854187817e-12; % F/m
tools.constants.mu0 = 4*pi*1e-7;           % H/m
tools.constants.k = 1/(4*pi*tools.constants.epsilon0); % Coulomb constant ~ 8.98755e9

% Function handles
tools.coulomb_force = @(k, Q, q, r) k .* Q .* q ./ r.^2;                 % magnitude
tools.electric_field = @(k, q, r_vec) (k .* q ./ (norm(r_vec)^3)) .* r_vec; % vector E at point r_vec from charge at origin
tools.potential_energy = @(k, Q, q, r) k .* Q .* q ./ r;
tools.potential = @(k, q, r) k .* q ./ r;
tools.electric_flux = @(E_vec, A_vec) dot(E_vec, A_vec);                 % simple flat surface: E·A
tools.capacitance = @(Q, dV) Q ./ dV;
tools.ohm_voltage = @(I, R) I .* R;
tools.voltage_from_energy = @(E, Q) E ./ Q;
tools.current_from_charge = @(Q, t) Q ./ t;
tools.drift_current = @(n, q, v, A) n .* q .* v .* A;
tools.resistance_from_VI = @(V, I) V ./ I;
tools.resistance_from_resistivity = @(rho, L, A) rho .* L ./ A;
tools.energy_from_charge = @(Q, V) Q .* V;
tools.energy_from_IVt = @(I, V, t) I .* V .* t;
tools.power_from_energy = @(E, t) E ./ t;
tools.power_IV = @(I, V) I .* V;
tools.power_I2R = @(I, R) I.^2 .* R;
tools.power_V2R = @(V, R) V.^2 ./ R;
tools.series_resistance = @(Rlist) sum(Rlist);
tools.parallel_resistance = @(Rlist) 1 ./ sum(1 ./ Rlist);
tools.hall_voltage = @(I, B, n, q, A) I .* B ./ (n .* q .* A);
tools.lorentz_force = @(q, v_vec, B_vec) q .* cross(v_vec, B_vec);
% Biot-Savart for a small line element dl at vector position r_dl (to field point r_p)
tools.biotsavart_line = @(mu, I, dl_vec, r_vec) (mu./(4*pi)) .* I .* cross(dl_vec, r_vec) ./ (norm(r_vec).^3);

end


tools = electricityToolkit;


k = tools.constants.k;
F = tools.coulomb_force(k, 1e-6, 2e-6, 0.1)    % Coulomb force magnitude
E = tools.electric_field(k, 1e-6, [0.05,0,0])  % Electric field vector
C = tools.capacitance(1e-6, 12)                % capacitance
V = tools.ohm_voltage(0.2, 50)                 % V = IR
P = tools.power_V2R(V, 50)                     % power from V^2/R