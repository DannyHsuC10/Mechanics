clear;

v0 = 20; % Initial velocity (m/s)
theta = 45; % Launch angle (degrees)
g = 9.81; % Gravitational acceleration (m/s^2)

% Convert launch angle to radians
theta = deg2rad(theta);

% Calculate time parameters for motion
t_flight = 2 * v0 * sin(theta) / g; % Total flight time
t = linspace(0, t_flight, 100); % Time vector

% Calculate projectile motion trajectory
x = v0 * cos(theta) * t; % Horizontal displacement
y = v0 * sin(theta) * t - 0.5 * g * t.^2; % Vertical displacement

% Plot the trajectory
figure;
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('Horizontal Displacement (m)');
ylabel('Vertical Displacement (m)');
title('Projectile Motion Trajectory');
grid on;

% Set the plot limits
xlim([0 max(x)]);
ylim([0 max(y)]);
