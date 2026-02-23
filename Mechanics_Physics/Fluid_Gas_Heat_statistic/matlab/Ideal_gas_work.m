clearvars;
n_moles = 1.0;        % moles
R = 8.314;            % J/(mol K)
T = 300;              % K (isothermal)
V1 = 0.01;            % m^3 initial volume
V = linspace(0.005,0.05,500); % volumes to evaluate

% Isothermal work from V1 to V
W_iso = n_moles * R * T * log(V ./ V1);

% Polytropic example (n_poly != 1)
n_poly = 1.3;         % polytropic exponent
P1 = n_moles * R * T / V1;
C = P1 * V1^n_poly;
W_poly = C ./ (1 - n_poly) .* (V.^(1-n_poly) - V1.^(1-n_poly));

figure
plot(V, W_iso, 'b-', 'LineWidth', 1.5)
hold on
plot(V, W_poly, 'r--', 'LineWidth', 1.5)
xlabel('Volume V (m^3)')
ylabel('Work W (J)')
title('Ideal-Gas Work W vs Volume V')
legend('Isothermal (n=1)','Polytropic (n=1.3)','Location','best')
grid on
hold off