clear;
% Parameters
I = 0.75;         % moment of inertia (kg·m^2)
alpha = 2.0;      % angular acceleration (rad/s^2), constant
omega0 = 0.5;     % initial angular velocity (rad/s)
theta0 = 0.1;     % initial angle (rad)
tmax = 6;         % simulation time (s)
t = linspace(0, tmax, 400);

% Kinematics (analytic)
omega = omega0 + alpha .* t;
theta = theta0 + omega0 .* t + 0.5 .* alpha .* t.^2;
alpha_vec = alpha .* ones(size(t));

% Torque (constant)
tau = I .* alpha_vec;

% Plotting
figure();

ax1 = subplot(4,1,1);
plot(t, theta, 'b-', 'LineWidth',1.6, 'DisplayName','θ(t)'); grid on; ylabel('θ (rad)');
title(sprintf('Rotation with Constant α = %.3g rad/s^2, I = %.3g kg·m^2', alpha, I));
legend('Location','northwest');

ax2 = subplot(4,1,2);
plot(t, omega, 'r-', 'LineWidth',1.6, 'DisplayName','ω(t)'); grid on; ylabel('ω (rad/s)');
legend('Location','northwest');

ax3 = subplot(4,1,3);
plot(t, alpha_vec, 'g-', 'LineWidth',1.6, 'DisplayName','α(t)'); grid on; ylabel('α (rad/s^2)');
legend('Location','northwest');

ax4 = subplot(4,1,4);
plot(t, tau, 'm-', 'LineWidth',1.6, 'DisplayName','τ(t) = I·α'); grid on;
xlabel('Time (s)'); ylabel('Torque τ (N·m)');
legend('Location','northwest');

linkaxes([ax1 ax2 ax3 ax4],'x');  % sync zoom/pan

% Print summary
fprintf('Constant α = %.3f rad/s^2; Torque τ = I·α = %.3f N·m\n', alpha, I*alpha);