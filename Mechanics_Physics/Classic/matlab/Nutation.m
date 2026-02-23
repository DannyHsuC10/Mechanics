% nutation_vs_precession_fixed.m
clearvars; close all;

%% Parameters
theta0 = 30*pi/180;    % mean tilt angle (rad)
A = 5*pi/180;          % nutation amplitude (rad)
omega_n = 20;          % nutation angular frequency (rad/s)
omega_s = 200;         % spin rate (rad/s)

m = 1.2; g = 9.81; r = 0.15;
Is = 0.02; Ip = 0.01;

%% Precession rate (steady approximation)
omega_p = (m*g*r*sin(theta0)) / (Is * omega_s);

%% Time
T = 2*pi/omega_p;
tmax = 6*T;
t = linspace(0, tmax, 3000);

%% Kinematics
phi   = omega_p .* t;
theta = theta0 + A .* cos(omega_n .* t);

phi_unwrapped = mod(phi, 2*pi);

%% Plot phase curve
figure('Color','w','Position',[200 200 750 480]);
plot(phi_unwrapped, theta, 'b-', 'LineWidth',1.5);
hold on;
grid on; box on;
xlabel('\phi (rad)');
ylabel('\theta (rad)');
title('\theta vs \phi with Direction Arrows');

%% --- Correct arrow computation ---

% time derivatives
dphi_dt   = gradient(phi, t);
dtheta_dt = gradient(theta, t);

% choose number of arrows
n_arrows = 40;
step = max(1, floor(length(t)/n_arrows));
idx = 1:step:length(t);

% normalize arrow length for nice visualization
mag = sqrt(dphi_dt.^2 + dtheta_dt.^2);
dphi_norm   = dphi_dt ./ mag;
dtheta_norm = dtheta_dt ./ mag;

scale = 0.15;  % arrow length scaling factor

quiver(phi_unwrapped(idx), ...
       theta(idx), ...
       scale*dphi_norm(idx), ...
       scale*dtheta_norm(idx), ...
       0, 'g', 'LineWidth',1);

hold off;

%% Time plots
figure('Color','w','Position',[200 200 750 500]);

subplot(2,1,1);
plot(t, theta, 'r','LineWidth',1.3);
ylabel('\theta (rad)');
title('\theta(t)');
grid on;

subplot(2,1,2);
plot(t, phi, 'b','LineWidth',1.3);
xlabel('t (s)');
ylabel('\phi (rad)');
title('\phi(t)');
grid on;
