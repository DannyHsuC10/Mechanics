% Maxwell-Boltzmann speed distribution with markers for v_mp, v_avg, v_rms
k = 1.380649e-23;       % Boltzmann constant J/K
T = 300;                % temperature K
M = 28.0134e-3;         % molar mass for N2 kg/mol (example)
NA = 6.02214076e23;     % Avogadro
m = M / NA;             % mass of one molecule kg

% characteristic speeds
v_mp  = sqrt(2*k*T / m);
v_avg = sqrt(8*k*T / (pi*m));
v_rms = sqrt(3*k*T / m);

% speed range
vmax = 1.5 * v_rms;
v = linspace(0, vmax, 800);

% Maxwell-Boltzmann speed PDF
pref = 4*pi * (m/(2*pi*k*T))^(3/2);
f = pref .* v.^2 .* exp(-m .* v.^2 ./ (2*k*T));

% plot
figure;
plot(v, f, 'b-', 'LineWidth', 1.5)
hold on
yl = ylim;

% vertical lines and labels
xline(v_mp,  'r--','LineWidth',1.2);
xline(v_avg, 'g--','LineWidth',1.2);
xline(v_rms, 'm--','LineWidth',1.2);

% annotate numeric values
text(v_mp, 0.9*yl(2), sprintf('v_{mp}=%.1f m/s', v_mp),'Color','r','HorizontalAlignment','center')
text(v_avg,0.75*yl(2), sprintf('v_{avg}=%.1f m/s', v_avg),'Color','g','HorizontalAlignment','center')
text(v_rms,0.6*yl(2), sprintf('v_{rms}=%.1f m/s', v_rms),'Color','m','HorizontalAlignment','center')

xlabel('Speed v (m/s)')
ylabel('Probability density f(v) (s/m)')
title(sprintf('Maxwell–Boltzmann Speed Distribution, T = %g K', T))
legend('f(v)','v_{mp}','v_{avg}','v_{rms}','Location','northeast')
grid on
hold off