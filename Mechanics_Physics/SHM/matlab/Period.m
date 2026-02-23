% Parameters (change as needed)
k = 200;            % spring constant (N/m)
m = linspace(0.01, 2.0, 400); % mass range (kg), avoid m=0
omega = sqrt(k ./ m);        % angular frequency (rad/s)
T_from_m = 2*pi ./ omega;    % T = 2*pi*sqrt(m/k)

% Plot T vs m
figure;
subplot(1,2,1)
plot(m, T_from_m, 'b-', 'LineWidth', 1.5)
xlabel('Mass m (kg)')
ylabel('Period T (s)')
title(sprintf('T vs m (k = %g N/m)', k))
grid on

% Plot T vs k for fixed mass m0
m0 = 0.5;                       % example fixed mass (kg)
kvec = linspace(10, 1000, 400); % stiffness range (N/m)
T_from_k = 2*pi * sqrt(m0 ./ kvec);

subplot(1,2,2)
plot(kvec, T_from_k, 'r-', 'LineWidth', 1.5)
xlabel('Stiffness k (N/m)')
ylabel('Period T (s)')
title(sprintf('T vs k (m = %g kg)', m0))
grid on

% Optional: separate figure showing T vs omega and marking relation T = 2*pi/omega
figure;
omega_vals = linspace(0.1, 10, 800); % avoid omega=0
T_vs_omega = 2*pi ./ omega_vals;
plot(omega_vals, T_vs_omega, 'm-', 'LineWidth', 1.5)
xlabel('\omega (rad/s)')
ylabel('Period T (s)')
title('T = 2\pi / \omega')
grid on