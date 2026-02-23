clearvars; close all;

% Parameters
m = 0.5;            % mass (kg)
R = 0.06;           % radius (m)
g = 9.81;           % gravity (m/s^2)
alphaSlope = 20*pi/180; % slope angle (rad)
shape = 'solid_sphere'; % 'solid_sphere','hollow_sphere'`,'cylinder','disc','custom'

switch shape
    case 'solid_sphere'; I = 2/5 * m * R^2;
    case 'hollow_sphere'; I = 2/3 * m * R^2;
    case {'cylinder','disc'}; I = 1/2 * m * R^2;
    otherwise; I = 0.4 * m * R^2;
end

% Initial conditions
v0 = 0;    % initial translational speed along slope (m/s)
s0 = 0;    % initial position along slope (m)
h0 = 0;    % reference height (m)

% Acceleration for pure rolling (no slip): a = g sinθ / (1 + I/(m R^2))
a = g * sin(alphaSlope) / (1 + I/(m*R^2));

tmax = 4;                      % simulation time (s)
t = linspace(0, tmax, 600);    % time vector

% Kinematics along slope
s = s0 + v0.*t + 0.5*a.*t.^2;  % displacement along slope
v = v0 + a.*t;                 % translational speed (m/s)
omega = v ./ R;                % angular speed (rad/s) -> enforces v = omega*R

% Vertical height (decreases as it goes down slope)
h = h0 - s .* sin(alphaSlope); % decrease of height along slope
U = m * g .* h;                % potential energy relative to ground level

% Energies
Kt = 0.5 * m .* v.^2;          % translational kinetic energy
Kr = 0.5 * I .* omega.^2;      % rotational kinetic energy
Etot = Kt + Kr + U;            % total energy

% Plotting
figure;

plot(t, Kt, 'b-', 'LineWidth',1.6); hold on
plot(t, Kr, 'r--', 'LineWidth',1.4);
plot(t, U,  'g-.', 'LineWidth',1.2);
plot(t, Etot, 'm-', 'LineWidth',1.4);
ylabel('Energy (J)'); title('Energies vs Time (Pure Rolling, no slip)');
legend('K_{trans}','K_{rot}','U','Location','northeast');
grid on

% Print summary to command window
fprintf('Shape: %s, I/(mR^2)=%.3f, acceleration a = %.4f m/s^2 (pure rolling)\n', shape, I/(m*R^2), a);