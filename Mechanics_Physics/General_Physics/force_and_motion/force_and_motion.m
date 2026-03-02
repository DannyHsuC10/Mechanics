clc;clear;
function tools = physicsToolkit()
tools.speed             = @(path, time) path./time;
tools.velocity          = @(displ, time) displ./time;
tools.instantaneous_v   = @(dx, dt) dx./dt;
tools.acceleration      = @(dv, dt) dv./dt;
tools.vf                = @(vi, a, t) vi + a.*t;
tools.x_at              = @(xi, vi, a, t) xi + vi.*t + 0.5.*a.*t.^2;
tools.centripetal_a     = @(v, r) v.^2 ./ r;
tools.omega             = @(dtheta, dt) dtheta./dt;
tools.alpha             = @(domega, dt) domega./dt;
tools.theta_f           = @(thetai, alpha, t) thetai + alpha.*t;
tools.theta_pos         = @(thetai, wi, alpha, t) thetai + wi.*t + 0.5.*alpha.*t.^2;
tools.resultant_force   = @(Fx, Fy, Fz) sqrt(Fx.^2 + Fy.^2 + Fz.^2);
tools.force_mass_acc    = @(m, a) m.*a;
tools.gravitational_force = @(G, M, m, r) G.*M.*m ./ r.^2;
tools.weight            = @(m, g) m.*g;
tools.friction          = @(mu, N) mu.*N;
tools.spring_force      = @(k, x) k.*x;
tools.drag_linear       = @(B, v) B.*v;
tools.drag_quad         = @(C, rho, A, v) 0.5 .* C .* rho .* A .* v.^2;
tools.pressure          = @(F, A) F./A;
tools.buoyancy          = @(V, D) V.*D;
tools.torque            = @(r_vec, F_vec) cross(r_vec, F_vec);
tools.work              = @(F_vec, x_vec) dot(F_vec, x_vec);
tools.kinetic_energy    = @(m, v) 0.5 .* m .* v.^2;
tools.potential_grav    = @(m, g, h) m .* g .* h;
tools.elastic_potential = @(k, x) 0.5 .* k .* x.^2;
tools.power             = @(E, t) E./t;
tools.momentum          = @(m, v_vec) m .* v_vec;
tools.coulomb           = @(kc, Q, q, r) kc .* Q .* q ./ r.^2;
tools.lorentz_force     = @(q, v_vec, B_vec) q .* cross(v_vec, B_vec);
end



% create tools and call functions
tools = physicsToolkit;
s = tools.speed(100, 20)          % 5 m/s
x = tools.x_at(0, 2, 1, 3)        % position after 3 s
a_cent = tools.centripetal_a(10, 2)  % centripetal acceleration
F = tools.resultant_force(3,4,0) % 5 N
KE = tools.kinetic_energy(1.5, 3)