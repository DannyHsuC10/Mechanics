
% Doppler_vs_speed.m
f0 = 1000;                 % emitted frequency (Hz)
c_sound = 343;             % speed of sound (m/s)
c_light = 299792458;       % speed of light (m/s)

% speed ranges (m/s)
vR = linspace(-0.9*c_sound, 0.9*c_sound, 800); % receiver velocity (toward +ve is toward source negative)
vS = linspace(-0.9*c_sound, 0.9*c_sound, 800); % source velocity (toward +ve is toward receiver positive)

% Classical acoustic Doppler:
% Receiver moving (source stationary): f' = f0 * (c - v_r)/c
f_r_receiver = f0 .* (c_sound - vR) ./ c_sound;

% Source moving (receiver stationary): f' = f0 * c / (c - v_s)
f_r_source = f0 .* c_sound ./ (c_sound - vS);

% Both moving (general classical): f' = f0 * (c - v_r) / (c - v_s)
% Make a 2D surface for combined velocities (vR_grid rows, vS_grid cols)
[vR_grid, vS_grid] = meshgrid(linspace(-0.8*c_sound,0.8*c_sound,201), linspace(-0.8*c_sound,0.8*c_sound,201));
f_both = f0 .* (c_sound - vR_grid) ./ (c_sound - vS_grid);

% Relativistic Doppler for EM (one-dimensional relative speed v_rel; positive means approaching)
v_rel = linspace(-0.99*c_light, 0.99*c_light, 800);
beta = v_rel ./ c_light;
f_rel = f0 .* sqrt((1 + beta) ./ (1 - beta));

% Plot 1: receiver and source separate
figure;
subplot(1,2,1)
plot(vR, f_r_receiver, 'b-', 'LineWidth',1.5); hold on
plot(vS, f_r_source, 'r--', 'LineWidth',1.5);
xlabel('Velocity (m/s)')
ylabel('Observed frequency f'' (Hz)')
title(sprintf('Classical Doppler (f_0 = %g Hz, c_{sound} = %g m/s)', f0, c_sound))
legend('Receiver moving (v_r)','Source moving (v_s)','Location','best')
grid on
xline(0,'k:'); hold off

% Plot 2: relativistic and combined acoustic surface (slice)
subplot(1,2,2)
% show relativistic curve (scaled to same axis using c_light; plot small velocities for clarity)
v_rel_small = linspace(-0.99*c_sound, 0.99*c_sound, 800);
beta_small = v_rel_small ./ c_light;
f_rel_small = f0 .* sqrt((1 + beta_small) ./ (1 - beta_small));
plot(v_rel_small, f_rel_small, 'm-', 'LineWidth',1.5); hold on
% show symmetric combined acoustic cases for v_s = -v_r (approach vs recede)
v = linspace(-0.9*c_sound,0.9*c_sound,400);
f_both_sym = f0 .* (c_sound - v) ./ (c_sound + v); % v_r = v, v_s = -v (approaching each other)
plot(v, f_both_sym, 'g-.', 'LineWidth',1.5)
xlabel('Relative velocity (m/s)')
ylabel('Observed frequency f'' (Hz)')
title('Relativistic (EM) vs Acoustic combined (approach/recede)')
legend('Relativistic Doppler (EM)','Acoustic both moving (v_r = -v_s)','Location','best')
grid on
hold off

% Optional: figure showing 2D surface of f' for combined v_r, v_s
figure;
imagesc(linspace(-0.8*c_sound,0.8*c_sound,201), linspace(-0.8*c_sound,0.8*c_sound,201), f_both)
axis xy; colorbar
xlabel('Source velocity v_s (m/s)')
ylabel('Receiver velocity v_r (m/s)')
title('Observed frequency f'' (Hz) for combined v_r, v_s (classical)')