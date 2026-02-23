clear;
% Set time range
t = linspace(0, 10, 100); % 100 points from 0 to 10 seconds

% Set constant acceleration
a = 2; % Acceleration is 2 m/s^2

% Calculate velocity and position
v = a * t; % Velocity = Acceleration * Time
x = 0.5 * a * t.^2; % Position = 0.5 * Acceleration * Time^2

% Create figure window
figure;

% Plot acceleration-time graph
subplot(3, 1, 1);
plot(t, a * ones(size(t)));
title('Acceleration-Time Graph');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

% Plot velocity-time graph
subplot(3, 1, 2);
plot(t, v);
title('Velocity-Time Graph');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

% Plot position-time graph
subplot(3, 1, 3);
plot(t, x);
title('Position-Time Graph');
xlabel('Time (s)');
ylabel('Position (m)');

