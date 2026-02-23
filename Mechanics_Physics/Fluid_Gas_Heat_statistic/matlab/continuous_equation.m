
clearvars; close all;

% Parameters (change as needed)
g = 9.81;            % acceleration (m/s^2)
Ai = 0.02;           % initial area (m^2)
vi = 0.5;            % initial velocity (m/s)  -> Q = vi*Ai
Q = vi * Ai;         % volumetric flow (m^3/s)

% Time vector: start at t0 > 0 to avoid singularity at t=0
t0 = 1e-3;           % s, small positive start
tmax = 0.3;          % s
t = linspace(t0, tmax, 1000);

% Velocity and area
v = g .* t;                     % v(t) = g t
A = Q ./ v;                     % A(t) = Q / (g t)

% Plot linear scale
figure('Color','w');
plot(t, A, 'b-', 'LineWidth',1.6); hold on;
xlabel('t (s)'); ylabel('A(t) (m^2)');
title('Area vs Time (linear)');
grid on; box on;
% mark initial/reference point using given vi,Ai (if consistent)
plot(vi/g, Ai, 'ko', 'MarkerFaceColor','y'); % t_ref = vi/g gives v=vi
text(vi/g, Ai, sprintf('  t = %.3g s', vi/g));

% Optional: show analytical reference line proportional to 1/t
C = Q / g;              % A(t) = C / t
t_ref = [min(t) max(t)];
plot(t_ref, C./t_ref, 'g--', 'LineWidth',1.2);
