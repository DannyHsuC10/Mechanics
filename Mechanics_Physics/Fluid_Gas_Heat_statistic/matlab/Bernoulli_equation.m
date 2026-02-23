clearvars; close all;

% Parameters (change as needed)
rho = 1000;        % fluid density (kg/m^3), e.g., water
g   = 9.81;        % gravity (m/s^2)
P0  = 101325;      % reference pressure (Pa)
v0  = 1.0;         % reference velocity (m/s)
z0  = 0;           % reference elevation (m)

% If you want to include elevation change: use z array and compute P accordingly
z = z0;            % set constant elevation here

% Velocity range
vmax = 10;                        % m/s
v = linspace(0, vmax, 800);

% Pressure from Bernoulli at same elevation
P = P0 + 0.5 .* rho .* (v0.^2 - v.^2) + rho .* g .* (z0 - z);

% Also compute dynamic pressure q = 0.5 rho v^2
q = 0.5 .* rho .* v.^2;

% Plot P vs v (linear) and P vs v^2 (linear relation)
figure;

subplot(1,2,1);
plot(v, P, 'b-', 'LineWidth',1.6); hold on;
plot(v, P0 - q + 0.5*rho*v0^2, 'b:','LineWidth',1.2); % same curve (explicit)
xlabel('v (m/s)'); ylabel('P (Pa)');
title('Pressure P vs Velocity v (Bernoulli)');
grid on; box on;
% annotate reference point
plot(v0, P0, 'ko', 'MarkerFaceColor','y');
text(v0, P0, sprintf('  (v_0=%.2g m/s, P_0=%.0f Pa)', v0, P0));

subplot(1,2,2);
plot(v.^2, P, 'r-', 'LineWidth',1.6); hold on;
% linear fit to emphasise straight-line relation P = const - 0.5 rho v^2
pcoef = polyfit(v.^2, P, 1);
plot(v.^2, polyval(pcoef, v.^2), 'k--', 'LineWidth',1.2);
xlabel('v^2 (m^2/s^2)'); ylabel('P (Pa)');
title('P vs v^2 (linear relation)');
legend('P(v)','linear fit','Location','northeast');
grid on; box on;

% Print slope expectation and numeric check
slope_expected = -0.5 * rho;
slope_fit = pcoef(1);
fprintf('Expected slope dP/d(v^2) = %.3e Pa/(m^2/s^2)\n', slope_expected);
fprintf('Fitted slope = %.3e (close to expected)\n', slope_fit);