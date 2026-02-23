clearvars; close all;

% Parameters (change as needed)
m = 1.2;            % mass (kg)
g = 9.81;           % gravity (m/s^2)
r = 0.15;           % distance from CM to support axis (m)
theta = 30*pi/180;  % tilt angle (rad), use sin(theta) in simpler formula

% Moments of inertia
Is = 0.02;          % moment of inertia about spin axis (kg·m^2) (I_s)
Ip = 0.01;          % moment of inertia about precession axis (kg·m^2) (I_p)

% Spin rate sweep
omega_s = linspace(0.01, 20, 2000);   % rad/s (avoid zero to prevent singular)
omega_p_simple = (m*g*r*sin(theta)) ./ (Is .* omega_s);  % simple 1/omega_s relation

% General quadratic solutions: compute discriminant and real roots
D = (Is .* omega_s).^2 - 4 .* Ip .* m .* g .* r;
omega_p_quad_plus  = nan(size(omega_s));
omega_p_quad_minus = nan(size(omega_s));

pos = D >= 0;
sqrtD = zeros(size(D));
sqrtD(pos) = sqrt(D(pos));
omega_p_quad_plus(pos)  = (-Is.*omega_s(pos) + sqrtD(pos)) ./ (2*Ip);
omega_p_quad_minus(pos) = (-Is.*omega_s(pos) - sqrtD(pos)) ./ (2*Ip);

% Plot
figure('Color','w','Position',[200 200 800 520]);
hold on; grid on; box on;
% shade region where discriminant < 0 (no real quadratic solution)
xpatch = [omega_s(D<0) fliplr(omega_s(D<0))];
if ~isempty(xpatch)
    % create a subtle shaded band across y-limits
    yl = ylim; if any(isnan(yl)); yl = [ -10 10 ]; end
    patch([omega_s(D<0) fliplr(omega_s(D<0))], [repmat(yl(1),1,sum(D<0)) fliplr(repmat(yl(2),1,sum(D<0)))], ...
          0.95*[1 1 1], 'EdgeColor','none','FaceAlpha',0.35, 'HandleVisibility','off');
end

% plot curves
h1 = plot(omega_s, omega_p_simple, 'b-', 'LineWidth',1.6, 'DisplayName','ω_p = m g r sinθ / (I_s ω_s)');
h2 = plot(omega_s, omega_p_quad_plus,  'r--', 'LineWidth',1.4, 'DisplayName','Quadratic root (+)');
h3 = plot(omega_s, omega_p_quad_minus, 'm-.', 'LineWidth',1.4, 'DisplayName','Quadratic root (−)');

xlabel('\omega_s (rad/s)','Color','k');
ylabel('\omega_p (rad/s)','Color','k');
title('Precession Rate vs Spin Rate','Color','k');

legend([h1 h2 h3],'Location','northeast');
set(gca,'XColor','k','YColor','k','FontSize',11);

% mark stability threshold where discriminant = 0
idx_thresh = find(D>=0, 1, 'first');
if ~isempty(idx_thresh)
    ws_thresh = omega_s(idx_thresh);
    plot([ws_thresh ws_thresh], ylim, 'g:', 'LineWidth',1);
    text(ws_thresh, 0.95*max(omega_p_simple), sprintf('  threshold at \\omega_s=%.2f', ws_thresh), 'Color','k');
end

hold off;