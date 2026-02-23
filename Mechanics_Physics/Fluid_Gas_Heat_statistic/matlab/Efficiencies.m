clear
% Carnot_vs_Tc.m
Th = 500;                 % Hot reservoir temperature (K) -- change as needed
Tc = linspace(1, Th-1, 500); % Cold reservoir temperature (K), avoid Tc = Th

% Carnot ideal efficiencies / COPs
eta_engine = 1 - Tc./Th;           % engine efficiency (dimensionless)
COP_refrigerator = Tc./(Th - Tc);  % refrigerator COP (dimensionless)
COP_heatpump = Th./(Th - Tc);      % heat pump COP (dimensionless)

% Plot
figure('Color','w','Position',[200 200 800 500])
yyaxis left
plot(Tc, eta_engine, 'b-', 'LineWidth', 1.6)
ylabel('Engine efficiency \eta (dimensionless)')
ylim([0 1])

yyaxis right
plot(Tc, COP_refrigerator, 'r--', 'LineWidth', 1.4)
hold on
plot(Tc, COP_heatpump, 'm-.', 'LineWidth', 1.4)
ylabel('COP (refrigerator / heat pump)')
ylim([0 max(COP_heatpump(~isinf(COP_heatpump)))*1.1])

xlabel('Cold-reservoir temperature T_c (K)')
title(sprintf('Carnot Efficiencies / COP vs T_c (T_h = %g K)', Th))
legend('\eta_{engine}','COP_{refrigerator}','COP_{heat pump}','Location','northwest')
grid on
hold off