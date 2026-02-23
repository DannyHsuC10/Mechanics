clearvars; close all;

% Parameters (change as needed)
G = 6.67430e-11;    % gravitational constant (m^3/kg/s^2)
M = 5.972e24;       % central mass (kg), e.g., Earth
m = 100;            % test mass (kg)

% radial range (avoid r=0). Use from near-surface to many radii.
R = 6.371e6;                % reference radius (m), e.g., Earth radius
r_min = 1.01 * R;           % just above surface
r_max = 50 * R;             % far field
r = linspace(r_min, r_max, 1000);

% Energies
U = - (G .* M .* m) ./ r;       % potential energy
K =   (G .* M .* m) ./ (2 .* r); % kinetic energy for circular orbit
E = K + U;                       % total energy = -GMm/(2r) (negative)

% Plot linear scale
figure('Color','w');
subplot(1,2,1);
plot(r./R, U, 'b-', 'LineWidth',1.6); hold on;
plot(r./R, K, 'r--', 'LineWidth',1.6);
plot(r./R, E, 'k-.', 'LineWidth',1.6);
xlabel('r / R (radius units)','Color','k');
ylabel('Energy (J)','Color','k');
title('Energies vs r (linear scale)','Color','k');
legend('U = -GMm/r','K = GMm/(2r)','E = -GMm/(2r)','Location','northeast');
grid on; box on; set(gca,'XColor','k','YColor','k');

% Annotate sample (surface) values
r_surf = R * 1.01;
U_surf = -G*M*m / r_surf;
K_surf =  G*M*m / (2*r_surf);
E_surf = U_surf + K_surf;
plot(r_surf./R, U_surf, 'bo', 'MarkerFaceColor','c');
plot(r_surf./R, K_surf, 'ro', 'MarkerFaceColor','r');
plot(r_surf./R, E_surf, 'ko', 'MarkerFaceColor','y');
text(r_surf./R*1.02, E_surf, sprintf('  E=%.3e J', E_surf), 'Color','k');

% Plot log-log to show 1/r scaling
subplot(1,2,2);
loglog(r./R, abs(U), 'b-', 'LineWidth',1.6); hold on;    % plot magnitudes for log scale
loglog(r./R, K,      'r--', 'LineWidth',1.6);
loglog(r./R, abs(E), 'g-.', 'LineWidth',1.6);
xlabel('r / R','Color','k');
ylabel('|Energy| (J)','Color','k');
title('Magnitudes on log-log scale (1/r scaling)','Color','k');
legend('|U|','K','|E|','Location','northeast');
grid on; box on; set(gca,'XColor','k','YColor','k');

% Print sample numeric values
fprintf('Sample at r = %.3f R:\n  U = %.6e J\n  K = %.6e J\n  E = %.6e J\n', r_surf./R, U_surf, K_surf, E_surf);