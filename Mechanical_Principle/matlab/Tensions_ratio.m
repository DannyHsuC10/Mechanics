% Tensions ratio
% Plot tension ratio R = F2/F1 = exp(mu * theta) versus mu for given theta values.
clear; clf;

% --- User inputs
mu = linspace(0, 0.5, 501);    % range of friction coefficient (dimensionless)
theta_list_deg = [30, 90, 180]; % wrap angles to plot (degrees)
theta_list = deg2rad(theta_list_deg); % convert to radians

% Precompute ratios
R = exp(mu(:) * theta_list(:)'); % size length(mu) x length(theta_list)

% --- Plot linear scale
figure(1)
plot(mu, R, 'LineWidth', 1.6);
xlabel('\mu'); ylabel('R = F_2 / F_1');
title('Tension ratio vs \mu (linear scale)');
grid on;
legend(arrayfun(@(d) sprintf('\\theta = %d^\\circ', d), theta_list_deg, 'UniformOutput', false), ...
    'Location','northwest');