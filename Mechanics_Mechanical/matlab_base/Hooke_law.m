clearvars; close all;

% Parameters (edit as needed)
k = 2000;        % spring constant (N/m) for F = k * dL
E = 2e11;        % Young's modulus (Pa) (e.g., steel ~200 GPa)
A = 1e-4;        % cross-sectional area (m^2)
L0 = 0.5;        % original length of rod (m)

% ΔL range (m)
dL = linspace(0, 5e-3, 500);   % 0 to 5 mm

% Forces
F_spring = k .* dL;                    % Hooke's law
F_rod    = E .* A .* (dL ./ L0);       % from stress = E * strain -> F = E A dL / L0

% Plot main curves
figure('Color','w','Position',[200 200 700 500]);
plot(dL*1e3, F_rod,    'r--', 'LineWidth',1.6);
xlabel('\DeltaL (mm)', 'Color','k');
ylabel('Force F (N)', 'Color','k');
title('Force vs Extension: Hooke''s Law and Elastic Rod', 'Color','k');
legend('F = E A (\DeltaL / L_0)','Location','northwest');
grid on; box on;
set(gca,'XColor','k','YColor','k','FontSize',11);

% Print key values at a sample extension
dL_sample = 2e-3; % 2 mm
Fs = k * dL_sample;
Fr = E * A * (dL_sample / L0);
fprintf('At ΔL = %.3f mm: F_spring = %.3f N, F_rod = %.3f N, rel diff = %.3e\n',...
        dL_sample*1e3, Fs, Fr, (Fr-Fs)/max(Fr,eps));