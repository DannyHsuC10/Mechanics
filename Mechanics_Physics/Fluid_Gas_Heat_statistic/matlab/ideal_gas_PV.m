clearvars; close all;

% Parameters (edit as needed)
P0 = 1e5;       % reference pressure (Pa)
V0 = 1.0;       % reference volume (m^3)
gamma = 1.4;    % heat capacity ratio
Vf = 3 * V0;    % final volume for processes (choose > V0)
V = linspace(0.5*V0, Vf, 600);  % volume axis for curves

% Common curves
P_isothermal = P0 .* (V0 ./ V);           % isotherm (for free expansion reference)
P_adiabatic  = P0 .* (V0 ./ V).^gamma;    % adiabatic

% 1) Adiabatic
figure('Name','Adiabatic','NumberTitle','off');
plot(V, P_adiabatic, 'r-', 'LineWidth',1.8);
xlabel('V (m^3)'); ylabel('P (Pa)');
title('Adiabatic: P V^{\gamma} = const');
grid on; box on;
xlim([min(V) Vf]);
ylim([0 max(P_adiabatic)*1.05]);

% 2) Isochoric (V = const) - vertical line at V0 and markers for states
figure('Name','Isochoric','NumberTitle','off');
% draw an example pressure range
P_range = linspace(0.2*P0, 2*P0, 200);
plot( V0 * ones(size(P_range)), P_range, 'g-', 'LineWidth',1.8 ); hold on;
% mark two states (e.g., heating increases P at constant V)
plot(V0, P0, 'ko', 'MarkerFaceColor','y');
plot(V0, 1.6*P0, 'ks', 'MarkerFaceColor','c');
xlabel('V (m^3)'); ylabel('P (Pa)');
title('Isochoric: V = const');
text(V0*1.02, P0, '  (P_0,V_0)');
text(V0*1.02, 1.6*P0, '  (heated state)');
grid on; box on;
xlim([min(V) Vf]);
ylim([min(P_range) max(P_range)]);

% 3) Isobaric (P = const) - horizontal line at P0 and markers for states
figure('Name','Isobaric','NumberTitle','off');
plot( V, P0 * ones(size(V)), 'm-', 'LineWidth',1.8 ); hold on;
% mark two states (e.g., expansion at constant pressure)
plot(V0, P0, 'ko', 'MarkerFaceColor','y');
plot(Vf, P0, 'ks', 'MarkerFaceColor','c');
xlabel('V (m^3)'); ylabel('P (Pa)');
title('Isobaric: P = const');
text(V0, P0*1.02, '  (initial)');
text(Vf, P0*1.02, '  (expanded)');
grid on; box on;
xlim([min(V) Vf]);
ylim([0 max(P0*1.2, max(P_isothermal)*0.2)]);

% 4) Free Expansion (irreversible) - show initial & final equilibrium states
figure('Name','Free Expansion','NumberTitle','off');
% plot isotherm for reference (free expansion of ideal gas final lies on same isotherm)
plot(V, P_isothermal, 'b-', 'LineWidth',1.4); hold on;
% initial and final equilibrium points
P_final = P0 * V0 / Vf;    % ideal gas, same T => Pf = P0 V0 / Vf
plot(V0, P0, 'ko', 'MarkerFaceColor','y', 'DisplayName','Initial');
plot(Vf, P_final, 'ks', 'MarkerFaceColor','c', 'DisplayName','Final');
% annotate and indicate no quasi-static path (dashed guide only)
plot([V0 Vf], [P0 P_final], 'k:', 'LineWidth',1.0);
xlabel('V (m^3)'); ylabel('P (Pa)');
title('Free Expansion (Joule): initial and final equilibrium states');
legend('Isotherm (reference)','Initial','Final','Guide (non-quasi-static)','Location','northeast');
grid on; box on;
xlim([min(V) Vf]);
ylim([0 max(P_isothermal)*1.05]);
