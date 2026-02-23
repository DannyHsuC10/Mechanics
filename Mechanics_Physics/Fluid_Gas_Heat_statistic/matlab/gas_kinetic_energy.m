
% E_vs_v_Maxwell.m
k = 1.380649e-23;        % Boltzmann constant J/K
T = 300;                 % temperature K
M = 28.0134e-3;          % molar mass for N2 kg/mol (example)
NA = 6.02214076e23;      % Avogadro's number
m = M / NA;              % mass of one molecule (kg)

% characteristic speeds
v_mp  = sqrt(2*k*T / m);
v_avg = sqrt(8*k*T / (pi*m));
v_rms = sqrt(3*k*T / m);

% speed range for plotting
vmax = 1.6 * v_rms;
v = linspace(0, vmax, 800);

% kinetic energy (J) and also in eV for convenience
E_J = 0.5 * m .* v.^2;
E_eV = E_J / 1.602176634e-19; % 1 eV in J

% energies at characteristic speeds
E_mp  = 0.5 * m * v_mp^2;
E_avg = 0.5 * m * v_avg^2;
E_rms = 0.5 * m * v_rms^2;

% Plot
figure;
plot(v, E_J, 'b-', 'LineWidth', 1.5)
hold on
% vertical speed markers
xline(v_mp,  'r--','LineWidth',1);
xline(v_avg, 'g--','LineWidth',1);
xline(v_rms, 'm--','LineWidth',1);
% markers on the curve
plot(v_mp, E_mp, 'ro', 'MarkerFaceColor','r')
plot(v_avg, E_avg, 'go', 'MarkerFaceColor','g')
plot(v_rms, E_rms, 'mo', 'MarkerFaceColor','m')

xlabel('Speed v (m/s)')
ylabel('Kinetic energy E (J)')
title(sprintf('Kinetic Energy E = 1/2 m v^2 (T = %g K, m = %.3e kg)', T, m))
legend('E(v)','v_{mp}','v_{avg}','v_{rms}','Location','northwest')
