
g = 9.81;        % gravity (m/s^2)
d = 3.0;         % track (distance between rails) or lane width parameter (m)
r = 200.0;       % curve radius (m)

% speed range (m/s). Example: 0 -> 60 m/s (~216 km/h)
v = linspace(0, 60, 1000);
h = (d .* v.^2) ./ (g .* r);   % h = d v^2 / (g r)

% Plot h vs v (m/s)
figure('Color','w','Position',[200 200 700 420])
plot(v, h, 'b-', 'LineWidth', 1.6)
grid on
xlabel('Speed v (m/s)')
ylabel('Superelevation height h (m)')
title(sprintf('Superelevation h = d v^2 /(g r)  (d=%.2g m, r=%.2g m)', d, r))

