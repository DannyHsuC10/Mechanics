
% Plot Mohr's circles for plane stress states (sigma_x, sigma_y, tau_xy)
% Author: concise example

figure;
hold on; axis equal; grid on;
xlabel('\sigma (normal stress, same units as inputs)');
ylabel('\tau (shear stress)');
title('Mohr''s Circle: \tau vs \sigma');

% --- Input: define multiple stress states as rows [sigma_x, sigma_y, tau_xy]
% Example: three different states
states = [
    50e6, 10e6, 15e6;   % state 1
    30e6, -10e6, 5e6;   % state 2
    80e6, 40e6, 0e6     % state 3 (pure normal)
];

nStates = size(states,1);
colors = lines(nStates);

theta_plot = linspace(0,2*pi,400);

for k = 1:nStates
    sx = states(k,1);
    sy = states(k,2);
    t = states(k,3);

    % center and radius of Mohr's circle
    sigma_center = (sx + sy)/2;
    R = sqrt(((sx - sy)/2)^2 + t^2);

    % circle coordinates
    sigma_circle = sigma_center + R*cos(theta_plot);
    tau_circle   =      R*sin(theta_plot);

    % plot circle
    plot(sigma_circle, tau_circle, 'Color', colors(k,:), 'LineWidth', 1.6);

    % principal stresses (points on sigma-axis)
    sigma1 = sigma_center + R;
    sigma2 = sigma_center - R;
    plot([sigma1, sigma2], [0,0], 'o', 'Color', colors(k,:), 'MarkerFaceColor', colors(k,:));

    % plot center
    plot(sigma_center, 0, 'k+', 'MarkerSize',8, 'LineWidth',1.2);

    % annotate
    text(sigma1, 0, sprintf('  \\sigma_{1}^{(%d)}=%.2g', k, sigma1), 'Color', colors(k,:));
    text(sigma2, 0, sprintf('  \\sigma_{2}^{(%d)}=%.2g', k, sigma2), 'Color', colors(k,:));
    text(sigma_center, 0, sprintf('  C_{%d}=%.2g', k, sigma_center), 'Color', 'k');

    % optional: show current state point (sigma_x, tau_xy) and (sigma_y, -tau_xy)
    plot(sx,  t, 's', 'Color', colors(k,:), 'MarkerFaceColor', 'none');
    plot(sy, -t, 'd', 'Color', colors(k,:), 'MarkerFaceColor', 'none');

    legendEntries{k} = sprintf('State %d', k); %#ok<SAGROW>
end

% draw sigma axis horizontal line
ax = gca;
xlims = ax.XLim;
plot(xlims, [0 0], 'k-', 'LineWidth', 0.8);

% annotate shear sign convention
text(mean(xlims), max(ax.YLim)*0.9, '\tau positive up', 'HorizontalAlignment','center');

% finalize legend
legend(legendEntries, 'Location','best');

% Print numeric table of principal stresses
fprintf('State  sigma_x  sigma_y  tau_xy   sigma1    sigma2\n');
for k = 1:nStates
    sx = states(k,1); sy = states(k,2); t = states(k,3);
    sigma_center = (sx + sy)/2;
    R = sqrt(((sx - sy)/2)^2 + t^2);
    sigma1 = sigma_center + R;
    sigma2 = sigma_center - R;
    fprintf('%2d   %8.3e %8.3e %8.3e  %8.3e  %8.3e\n', k, sx, sy, t, sigma1, sigma2);
end

hold off;