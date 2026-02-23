clear;

m  = 2.0;        % mass (kg)
g  = 9.81;       % gravity (m/s^2)
N  = m * g;      % normal force
mu_s = 0.6;      % static friction coefficient
mu_k = 0.5;      % kinetic friction coefficient

F_app = linspace(0, 30, 300);   % applied horizontal force (N)

F_fric = zeros(size(F_app));    % friction force magnitude
F_net  = zeros(size(F_app));    % net force (positive -> accelerates right)
a      = zeros(size(F_app));    % acceleration

F_max_static = mu_s * N;
F_kin = mu_k * N;

for i = 1:length(F_app)
    F = F_app(i);
    if F <= F_max_static
        % Object does not move: static friction cancels applied force
        F_fric(i) = F;         % static friction matches F
        F_net(i)  = 0;
        a(i)      = 0;
    else
        % Object moves: kinetic friction acts opposite motion
        F_fric(i) = F_kin;
        F_net(i)  = F - F_kin;
        a(i)      = F_net(i) / m;
    end
end

figure();
yyaxis left
plot(F_app, F_fric, 'r-', 'LineWidth',1.6); hold on
plot(F_app, F_net,  'b--', 'LineWidth',1.6);
ylabel('Force (N)')
legend('Friction magnitude','Net force F_{net}','Location','northwest')
