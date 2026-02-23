clear;
% Parameters
R  = 2;           % radius (m)
v_range = linspace(0,10,200);   % range of speeds for a_c plot (m/s)

% Compute centripetal acceleration
a_c = v_range.^2 ./ R;

% Parameters for circular motion (to show v_x and v_y)
v0 = 5;           % constant speed for circular motion (m/s)
omega = v0 / R;   % angular speed (rad/s) for circular motion
t = linspace(0,2*pi/omega,400); % one revolution

% Velocity components for uniform circular motion (v is tangential)
vx = -v0 * sin(omega*t);   % vx(t)
vy =  v0 * cos(omega*t);   % vy(t)

% Create tiled layout
tiledlayout(1,2,'Padding','compact','TileSpacing','compact')

% Left: a_c vs v
nexttile
plot(v_range, a_c, 'b-', 'LineWidth',1.5)
xlabel('Speed v (m/s)')
ylabel('Centripetal acceleration a_c (m/s^2)')
title('a_c = v^2 / R')
grid on

% Right: v_x and v_y vs time
nexttile
plot(t, vx, 'r-', 'LineWidth',1.2)
hold on
plot(t, vy, 'g--', 'LineWidth',1.2)
hold off
xlabel('Time t (s)')
ylabel('Velocity components (m/s)')
legend('v_x','v_y')
title(sprintf('Velocity components (v_0 = %.1f m/s, R = %.1f m)', v0, R))
grid on