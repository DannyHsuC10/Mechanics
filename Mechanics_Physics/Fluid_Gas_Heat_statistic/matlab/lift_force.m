clearvars; close all;

% Parameters (edit as needed)
c = 1.2;           % lift coefficient (Cl), typical 0.5-1.5 depending on airfoil/angle
rho = 1.225;       % air density (kg/m^3) at sea level
A = 0.5;           % reference area (m^2)
vmin = 0;          % start velocity (m/s)
vmax = 80;         % max velocity (m/s)
nv = 1000;

% Velocity vector (avoid exactly zero for log plot)
v = linspace(max(1e-6,vmin), vmax, nv);

% Lift force
F = 0.5 .* c .* rho .* A .* v.^2;

% Linear plot
figure;
plot(v, F, 'b-', 'LineWidth',1.6);
xlabel('v (m/s)'); ylabel('Lift F (N)');
title('Lift vs Velocity (linear)');
grid on;
