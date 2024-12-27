% Set parameters
m = 1; % Mass
k = 1; % Spring constant
omega = sqrt(k / m); % Angular frequency
xm = 1; % Amplitude
phi = 0; % Phase
t = linspace(0, 2 * pi / omega, 1000); % Time range

% Displacement
x = xm * cos(omega * t + phi);

% Kinetic energy
K = 0.5 * m * (omega * xm * sin(omega * t + phi)).^2;

% Potential energy
U = 0.5 * k * (xm * cos(omega * t + phi)).^2;

% Total energy
E = K + U;

% Plotting
figure;
plot(t, K, 'r', 'LineWidth', 1.5); hold on;
plot(t, U, 'b', 'LineWidth', 1.5);
plot(t, E, 'g', 'LineWidth', 1.5);
title('Simple Harmonic Oscillation: Kinetic, Potential, and Total Energy');
xlabel('Time (s)');
ylabel('Energy (J)');
legend('Kinetic Energy', 'Potential Energy', 'Total Energy');
grid on;
