% Parameters
V_e = 2500; % Exhaust velocity in m/s (example value)
m_i = 50000; % Initial mass in kg (example value)
m_f = 20000; % Final mass in kg (example value)
t_burn = 100; % Burn time in seconds (example value)

% Time array
t = linspace(0, t_burn, 1000);

% Fuel loss rate (R)
R = (m_i - m_f) / t_burn;

% Calculate mass over time
m = m_i - R * t;

% Calculate velocity using the rocket equation
V = V_e * log(m_i ./ m);

% Plot velocity vs. time
figure;
plot(t, V, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Rocket Velocity vs. Time');
grid on;
