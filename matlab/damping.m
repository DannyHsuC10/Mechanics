% Set parameters
m = 1; % Mass
k = 1; % Spring constant
b_critical = 2 * sqrt(k * m); % Critical damping coefficient
b_overdamped = 2 * b_critical; % Overdamping coefficient
b_underdamped = 0.5 * b_critical; % Underdamping coefficient

t = linspace(0, 10, 1000); % Time range

% Underdamping case
gamma_under = b_underdamped / (2 * m);
omega_undamped = sqrt(k / m - gamma_under^2);
x_under = exp(-gamma_under * t) .* (cos(omega_undamped * t) + sin(omega_undamped * t));

% Critical damping case
gamma_critical = b_critical / (2 * m);
x_critical = exp(-gamma_critical * t) .* (1 + gamma_critical * t);

% Overdamping case
gamma_over = b_overdamped / (2 * m);
lambda1 = -gamma_over + sqrt(gamma_over^2 - k / m);
lambda2 = -gamma_over - sqrt(gamma_over^2 - k / m);
C1 = 0.5; % Constant based on initial conditions
C2 = 0.5; % Constant based on initial conditions
x_over = C1 * exp(lambda1 * t) + C2 * exp(lambda2 * t);

% Plotting
figure;
plot(t, x_under, 'r', 'LineWidth', 1.5); hold on;
plot(t, x_critical, 'g', 'LineWidth', 1.5);
plot(t, x_over, 'b', 'LineWidth', 1.5);
title('Damped Simple Harmonic Oscillation');
xlabel('Time (s)');
ylabel('Displacement (x)');
legend('Underdamped', 'Critically Damped', 'Overdamped');
grid on;
