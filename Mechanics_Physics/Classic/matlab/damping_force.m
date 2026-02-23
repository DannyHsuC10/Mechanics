clear;

m  = 1.0;            % mass (kg)
v0 = 5.0;            % initial velocity (m/s)
c_values = [0.2, 1, 3];   % damping coefficients (kg/s)
t = linspace(0,10,500);   % time vector (s)

figure();
hold on;
for c = c_values
    v = v0 * exp(-(c/m)*t);
    plot(t, v, 'LineWidth', 1.6);
end
hold off;

xlabel('Time t (s)');
ylabel('Velocity v(t) (m/s)');
title('Exponential Decay of Velocity under Viscous Damping');
legend(arrayfun(@(c) sprintf('c=%.1f kg/s',c), c_values, 'UniformOutput',false));
grid on;