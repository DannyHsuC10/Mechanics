M = linspace(1, 10, 500);       % Mach range (M >= 1)
theta_rad = asin(1 ./ M);       % theta in radians
theta_deg = theta_rad * (180/pi);

% Plot
figure;
plot(M, theta_deg, 'b-', 'LineWidth', 1.6)
hold on

% Mark some example Mach numbers
Mmarks = [1.2, 1.5, 2, 5];
theta_marks_deg = asin(1./Mmarks) * (180/pi);
plot(Mmarks, theta_marks_deg, 'ko', 'MarkerFaceColor','y')

xlabel('Mach number M')

ylabel('Cone angle \theta (degrees)')

title('Mach Cone Angle')
legend('\theta (deg)','Example points','Location','northeast')
grid on

hold off

