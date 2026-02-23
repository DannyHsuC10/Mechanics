
% length_contraction_vs_v.m
c = 299792458;      % speed of light (m/s)
l = 1.0;            % proper length l (m) -- change as needed

% velocity as fraction of c (exclude 1)
beta = linspace(0, 0.9999, 1000); % beta = v/c
v = beta * c;

% contracted length
lp = l .* sqrt(1 - beta.^2);    % l' = l * sqrt(1 - v^2/c^2)
lp_norm = lp / l;               % normalized (l'/l) = sqrt(1 - beta^2)

% Plot l' and normalized l'/l
figure();
subplot(1,2,1);
plot(v, lp, 'b-', 'LineWidth',1.5)
xlabel('Velocity v (m/s)')
ylabel('Contracted length l'' (m)')
title('l'' vs v')
grid on
xlim([0, max(v)])

subplot(1,2,2)
plot(beta, lp_norm, 'r-', 'LineWidth',1.6)
hold on
% mark sample betas
beta_marks = [0.1, 0.5, 0.9, 0.99];
plot(beta_marks, sqrt(1 - beta_marks.^2), 'ko', 'MarkerFaceColor','y')

xlabel('v / c (\beta)')
ylabel('Normalized length l'' / l')
title('Normalized length vs \beta = v/c')
ylim([0 1.05])
grid on
hold off

% Optional: print numeric table for sample points
fprintf('beta\tv (m/s)\tl'' (m)\tl''/l\n')
for i = 1:length(beta_marks)
    b = beta_marks(i);
    fprintf('%.2f\t%.3e\t%.3e\t%.3f\n', b, b*c, l*sqrt(1-b^2), sqrt(1-b^2));
end