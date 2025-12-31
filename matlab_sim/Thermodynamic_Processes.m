% P-V Graphs for Different Thermodynamic Processes

% Define constants
P0 = 101325; % Initial pressure in Pa
V0 = 1; % Initial volume in m^3
n = 1; % Amount of substance in moles
R = 8.314; % Universal gas constant J/(mol·K)
T0 = 300; % Initial temperature in K
gamma = 1.4; % Adiabatic index

% Define volume range for plotting
V = linspace(0.5, 2, 100);

% Adiabatic Process
P_adiabatic = P0 * (V0 ./ V).^gamma;

% Isochoric Process (Volume constant)
% Since volume is constant, pressure is unchanged
P_isochoric = P0 * (T0 ./ T0) * ones(size(V));

% Cyclic Process (Combining adiabatic and isothermal)
V_cycle = [V V(end:-1:1)]; 
P_cycle = [P0 * (V0 ./ V).^gamma, P0 * (V0 ./ V(end:-1:1)).^gamma];

% Free Expansion (Pressure remains constant)
P_free = P0 * ones(size(V));

% Plotting the graphs
figure;

% Adiabatic Process
subplot(2, 2, 1);
plot(V, P_adiabatic, 'r-', 'LineWidth', 1.5);
xlabel('Volume (m^3)');
ylabel('Pressure (Pa)');
title('Adiabatic Process');
grid on;

% Isochoric Process
subplot(2, 2, 2);
plot(V, P_isochoric, 'b--', 'LineWidth', 1.5);
xlabel('Volume (m^3)');
ylabel('Pressure (Pa)');
title('Isochoric Process');
grid on;

% Cyclic Process
subplot(2, 2, 3);
plot(V_cycle, P_cycle, 'g-.', 'LineWidth', 1.5);
xlabel('Volume (m^3)');
ylabel('Pressure (Pa)');
title('Cyclic Process');
grid on;

% Free Expansion
subplot(2, 2, 4);
plot(V, P_free, 'k:', 'LineWidth', 1.5);
xlabel('Volume (m^3)');
ylabel('Pressure (Pa)');
title('Free Expansion');
grid on;

% Adjust the layout for better visualization
sgtitle('P-V Graphs of Different Thermodynamic Processes');
