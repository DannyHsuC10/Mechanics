% Plot thread friction f = mu * F_in * csc(theta)
clear; clf;

% --- User inputs
mu = 0.15;        % friction coefficient
F_in = 100;       % input axial force (N)
theta_deg = linspace(1,90,1000);   % thread helix/lead angle in degrees (avoid 0 and 180)
theta = deg2rad(theta_deg);

% compute f
f_theta = mu * F_in ./ sin(theta);  % = mu * F_in * csc(theta)

% --- Plots
subplot(1,2,1);
plot(theta_deg, f_theta, 'b-', 'LineWidth', 1.4);
xlabel('\theta (deg)'); ylabel('f (N)');
title(sprintf('f(\\theta) = \\mu F_{in} csc\\theta  (\\mu=%.3g, F_{in}=%.3g N)', mu, F_in));
grid on;
xlim([min(theta_deg) max(theta_deg)]);
ylim([0 1.2*max(f_theta(~isinf(f_theta) & ~isnan(f_theta)))]);

% mark a few example angles
example_deg = [5, 15, 30, 45, 60, 90];
hold on;
plot(example_deg, mu*F_in./sin(deg2rad(example_deg)), 'ro', 'MarkerFaceColor','r');
for k = 1:numel(example_deg)
    text(example_deg(k), mu*F_in./sin(deg2rad(example_deg(k))) * 1.03, ...
        sprintf(' %d°', example_deg(k)), 'FontSize',9);
end
hold off;

% log-y to show divergence near 0 and 180
subplot(1,2,2);
semilogy(theta_deg, f_theta, 'm-', 'LineWidth', 1.4);
xlabel('\theta (deg)'); ylabel('f (N) (log scale)');
title('Log-scale view (high sensitivity near small angles)');
grid on;
xlim([min(theta_deg) max(theta_deg)]);

% --- Print key values
fprintf('mu = %g, F_in = %g N\n', mu, F_in);
for ang = [5, 15, 30, 45, 60, 90]
    fprintf('theta=%3d°: f=%.6g N\n', ang, mu*F_in/sin(deg2rad(ang)));
end