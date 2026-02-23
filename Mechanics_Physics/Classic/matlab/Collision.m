
% two_body_collision_positions.m
clearvars; close all;

% --- Parameters ---
m1 = 1.0;        % mass 1 (kg)
m2 = 2.0;        % mass 2 (kg)
e  = 0.5;        % coefficient of restitution (0..1)

x1_0 = 0;        % initial pos mass1 (m)
x2_0 = 5;        % initial pos mass2 (m) (to the right)
v1_0 = 2.0;      % initial vel mass1 (m/s) (right positive)
v2_0 = -0.5;     % initial vel mass2 (m/s) (left negative)

tmax = 5;        % total sim time (s)
dt = 0.002;      % time resolution

t = 0:dt:tmax;

% --- Compute collision time analytically if they meet ---
if abs(v1_0 - v2_0) < eps
    t_coll = Inf; % same velocity => never meet
else
    t_coll = (x2_0 - x1_0) / (v1_0 - v2_0);
end

% Collision must be within (0,tmax]
collide = isfinite(t_coll) && (t_coll >= 0) && (t_coll <= tmax);

% Preallocate
x1 = nan(size(t)); x2 = nan(size(t));
v1 = nan(size(t)); v2 = nan(size(t));

if collide
    % before collision
    idx_before = t <= t_coll;
    x1(idx_before) = x1_0 + v1_0 * t(idx_before);
    x2(idx_before) = x2_0 + v2_0 * t(idx_before);
    v1(idx_before) = v1_0;
    v2(idx_before) = v2_0;

    % velocities after collision (1D with restitution e)
    % relative velocity along line reverses with factor e:
    % v_rel_after = -e * v_rel_before
    v_rel_before = v1_0 - v2_0;
    % Use conservation of momentum and restitution:
    % v1' = v1_0 + (-(1+e)*m2/(m1+m2)) * v_rel_before
    % v2' = v2_0 + ( (1+e)*m1/(m1+m2)) * v_rel_before
    v1p = v1_0 - (1+e) * m2/(m1+m2) * v_rel_before;
    v2p = v2_0 + (1+e) * m1/(m1+m2) * v_rel_before;

    % positions at collision instant
    x1_coll = x1_0 + v1_0 * t_coll;
    x2_coll = x2_0 + v2_0 * t_coll;

    % after collision
    idx_after = t > t_coll;
    tau = t(idx_after) - t_coll;
    x1(idx_after) = x1_coll + v1p * tau;
    x2(idx_after) = x2_coll + v2p * tau;
    v1(idx_after) = v1p;
    v2(idx_after) = v2p;
else
    % never collide within tmax: simple linear motion
    x1 = x1_0 + v1_0 * t;
    x2 = x2_0 + v2_0 * t;
    v1(:) = v1_0;
    v2(:) = v2_0;
end

% --- Plot positions ---
figure();
plot(t, x1, '-','LineWidth',1.6); hold on
plot(t, x2, '--','LineWidth',1.6);
if collide
    xline(t_coll, ':k', sprintf('t_{coll}=%.3f s', t_coll), 'LabelHorizontalAlignment','left', 'HandleVisibility','off');
    % mark collision point on position curves
    plot(t_coll, x1_coll, 'ko', 'MarkerFaceColor','k');
end
xlabel('Time (s)');
ylabel('Position (m)');
title('Positions of Two Masses vs Time (1-D Collision)');
legend({sprintf('m1=%.2g (x1)',m1), sprintf('m2=%.2g (x2)',m2)}, 'Location','best');
grid on; axis tight;