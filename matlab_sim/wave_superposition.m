% Define parameters
t = linspace(0, 2*pi, 1000); % Time range
ym = 1; % Amplitude
k = 2*pi/1; % Wave number
omega = 2*pi/10; % Angular frequency
phi = pi/0.7; % Phase difference

% Define two waves
y1 = ym * sin(k * t - omega * t);
y2 = ym * sin(k * t - omega * t + phi);

% Combined wave
y_combined = y1 + y2;

% Plotting
figure;

% First wave
subplot(3,1,1);
plot(t, y1);
title('Wave 1');
xlabel('Time (t)');
ylabel('Amplitude (y1)');

% Second wave
subplot(3,1,2);
plot(t, y2);
title('Wave 2');
xlabel('Time (t)');
ylabel('Amplitude (y2)');

% Combined wave
subplot(3,1,3);
plot(t, y_combined);
title('Combined Wave');
xlabel('Time (t)');
ylabel('Amplitude (y1 + y2)');

% Adjust figure appearance
set(gcf, 'Position', [100, 100, 800, 600]);
