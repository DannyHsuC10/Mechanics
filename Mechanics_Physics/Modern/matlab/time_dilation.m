
c = 299792458;        % speed of light (m/s)
Delta_t = 1.0;        % proper time interval Δt (s) as measured in rest frame

% velocity as fraction of c (beta), exclude 1
beta = linspace(0, 0.9999, 1000);    % v/c
v = beta * c;

% time-dilated interval
Delta_t_prime = Delta_t ./ sqrt(1 - beta.^2);   % Δt' = Δt / sqrt(1 - v^2/c^2)
Delta_t_prime_norm = Delta_t_prime / Delta_t;   % normalized (Δt'/Δt) = 1/sqrt(1 - β^2)

% Plot Δt' vs v
figure;
subplot(1,2,1)
plot(v, Delta_t_prime, 'b-', 'LineWidth',1.6)
xlabel('Velocity v (m/s)')
ylabel('\Delta t'' (s)')
title('\Delta t'' vs v')
xlim([0, max(v)])
grid on

% Plot normalized Δt'/Δt vs beta
subplot(1,2,2)
plot(beta, Delta_t_prime_norm, 'r-', 'LineWidth',1.6)
hold on
beta_marks = [0.1, 0.5, 0.9, 0.99, 0.999];
plot(beta_marks, 1./sqrt(1-beta_marks.^2), 'ko', 'MarkerFaceColor','y')

xlabel('v / c (\beta)')
ylabel('\Delta t'' / \Delta t')
title('Normalized time dilation vs \beta')
ylim([1, max(Delta_t_prime_norm)*1.05])
grid on
hold off

% Optional: print numeric table for sample betas
fprintf('beta\tv (m/s)\tDelta t'' (s)\tDelta t''/Delta t\n')
for i = 1:length(beta_marks)
    b = beta_marks(i);
    fprintf('%.4g\t%.3e\t%.3e\t%.3g\n', b, b*c, Delta_t*(1/sqrt(1-b^2)), 1/sqrt(1-b^2));
end