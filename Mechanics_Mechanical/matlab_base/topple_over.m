clear;close all;
b = 0.5;                 % bottom length b (m) -- change as needed
h = linspace(0.01, 2*b, 1000); % height range (m); avoid h=0
mu = b ./ (2*h);        % mu = b/(2h)

% Plot mu vs h
figure()
plot(h, mu, 'b-', 'LineWidth', 1.6)
hold on

% Mark example heights
h_marks = [b/10, b/4, b/2, b]; % example choices
mu_marks = b ./ (2*h_marks);
plot(h_marks, mu_marks, 'ko', 'MarkerFaceColor','y')
for k = 1:numel(h_marks)
    text(h_marks(k), mu_marks(k)*1.05, sprintf('h=%.3g m\n\\mu=%.3g', h_marks(k), mu_marks(k)), ...
        'HorizontalAlignment','center')
end

xlabel('Height h (m)')
ylabel('\mu = b/(2h)')
title(sprintf('\\mu vs h for b = %.3g m', b))
grid on
hold off
