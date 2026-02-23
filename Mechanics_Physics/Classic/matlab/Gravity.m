clearvars; close all;

% Constants / parameters
G  = 6.67430e-11;        % gravitational constant (m^3/kg/s^2)
Me = 5.972e24;           % Earth mass (kg)
R  = 6.371e6;            % Earth radius (m) - use earthRadius if available
m  = 80;                 % test mass (kg)

% radial vector: from 0 to some multiple of R (avoid exact 0 for division)
r_out = linspace(R*0.99, 5*R, 800);   % outside region (close to R to 5R)
r_in  = linspace(0, R, 400);          % inside region including r=0

% Inside: M(r) = Me * (r^3 / R^3) -> F = G * M(r) * m / r^2 = G * Me * m / R^3 * r
% At r=0, the expression is linear -> F(0)=0
F_in = (G * Me * m / R^3) .* r_in;

% Outside: F = G * Me * m / r^2
% Avoid r==0; r_out starts near R
F_out = (G * Me * m) ./ (r_out.^2);

% Combined arrays for a single plot (optional)
r_comb = [r_in, r_out];
F_comb = [F_in, F_out];

% Plot linear scale
figure('Color','w');
plot(r_in./1e3, F_in, 'b-', 'LineWidth',1.8); hold on;
plot(r_out./1e3, F_out, 'r--', 'LineWidth',1.6);
plot(R/1e3, (G*Me*m/R^2), 'ko', 'MarkerFaceColor','y'); % surface marker
xlabel('r (km)','Color','k');
ylabel('F (N)','Color','k');
title('Gravitational Force Inside and Outside Earth (linear scale)','Color','k');
legend('Inside (F \propto r)','Outside (F \propto 1/r^2)','Surface','Location','northeast');
grid on; box on; set(gca,'XColor','k','YColor','k');

% Annotate key values
F_surface = G*Me*m / R^2;
fprintf('At surface r = %.3e m: F = %.3e N (g = %.3e m/s^2)\n', R, F_surface, F_surface/m);

% Optional: show ratio inside linear coefficient
k_inside = G*Me*m / R^3;
fprintf('Inside linear coefficient: F = k*r with k = %.3e N/m\n', k_inside);