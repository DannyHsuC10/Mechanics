
c = 299792458;        % speed of light (m/s)
m0 = 1.0;             % rest mass (kg) -- change as needed

% beta range (v/c), exclude 1
beta = linspace(0, 0.9999, 1000);
v = beta * c;

% relativistic mass
gamma = 1 ./ sqrt(1 - beta.^2);   % Lorentz factor
m_prime = m0 .* gamma;            % m' = m0 * gamma
mprime_norm = m_prime / m0;       % m'/m0 = gamma

% Plot m' vs v
figure;
subplot(1,2,1)
plot(v, m_prime, 'b-', 'LineWidth', 1.6)
xlabel('Velocity v (m/s)')
ylabel('Relativistic mass m'' (kg)')
title('m'' vs v')
xlim([0, max(v)])
grid on

% Plot normalized m'/m0 vs beta
subplot(1,2,2)
plot(beta, mprime_norm, 'r-', 'LineWidth', 1.6)
hold on
beta_marks = [0.1, 0.5, 0.9, 0.99, 0.999];
plot(beta_marks, 1./sqrt(1 - beta_marks.^2), 'ko', 'MarkerFaceColor','y')

xlabel('v / c (\beta)')
ylabel('Normalized mass m'' / m_0 (= \gamma)')
title('Normalized relativistic mass vs \beta')
ylim([1, max(mprime_norm)*1.05])
grid on
hold off

% Print numeric table for example betas
fprintf('beta    v (m/s)         m'' (kg)        m''/m0\n')
for i = 1:length(beta_marks)
    b = beta_marks(i);
    fprintf('%.3g   %.3e   %.3e   %.3g\n', b, b*c, m0*(1/sqrt(1-b^2)), 1/sqrt(1-b^2));
end