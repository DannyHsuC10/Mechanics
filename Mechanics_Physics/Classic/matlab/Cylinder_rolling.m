clearvars; close all;

% Parameters
R = 0.5;           % radius (m)
v = 1.0;           % linear speed of center (m/s)
omega = v / R;     % angular speed (rad/s)
tmax = 6;          % seconds
t = linspace(0, tmax, 1000);

% Kinematics (cycloid) for point initially at contact (bottom) at t=0
theta = omega .* t;              % rotation angle
x = R .* (theta - sin(theta));   % x(t)
y = R .* (1 - cos(theta));       % y(t)

% Velocities
vx = R .* omega .* (1 - cos(theta));
vy = R .* omega .* sin(theta);

% Accelerations
ax = R .* omega.^2 .* sin(theta);
ay = R .* omega.^2 .* cos(theta);
a_mag = sqrt(ax.^2 + ay.^2);

% Plots
figure();

% 1: Trajectory and instantaneous point markers
ax1 = subplot(3,2,1);
plot(x, y, 'b-', 'LineWidth',1.4); hold on
axis equal; grid on
xlabel('x (m)'); ylabel('y (m)');
title('Cycloid Trajectory of Rim Point');
% mark a few sample points
idx = round(linspace(1, numel(t), 9));
plot(x(idx), y(idx), 'ko', 'MarkerFaceColor','k', 'HandleVisibility','off');

% 2: angle and angular speed
ax2 = subplot(3,2,2);
plot(t, theta, 'b-', 'LineWidth',1.4); hold on
plot(t, omega*ones(size(t)), 'r--', 'LineWidth',1.2');
xlabel('Time (s)'); ylabel('θ (rad) / ω (rad/s)');
title('Rotation Angle and ω (constant)');
legend('θ(t)','ω','Location','northwest'); grid on

% 3: positions vs time
ax3 = subplot(3,2,3);
plot(t, x, 'b-', 'LineWidth',1.4); hold on
plot(t, y, 'r--', 'LineWidth',1.4);
xlabel('Time (s)'); ylabel('Position (m)');
title('x(t) and y(t)');
legend('x(t)','y(t)','Location','best'); grid on

% 4: velocities vs time
ax4 = subplot(3,2,4);
plot(t, vx, 'b-', 'LineWidth',1.4); hold on
plot(t, vy, 'r--', 'LineWidth',1.4);
xlabel('Time (s)'); ylabel('Velocity (m/s)');
title('vx(t) and vy(t)');
legend('v_x','v_y','Location','best'); grid on

% 5: accelerations vs time (components)
ax5 = subplot(3,2,5);
plot(t, ax, 'b-', 'LineWidth',1.4); hold on
plot(t, ay, 'r--', 'LineWidth',1.4);
xlabel('Time (s)'); ylabel('Acceleration (m/s^2)');
title('a_x(t) and a_y(t)');
legend('a_x','a_y','Location','best'); grid on

% 6: acceleration magnitude and normal/tangential
ax6 = subplot(3,2,6);
plot(t, a_mag, 'k-', 'LineWidth',1.4); hold on
% For pure rolling with constant ω, tangential accel = R*alpha = 0
plot(t, R*omega^2*ones(size(t)), 'm--', 'LineWidth',1.2); % constant normal magnitude R ω^2
xlabel('Time (s)'); ylabel('|a| (m/s^2)');
title('Acceleration magnitude |a| and normal R ω^2');
legend('|a|','R ω^2 (normal)', 'Location','best'); grid on

linkaxes([ax3 ax4 ax5 ax6],'x');  % sync time-domain axes