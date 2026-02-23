
w = 1; % weight scale: plot F normalized by w (F/w)
phi_list_deg = [5, 10, 20, 30]; % slope angles to show (degrees)
mu = linspace(0, 1.5, 2000);    % friction coefficient range (adjust as needed)

figure('Color','w','Position',[200 200 900 520])
hold on
cols = lines(numel(phi_list_deg));
for i = 1:numel(phi_list_deg)
    phi = deg2rad(phi_list_deg(i));
    tphi = tan(phi);
    % avoid singularities: compute where denominator small
    den_push = 1 - mu.*tphi;
    den_pull = 1 + mu.*tphi;
    % mask invalid points (denominator near zero) to avoid blow-up
    mask_push = abs(den_push) > 1e-6;
    mask_pull = abs(den_pull) > 1e-6;
    Fw_push = NaN(size(mu));
    Fw_pull = NaN(size(mu));
    Fw_push(mask_push) = (tphi + mu(mask_push)) ./ den_push(mask_push);
    Fw_pull(mask_pull) = (tphi - mu(mask_pull)) ./ den_pull(mask_pull);
    % plot
    plot(mu, Fw_push, '-', 'Color', cols(i,:), 'LineWidth', 1.6)
    plot(mu, Fw_pull, '--', 'Color', cols(i,:), 'LineWidth', 1.2)
    % mark approximate singular mu for push if inside range
    mu_sing = 1 / tphi; % where denominator for push = 0 (if tphi>0)
    if isfinite(mu_sing) && mu_sing > min(mu) && mu_sing < max(mu)
        plot(mu_sing, 0, 'x', 'Color', cols(i,:), 'MarkerSize',8, 'LineWidth',1.2)
        text(mu_sing, max(ylim)*0.9, sprintf('\\mu_{sing}=%.3g',mu_sing), 'Color',cols(i,:), 'HorizontalAlignment','center')
    end
end

xlabel('\mu (coefficient of friction)')
ylabel('F / w (normalized force)')
title('Required F/w vs \mu for Push Uphill (solid) and Pull Downhill (dashed)')
legendEntries = {};
for i = 1:numel(phi_list_deg)
    legendEntries{end+1} = sprintf('\\phi = %g° (push)', phi_list_deg(i));
    legendEntries{end+1} = sprintf('\\phi = %g° (pull)', phi_list_deg(i));
end
legend(legendEntries,'Location','northeastoutside')
grid on
xlim([min(mu), max(mu)])
ylim_auto = ylim;
% annotate formula
text(0.02, ylim_auto(2)*0.95, 'Push: F/w = (tan\phi + \mu)/(1 - \mu tan\phi)', 'Interpreter','tex')
text(0.02, ylim_auto(2)*0.88, 'Pull: F/w = (tan\phi - \mu)/(1 + \mu tan\phi)', 'Interpreter','tex')
hold off

% Optional: show numeric table for a chosen mu0
mu0 = 0.3;
fprintf('phi(deg)\tF/w push\tF/w pull\n')
for i = 1:numel(phi_list_deg)
    phi = deg2rad(phi_list_deg(i));
    tphi = tan(phi);
    denp = 1 - mu0*tphi;
    denl = 1 + mu0*tphi;
    Fp = NaN; Fl = NaN;
    if abs(denp) > 1e-6, Fp = (tphi + mu0)/denp; end
    if abs(denl) > 1e-6, Fl = (tphi - mu0)/denl; end
    fprintf('%g\t\t%.4g\t\t%.4g\n', phi_list_deg(i), Fp, Fl)
end