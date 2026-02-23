clearvars; close all;

% Parameters (change if needed)
Re = 2000;           % target Reynolds number (based on mean velocity)
nu = 1e-6;           % kinematic viscosity (m^2/s), e.g., water at ~20°C
D = 0.05;            % pipe diameter (m)
R = D/2;

% Compute mean velocity from Re
Umean = Re * nu / D;    % U_mean = Re * nu / D

% Radial coordinate and distance from wall
nr = 800;
r = linspace(0, R, nr);      % r = 0 (center) to R (wall)
y = R - r;                   % distance from wall (0 at wall, R at center)

% Laminar profile
Umax_lam = 2 * Umean;                    % Umax = 2 Umean for parabolic profile
u_lam = Umax_lam .* (1 - (r./R).^2);

% Turbulent power-law profiles (u/Umax = (1 - r/R)^(1/n))
ns = [6, 7, 10];   % typical exponents (n larger -> fuller profile)
u_turb = zeros(length(ns), numel(r));
Umax_turb = zeros(size(ns));

for i = 1:length(ns)
    n = ns(i);
    % Determine Umax such that mean velocity = Umean:
    % Umean = (2/R^2) * integral_0^R u(r) r dr
    % with u = Umax * (1 - r/R)^(1/n)
    % compute integral numerically to get Umax = Umean / factor
    u_test = (1 - (r./R)).^(1/n);  % shape
    % compute mean factor via area-weighted radial integral
    factor = (2/(R^2)) * trapz(r, u_test .* r);
    Umax_turb(i) = Umean / factor;
    u_turb(i,:) = Umax_turb(i) .* u_test;
end

% Plot u vs distance from wall (y)
figure;
hold on; box on; grid on;
plot(y, u_lam, 'b-', 'LineWidth',1.6, 'DisplayName','Laminar (parabolic)');
colors = lines(length(ns));
for i = 1:length(ns)
    plot(y, u_turb(i,:), '--', 'Color', colors(i,:), 'LineWidth',1.4, ...
         'DisplayName', sprintf('Turbulent n=%d', ns(i)));
end
xlabel('Distance from wall y (m)');
ylabel('Axial velocity u(y) (m/s)');
title(sprintf('Velocity profile at constant Re = %.0f (D = %.3f m)', Re, D));
legend('Location','northeast');
xlim([0 R]);
set(gca,'FontSize',11);

% Optional: normalized plot u/Umean vs y/R
figure;
plot(y./R, u_lam./Umean, 'b-', 'LineWidth',1.6, 'DisplayName','Laminar');
hold on; grid on; box on;
for i = 1:length(ns)
    plot(y./R, u_turb(i,:)./Umean, '--', 'Color', colors(i,:), 'LineWidth',1.4, ...
         'DisplayName', sprintf('Turb n=%d (Umax=%.2g m/s)', ns(i), Umax_turb(i)));
end
xlabel('y / R (distance from wall normalized)');
ylabel('u / U_{mean}');
title('Normalized velocity profiles (same Re, same U_{mean})');
legend('Location','northeast');
xlim([0 1]); set(gca,'FontSize',11);

% Print summary
fprintf('Re = %.0f, nu = %.2e m^2/s, D = %.3f m -> U_mean = %.3e m/s\n', Re, nu, D, Umean);
fprintf('Laminar: Umax = %.3e m/s (Umax/Umean = %.2f)\n', Umax_lam, Umax_lam/Umean);
for i=1:length(ns)
    fprintf('Turb n=%d: Umax = %.3e m/s (Umax/Umean = %.2f)\n', ns(i), Umax_turb(i), Umax_turb(i)/Umean);
end