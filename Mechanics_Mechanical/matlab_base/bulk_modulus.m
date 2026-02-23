
E = 210e9;                % Young's modulus E (Pa) - change as needed
mu = linspace(-0.49, 0.499, 2000); % Poisson's ratio range (avoid 0.5)
K = E ./ (3 - 6*mu);     % Bulk modulus K

% Mask close-to-singularity values for clean plotting
mask = abs(3 - 6*mu) > 1e-6;
mu_plot = mu(mask);
K_plot  = K(mask);

% Plot K (Pa) vs mu
figure()
plot(mu_plot, K_plot, 'b-', 'LineWidth', 1.6)
grid on
xlabel('\mu (Poisson''s ratio)')
ylabel('Bulk modulus K (Pa)')
title(sprintf('Bulk modulus K = E / (3 - 6\\mu),   E = %.3g Pa', E))

% Secondary figure: K normalized by E
figure()
plot(mu_plot, K_plot./E, 'm-', 'LineWidth', 1.6)
grid on
xlabel('\mu')
ylabel('K / E')
title('Normalized bulk modulus K/E = 1/(3 - 6\mu)')
xlim([min(mu_plot), max(mu_plot)])
