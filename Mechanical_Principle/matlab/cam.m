
% cam_profile_and_time.m
clear; clf;

% User inputs
RPM = 120;             % cam shaft speed in rpm
N = RPM / 60;          % rev/s
omega = 2*pi * N;      % rad/s

% theta domain for cam geometric plot
theta = linspace(0, 2*pi, 1000);
r_theta = sin(theta) - 2;

% Plot cam in polar coordinates (cam profile)
figure(1);
subplot(2,2,1);
polarplot(theta, r_theta, 'b', 'LineWidth', 1.4);
title('Cam profile: r(\theta) = sin\theta - 2');
% optionally show Cartesian view of profile
subplot(2,2,2);
x = r_theta .* cos(theta);
y = r_theta .* sin(theta);
plot(x, y, 'k', 'LineWidth', 1.4);
axis equal; grid on;
xlabel('x (m)'); ylabel('y (m)');
title('Cam profile (Cartesian)');

% Time domain for dynamic plots: show a few revolutions
t_end = 2 / N;            % simulate two revolutions
dt = t_end / 2000;
t = 0:dt:t_end;

% compute theta(t), r(t), v(t), a(t)
theta_t = omega * t;
r_t = sin(theta_t) - 2;
v_t = cos(theta_t) * omega;      % dr/dt
a_t = -sin(theta_t) * omega^2;   % d2r/dt2

% Plot r, v, a vs time
subplot(2,2,3);
plot(t, r_t, 'b', 'LineWidth', 1.2);
xlabel('Time (s)'); ylabel('r(t) (m)');
title(sprintf('Radius vs time (RPM = %g)', RPM));
grid on;

subplot(2,2,4);
plot(t, v_t, 'r', 'LineWidth', 1.2); hold on;
plot(t, a_t, 'm', 'LineWidth', 1.0);
xlabel('Time (s)'); ylabel('v (m/s) and a (m/s^2)');
legend('v(t) = cos(\theta)\omega', 'a(t) = -sin(\theta)\omega^2', 'Location','best');
title('Velocity and Acceleration vs time');
grid on;

% Zoom one revolution in a separate figure
figure(2);
ind1 = t <= (1/N); % first revolution
plot(t(ind1), r_t(ind1), 'b', 'LineWidth',1.4); hold on;
plot(t(ind1), v_t(ind1), 'r', 'LineWidth',1.1);
plot(t(ind1), a_t(ind1), 'm', 'LineWidth',1.1);
xlabel('Time (s)'); ylabel('r (m), v (m/s), a (m/s^2)');
title(sprintf('Responses over one revolution (RPM = %g)', RPM));
legend('r(t)','v(t)','a(t)');
grid on;

% Print peak values
fprintf('RPM = %g\n', RPM);
fprintf('omega = %.4g rad/s\n', omega);
fprintf('r(t) range: [%.4g, %.4g] m\n', min(r_t), max(r_t));
fprintf('v(t) range: [%.4g, %.4g] m/s\n', min(v_t), max(v_t));
fprintf('a(t) range: [%.4g, %.4g] m/s^2\n', min(a_t), max(a_t));