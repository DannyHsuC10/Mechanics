
% I_vs_dB_plot.m
I0 = 1e-12;                 % reference intensity (W/m^2 or chosen units)
I = logspace(log10(I0*1e-3), log10(I0*1e6), 1000); % intensity range around I0

dB = 10 * log10(I ./ I0);  % dB values

figure;
semilogx(I, dB, 'b-', 'LineWidth',1.6)   % intensity on log x, dB on linear y
hold on
% mark reference intensity I0
plot(I0, 0, 'ro', 'MarkerFaceColor','r')
text(I0, 1, sprintf('I_0 = %.1e\n0 dB', I0), 'HorizontalAlignment','center','Color','r')

xlabel('Intensity I (same units as I_0)')
ylabel('Level (dB) = 10 log_{10}(I/I_0)')
title('Decibel Level vs Intensity')
grid on

% optional: second x-axis showing I in multiples of I0 (dimensionless)
ax1 = gca;
ax1_pos = ax1.Position;
ax2 = axes('Position',ax1_pos,'Color','none','XAxisLocation','top','YAxisLocation','right');
% convert currently shown x-limits to dB range and set ticks at convenient dB values
dBticks = -60:10:60;
% corresponding intensities
Iticks = I0 * 10.^(dBticks/10);
% set top axis ticks (only where within range)
valid = Iticks >= min(I) & Iticks <= max(I);
set(ax2,'XScale','log','XLim',ax1.XLim,'YTick',[],'XTick',Iticks(valid),'XTickLabel',arrayfun(@(d) sprintf('%.0f dB',d),dBticks(valid),'UniformOutput',false));
xlabel(ax2, 'Equivalent levels (dB)')

hold off
