clearvars; close all;

% Parameters (edit as needed)
TL = 300;            % low temperature (K)
TH_min = 300;        % min hot temperature (K) (>= TL)
TH_max = 1000;       % max hot temperature (K)
TH = linspace(TH_min, TH_max, 800);

A = 0.5;             % area (m^2)
L = 0.01;            % distance between isothermal planes (m)
K = 200;             % thermal conductivity (W/m/K) (e.g., copper ~400)
h = 25;              % convective heat transfer coefficient (W/m^2/K)
epsilon = 0.8;       % emissivity
sigma = 5.670374419e-8; % Stefan-Boltzmann constant (W/m^2/K^4)

% Delta T
dT = TH - TL;

% Powers
P_cond = K * A .* dT ./ L;                 % conduction (W)
P_conv = h * A .* dT;                      % convection (W)
% radiation: power from hot surface to environment at TL (net)
P_rad = sigma * epsilon * A .* (TH.^4 - TL.^4);  % net radiative transfer (W)

% Create figure: linear P vs TH
% Create figure: log-log to compare scalings
figure('Name','P vs TH (log-log)','NumberTitle','off');
loglog(TH, max(1e-12, abs(P_cond)), 'b-', 'LineWidth',1.4); hold on;
loglog(TH, max(1e-12, abs(P_conv)), 'r--', 'LineWidth',1.4);
loglog(TH, max(1e-12, abs(P_rad)), 'g:', 'LineWidth',1.6);
xlabel('T_H (K)'); ylabel('Power |P| (W)');
title('Log-Log: Heat Transfer Power vs T_H');
legend('Conduction','Convection','Radiation','Location','northwest');
xlim([TH_min TH_max]);
