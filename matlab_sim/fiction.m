% Square object parameters
square_size = 1; % Square side length (m)
x_center = 0; % x-coordinate of the center of the square
y_center = 0; % y-coordinate of the center of the square

% Force parameters
gravity = 9.81; % Gravitational acceleration (m/s^2)
mass = 0.2; % Mass of the object (kg)
normal_force = mass * gravity; % Normal force (N)
mu = 0.4; % Coefficient of friction
friction_force = mu * normal_force; % Friction force (N)
Fx = 0; % Fx force (N)

if friction_force > Fx
    friction_force = Fx
end

% Arrow scaling factor
scaling_factor = 0.5; % Adjust this value to shorten or lengthen the arrows

% Calculate force components
Fy = normal_force; % Vertical force acting on the object
resultant_force = sqrt(Fx^2 + friction_force^2); % Magnitude of the resultant force

% Plot the square object
figure;
hold on;
rectangle('Position', [x_center - square_size/2, y_center - square_size/2, square_size, square_size], 'EdgeColor', 'b', 'LineWidth', 2);

% Annotate gravity
quiver(x_center, y_center, 0, -scaling_factor * normal_force, 'r', 'LineWidth', 2, 'MaxHeadSize', 2);
text(x_center, y_center - scaling_factor * normal_force / 2, 'Gravity', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

% Annotate normal force
quiver(x_center, y_center, 0, scaling_factor * normal_force, 'g', 'LineWidth', 2, 'MaxHeadSize', 2);
text(x_center, y_center + scaling_factor * normal_force / 2, 'Normal Force', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top');

% Annotate Fx force
quiver(x_center, y_center, scaling_factor * Fx, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 2);
text(x_center + scaling_factor * Fx / 2, y_center, 'Fx', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Annotate friction force
quiver(x_center, y_center, -scaling_factor * friction_force, 0, 'm', 'LineWidth', 2, 'MaxHeadSize', 2);
text(x_center - scaling_factor * friction_force / 2, y_center, 'Friction', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'top');

% Set plot limits
xlim([-2 2]);
ylim([-2 2]);
xlabel('X');
ylabel('Y');
title('Square Object with Forces');
grid on;
axis equal;
hold off;
