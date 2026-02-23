
R = 287;               % J/(kg K) for dry air (change for other gases)
cp = 1005;             % J/(kg K) approximate constant-pressure heat capacity
T0 = 300;              % reference temperature (K)
v0 = 0.01;             % reference specific volume (m^3/kg)
s0 = 0;                % reference specific entropy (J/(kg K)) at (T0,v0)

% specific-volume range (m^3/kg)
v = linspace(0.002, 0.1, 800);

% Temperatures for isotherms to plot
T_list = [250, 300, 400, 600]; % K

figure;
hold on
cols = lines(numel(T_list));
for i = 1:numel(T_list)
    T = T_list(i);
    % full formula: s = s0 + cp*ln(T/T0) - R*ln(v/v0)
    s = s0 + cp.*log(T./T0) - R.*log(v./v0);
    plot(v, s, 'Color', cols(i,:), 'LineWidth', 1.4)
end


xlabel('Specific volume v (m^3/kg)')
ylabel('Specific entropy s (J/(kg·K))')
title('Specific Entropy s vs Specific Volume v for an Ideal Gas (air)')
legend_strings = arrayfun(@(T) sprintf('T = %g K',T), T_list, 'UniformOutput',false);
legend(legend_strings,'Location','best')
grid on
hold off