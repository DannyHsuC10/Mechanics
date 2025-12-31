% Circular motion parameters
radius = 5; % Radius (m)
omega = 1; % Angular velocity (rad/s)
t = linspace(0, 2*pi, 100); % Time vector

% Calculate circular motion trajectory
x = radius * cos(omega * t); % Horizontal displacement
y = radius * sin(omega * t); % Vertical displacement

% Calculate tangential velocity and centripetal acceleration
v_tangential = omega * radius; % Tangential velocity (m/s)
a_centripetal = omega^2 * radius; % Centripetal acceleration (m/s^2)

% Positions to annotate (0 degrees, 90 degrees, 180 degrees, 270 degrees)
theta = [0, pi/2, pi, 3*pi/2]; % Corresponding angles in radians
x_theta = radius * cos(theta);
y_theta = radius * sin(theta);

% Plot the trajectory
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;

% Draw tangential velocity and centripetal acceleration vectors with scaling factor
scaling_factor = 0.5; % Adjust this factor to shorten the arrow length
quiver(x_theta, y_theta, scaling_factor * -v_tangential*sin(theta), scaling_factor * v_tangential*cos(theta), 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 2);
quiver(x_theta, y_theta, scaling_factor * -a_centripetal*cos(theta), scaling_factor * -a_centripetal*sin(theta), 0, 'm', 'LineWidth', 2, 'MaxHeadSize', 2);



% Set the plot limits
xlim([-radius radius]*1.2);
ylim([-radius radius]*1.2);
