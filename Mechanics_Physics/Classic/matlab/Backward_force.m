clear;

m = 1.0;        % mass (kg)
g = 9.81;       % gravity (m/s^2) (downward positive)
k = 0.9;        % quadratic drag coeff (kg/m)
v0 = 0;         % initial velocity (m/s), positive = downward

% Terminal velocity (downward positive)
v_t = sqrt(m * g / k);

% Velocity range for force plots (include a bit negative for upward)
v = linspace(-1.5*v_t, 1.5*v_t, 400);

% Forces (downward positive): gravity positive, drag opposes motion
F_g = m * g;
F_drag = -k .* v .* abs(v);      % negative when v>0 (upward when v<0)
F_net = F_g + F_drag;

% Analytical v(t) for start from rest (v0 == 0)
t = linspace(0, 8, 400);
v_analytical = v_t .* tanh((g ./ v_t) .* t);

% Numerical integration for general v0 using ode45: dv/dt = g - (k/m) v|v|
odefun = @(t,v) g - (k/m) * v .* abs(v);
tspan = [0 8];
opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
[tt, vv] = ode45(odefun, tspan, v0, opts);

%Plot: Forces vs velocity
figure();
plot(v, F_drag, 'r-', 'LineWidth',1.4); hold on
plot(v, F_net,  'b--', 'LineWidth',1.4);
xlabel('Velocity v (m/s)');
ylabel('Force (N) (downward positive)');
title('Quadratic Drag and Net Force vs Velocity');
legend('F_{drag} = -k v |v|','F_{net} = m g + F_{drag}','Location','northwest');

grid on;

% Plot: Velocity vs time
figure();
plot(t, v_analytical, 'b-', 'LineWidth',1.6); hold on
plot(tt, vv, 'r--', 'LineWidth',1.2);
xlabel('Time t (s)');
ylabel('Velocity v (m/s) (downward positive)');
title('Velocity vs Time (quadratic drag)');
legend('Analytical (v_0=0): v_t tanh(g t / v_t)','Numerical (ode45)','Location','southeast');
grid on; axis tight;