% Set parameters
xm_original = 1; % Original amplitude
omega_original = 2 * pi; % Original angular frequency
phi_original = 0; % Original phase
t = linspace(0, 2, 1000); % Time range

% Original vibration plot
x_original = xm_original * cos(omega_original * t + phi_original);

% Parameters for changed amplitude, frequency, and phase
xm_new = 1.5; % New amplitude
omega_new = 3 * pi; % New angular frequency
phi_new = pi/4; % New phase

% Vibration plot with changed amplitude
x_amplitude = xm_new * cos(omega_original * t + phi_original);

% Vibration plot with changed frequency
x_frequency = xm_original * cos(omega_new * t + phi_original);

% Vibration plot with changed phase
x_phase = xm_original * cos(omega_original * t + phi_new);

% Plotting
figure;

% Original plot
subplot(2, 2, 1);
plot(t, x_original, 'b', 'LineWidth', 1.5);
title('Original Vibration Plot');
xlabel('Time (s)');
ylabel('Displacement');
grid on;

% Amplitude-changed plot
subplot(2, 2, 2);
plot(t, x_amplitude, 'r', 'LineWidth', 1.5);
title('Amplitude-Changed Vibration Plot');
xlabel('Time (s)');
ylabel('Displacement');
grid on;

% Frequency-changed plot
subplot(2, 2, 3);
plot(t, x_frequency, 'g', 'LineWidth', 1.5);
title('Frequency-Changed Vibration Plot');
xlabel('Time (s)');
ylabel('Displacement');
grid on;

% Phase-changed plot
subplot(2, 2, 4);
plot(t, x_phase, 'm', 'LineWidth', 1.5);
title('Phase-Changed Vibration Plot');
xlabel('Time (s)');
ylabel('Displacement');
grid on;

% Comparison plot
figure;
plot(t, x_original, 'b', 'LineWidth', 1.5);
hold on;
plot(t, x_amplitude, 'r', 'LineWidth', 1.5);
plot(t, x_frequency, 'g', 'LineWidth', 1.5);
plot(t, x_phase, 'm', 'LineWidth', 1.5);
title('Comparison of Original and Changed Vibration Plots');
xlabel('Time (s)');
ylabel('Displacement');
legend('Original Plot', 'Amplitude-Changed Plot', 'Frequency-Changed Plot', 'Phase-Changed Plot');
grid on;
