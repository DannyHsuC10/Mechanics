clc;clear;
function tools = mechanicsToolkit()

% Constants
tools.constants.G = 6.67430e-11; % m^3 kg^-1 s^-2
tools.constants.g = 9.81;        % m/s^2 (default)
tools.constants.pi = pi;

% Gravity
tools.grav_force = @(M, m, r) tools.constants.G .* (M .* m) ./ (r.^2); % magnitude

% Energy & conservation
tools.kinetic_energy = @(m, v) 0.5 .* m .* v.^2;
tools.grav_potential = @(M, m, r) - tools.constants.G .* M .* m ./ r; % -GMm/r

% Solve final speed from energy conservation (Ki + Ui = Kf + Uf)
% Usage: vf = tools.mechanical_conserve_v(vi, Ui, Uf, m)
tools.mechanical_conserve_v = @(vi, Ui, Uf, m) sqrt( max(0, vi.^2 + 2 .* (Ui - Uf) ./ m) );

% Circular motion
tools.speed_from_period = @(r, T) 2 .* tools.constants.pi .* r ./ T; % v = 2*pi*r / T
tools.centripetal_acc = @(v, r) v.^2 ./ r;
tools.angular_speed = @(v, r) v ./ r;

% Kinematics (analytical)
tools.pos_from_const_acc = @(xi, vi, a, t) xi + vi .* t + 0.5 .* a .* t.^2;
tools.vel_from_const_acc = @(vi, a, t) vi + a .* t;

% Numerical derivative helpers (simple finite difference)
tools.acc_from_vel = @(v, t) finite_diff(v, t); % returns dv/dt same length (ends use forward/back)
tools.vel_from_pos = @(x, t) finite_diff(x, t);

% Momentum & impulse
tools.momentum = @(m, v) m .* v;
tools.impulse = @(F, dt) F .* dt;
tools.v_from_impulse = @(m, p0, J) (p0 + J) ./ m; % p0 can be m.*v0

% Free fall
tools.freefall_displacement = @(t, g) 0.5 .* g .* t.^2; % default g pass tools.constants.g if omitted

% Torque (cross product)
tools.torque = @(r_vec, F_vec) cross(r_vec, F_vec, 2); % expects Nx3 arrays or 1x3 vectors

% Inclined plane
tools.normal_on_slope = @(m, g, theta) m .* g .* cos(theta);
tools.parallel_on_slope = @(m, g, theta) m .* g .* sin(theta);

% Friction & resistance
tools.friction = @(mu, N) mu .* N;
tools.linear_drag = @(B, v) B .* v;
tools.quad_drag = @(Cp, A, rho, v) 0.5 .* Cp .* A .* rho .* v.^2;

% Pressure & buoyancy
tools.pressure_from_force = @(F, A) F ./ A;
tools.hydrostatic_pressure = @(rho, g, h) rho .* g .* h;
tools.pascal_multiplier = @(F1, A1, A2) F1 .* (A2 ./ A1); % F2 = F1 * A2/A1
tools.buoyant_force = @(rho, V, g) rho .* g .* V;

% Spring
tools.spring_force = @(k, x) k .* x; % sign convention: positive x -> positive restoring magnitude (user handles direction)

% --- helper: finite difference (central, with forward/back at ends)
    function d = finite_diff(y, t)
        y = double(y);
        t = double(t);
        n = numel(y);
        if numel(t) ~= n
            error('y and t must have same length.');
        end
        d = nan(size(y));
        if n==1
            d(1) = 0;
            return;
        end
        % forward for first
        d(1) = (y(2)-y(1)) / (t(2)-t(1));
        % central for interior
        for k = 2:n-1
            dt = t(k+1)-t(k-1);
            d(k) = (y(k+1)-y(k-1)) / dt;
        end
        % backward for last
        d(n) = (y(n)-y(n-1)) / (t(n)-t(n-1));
    end

end

%% example
tools = mechanicsToolkit;
Fg = tools.grav_force(5.97e24, 1.2, 6.371e6)
K = tools.kinetic_energy(2, 4)
x = tools.pos_from_const_acc(0, 0, 9.81, 2)
tau = tools.torque([0 0 1], [10 0 0])  % example cross product
Dq = tools.quad_drag(1.0, 0.2, 1.225, 10)



%% Plot velocity from position using mechanicsToolkit.vel_from_pos
tools = mechanicsToolkit();    % get toolkit
t = linspace(0, 4, 200);       % time vector (s)
x = 5 + 2.*t - 0.5.*t.^2;      % position (m), analytical motion
v_num = tools.vel_from_pos(x, t); % numerical velocity (m/s)

% Analytical velocity for comparison
v_anal = 2 - t;

% Plot
figure;
plot(t, v_num, 'b-', 'LineWidth', 1.5); hold on;
plot(t, v_anal, 'r--', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Numerical Velocity from Position vs Analytical Velocity');
legend('Numerical (finite-diff)', 'Analytical (2 - t)', 'Location', 'best');
grid on;
hold off;