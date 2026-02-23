clear;

t = linspace(0, 10, 100); % Time vector (s)
v0_1 = 10; % Initial velocity of object 1 (m/s)
a1 = 2; % Acceleration of object 1 (m/s^2)
v0_2 = 5; % Initial velocity of object 2 (m/s)
a2 = -1; % Acceleration of object 2 (m/s^2)

% Calculate the displacement of the two objects
x1 = v0_1 * t + 0.5 * a1 * t.^2; % Displacement of object 1 (m)
x2 = v0_2 * t + 0.5 * a2 * t.^2; % Displacement of object 2 (m)

% Calculate relative displacement
relative_displacement = x1 - x2;

% Plot the displacements
figure;
plot(t, x1, 'b-', 'LineWidth', 2); hold on;
plot(t, x2, 'r-', 'LineWidth', 2);
plot(t, relative_displacement, 'g--', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Relative Motion Simulation');
legend('Displacement of object 1', 'Displacement of object 2', 'Relative displacement');
grid on;

% Set plot limits
xlim([0 max(t)]);
ylim([min([x1 x2 relative_displacement]) max([x1 x2 relative_displacement])]);
