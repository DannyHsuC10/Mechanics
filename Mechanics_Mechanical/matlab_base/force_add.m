clear;
FA = 5;                 % magnitude of F_A
FB = 3;                 % magnitude of F_B
theta = 40;             % angle between F_A and F_B in degrees

% Vector components (place F_A along +x axis)
theta_rad = deg2rad(theta);
F1 = [FA, 0];                         % F_A
F2 = [FB*cos(theta_rad), FB*sin(theta_rad)]; % F_B at angle theta
Ftot = F1 + F2;                       % resultant

% Setup figure
figure;
hold on
axis equal
grid on

% Plot vectors with quiver (scale 0 to use actual lengths)
quiver(0,0,F1(1),F1(2),0,'b','LineWidth',2,'MaxHeadSize',0.6)
quiver(0,0,F2(1),F2(2),0,'r','LineWidth',2,'MaxHeadSize',0.6)
quiver(0,0,Ftot(1),Ftot(2),0,'g','LineWidth',2,'MaxHeadSize',0.8)

% Also show triangle (parallelogram) tip-to-tail for clarity
plot([F1(1), F1(1)+F2(1)], [F1(2), F1(2)+F2(2)], 'r--')
plot([0, F2(1)+F1(1)], [0, F2(2)+F1(2)], 'g:') % diagonal (same as resultant)

% Annotations
text(F1(1)/2, F1(2)/2, sprintf('F_A = %.2g',FA), 'Color','b','HorizontalAlignment','center')
text(F2(1)/2, F2(2)/2, sprintf('F_B = %.2g',FB), 'Color','r','HorizontalAlignment','center')
text(Ftot(1)/2, Ftot(2)/2, sprintf('F_{tot} = %.2g',norm(Ftot)), 'Color','g','HorizontalAlignment','center','FontWeight','bold')

% Axes and limits
maxlen = max([FA, FB, norm(Ftot)]) * 1.4;
xlim([-0.1*maxlen, maxlen])
ylim([-0.1*maxlen, maxlen])
xlabel('x')
ylabel('y')
title(sprintf('Vectors: F_A (blue), F_B (red, \\theta=%.1f°), Resultant', theta))
legend('F_A','F_B','F_{tot}','Location','bestoutside')
hold off