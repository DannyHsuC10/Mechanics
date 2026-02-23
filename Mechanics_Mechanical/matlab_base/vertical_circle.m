
g = 9.81;          % gravity (m/s^2)
m = 1.0;           % mass (kg)
r = 1.0;           % radius (m)
v0 = 5.0;          % speed at lowest point (m/s)

% h range from bottom (0) up to 2r (top) but limit by energy so v^2 >= 0
h = linspace(0, 2*r, 1000);
% speed squared (kinetic energy decreases as height increases)
v2 = v0^2 - 2*g.*h;
v2(v2 < 0) = NaN;  % mark unreachable heights (will not plot)
v = sqrt(v2);

% geometry
cos_theta = 1 - h./r;               % cos(theta) = 1 - h/r
% ensure valid domain due to numerical round
cos_theta(cos_theta > 1) = 1;
cos_theta(cos_theta < -1) = -1;
sin_theta = sqrt( max(0, 1 - cos_theta.^2) ); % take positive branch (theta in [0, pi])
% centripetal magnitude
Fc = m .* v.^2 ./ r;

% components (Fc directed toward center)
Fc_x = -Fc .* sin_theta;    % negative when sin>0 (points left if mass right)
Fc_y =  Fc .* cos_theta;

% total forces
Fx = Fc_x;
Fy = Fc_y - m*g;

% Plot Fx and Fy vs h
figure;
plot(h, Fx, 'b-', 'LineWidth',1.6)
hold on
plot(h, Fy, 'r-', 'LineWidth',1.6)
xlabel('Height h above bottom (m)')
ylabel('Force components (N)')
title(sprintf('Vertical Circle: F_x (blue) and F_y (red) vs h  (m=%.2g kg, r=%.2g m, v0=%.2g m/s)', m, r, v0))
grid on
legend('F_x','F_y','Location','best')
% mark top where h = 2r
yl = ylim;
plot([2*r 2*r], yl, 'k--', 'LineWidth',1)
text(2*r, yl(2)*0.9, 'top (h=2r)','HorizontalAlignment','right')

% Print sample numeric table at selected heights
h_samples = [0, r, 2*r];
fprintf('h (m)\t v (m/s)\t Fx (N)\t\t Fy (N)\t\t |F| (N)\n');
for k = 1:length(h_samples)
    hs = h_samples(k);
    v2s = v0^2 - 2*g*hs;
    if v2s < 0
        fprintf('%.3g\t unreachable (v^2<0)\n', hs);
    else
        vs = sqrt(v2s);
        cos_t = 1 - hs/r;
        sin_t = sqrt(1 - cos_t^2);
        Fcs = m*vs^2/r;
        Fxs = -Fcs*sin_t;
        Fys = Fcs*cos_t - m*g;
        fprintf('%.3g\t %.3g\t %.3g\t %.3g\t %.3g\n', hs, vs, Fxs, Fys, sqrt(Fxs^2+Fys^2));
    end
end