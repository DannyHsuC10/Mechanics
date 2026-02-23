% Plot chain linear speed variation due to polygonal/angle effect.
% r in meters, N in rev/s (Hz). theta_amp in radians (max angular deviation).
clear; clf;

% --- User inputs
r = 0.05;            % pitch radius (m)
N = 10/60;           % speed in rev/s (10 rpm -> 10/60 Hz); set as rev/s
theta_amp = pi/6;    % amplitude of theta variation (rad)
f_theta = N;         % frequency of theta variation (use shaft rotation freq)
Tsim = 5;            % simulation time (s)
dt = 1e-4;           % time step

% --- Time and theta(t)
t = 0:dt:Tsim;
omega_theta = 2*pi*f_theta;
% choose theta waveform: sinusoidal oscillation around zero
theta_t = theta_amp * sin(omega_theta * t);

% instantaneous effective radius and delta r
r_eff = r .* cos(theta_t);           % r_min (time dependent)
delta_r = r .* (1 - cos(theta_t));   % delta r

% instantaneous linear speed (m/s)
v_t = 2 * pi * N .* r_eff;

% also compute static v_max for reference (when cosθ=1)
v_max = 2 * pi * N * r;
v_min_sample = min(v_t);

% --- Plot results
subplot(2,1,1);
plot(t, r_eff, 'b', 'LineWidth', 1.4); hold on
plot(t, r*ones(size(t)), 'k--', 'LineWidth', 1);
xlabel('Time (s)'); ylabel('Effective radius r_{eff} (m)');
title('Effective radius r_{eff}(t) = r cos(\theta(t))');
legend('r_{eff}','r (max)', 'Location','best');
grid on; ylim([min(r_eff)-0.01, r+0.01]);

subplot(2,1,2);
plot(t, v_t, 'r', 'LineWidth', 1.6); hold on
yline(v_max,'k--','v_{max}','LabelHorizontalAlignment','left');
yline(v_min_sample,'k:','v_{min}','LabelHorizontalAlignment','left');
xlabel('Time (s)'); ylabel('Linear speed v (m/s)');
title(sprintf('Linear speed v(t) = 2\\pi N r_{eff}(t), N=%.4g rev/s', N));
grid on;

% annotate numeric values
txt = {
    sprintf('r = %.4g m', r)
    sprintf('N = %.4g rev/s', N)
    sprintf('theta_{amp} = %.3g rad', theta_amp)
    sprintf('v_{max} = %.4g m/s', v_max)
    sprintf('v_{min} = %.4g m/s', v_min_sample)
    sprintf('\\Delta r_{max} = %.4g m', max(delta_r))
    };
xpos = 0.02 * Tsim; ypos = 0.95 * max(v_t);
text(xpos, ypos, txt, 'VerticalAlignment','top','EdgeColor','k');

% --- Optional: plot one period zoom
figure;
period = 1/f_theta;
ind = t <= period;
plot(t(ind), v_t(ind), 'm', 'LineWidth', 1.6);
xlabel('Time (s)'); ylabel('v (m/s)');
title('v(t) over one rotation period');
grid on;

% Print sample values to console
fprintf('v_max = %.6g m/s, v_min = %.6g m/s, Delta r_max = %.6g m\n', v_max, v_min_sample, max(delta_r));