% Spring constant and mass
k = 1;  % Spring constant
m = 1;  % Mass
A = 1;  % Amplitude

% Time range
t = linspace(0, 10, 500);

% Displacement equation (Simple Harmonic Motion)
x = A * cos(sqrt(k/m) * t);

% Velocity equation
v = -A * sqrt(k/m) * sin(sqrt(k/m) * t);

% Elastic Potential Energy
U_spring = 0.5 * k * x.^2;

% Kinetic Energy
K = 0.5 * m * v.^2;

% Total Mechanical Energy
E_total = U_spring + K;

% Plotting
figure('Position', [100, 100, 1000, 600]);
plot(t, U_spring, 'DisplayName', 'Elastic Potential Energy (U\_spring)');
hold on;
plot(t, K, 'DisplayName', 'Kinetic Energy (K)');
plot(t, E_total, 'DisplayName', 'Total Energy (E\_total)', 'LineStyle', '--');

xlabel('Time (t)');
ylabel('Energy (J)');
title('Conservation of Mechanical Energy in a Spring');
legend();
grid on;
hold off;