% Compute second moment of area / related quantities for common shapes.
% Uses the formulas provided in the query.

clear; clc;

% --- Example dimensions (change as needed)
b = 0.12;    % width (m)
h = 0.20;    % height (m)
R = 0.05;    % radius (m)

% Rectangle (centroidal axes)
[A_rect, Ix_rect, Iy_rect] = rect_inertia(b, h);
fprintf('Rectangle b=%.3fm h=%.3fm: A=%.6f m^2, Ix=%.6e m^4, Iy=%.6e m^4\n', b, h, A_rect, Ix_rect, Iy_rect);

% Triangle (assumed with base b and height h, centroidal axes formulas as given)
[A_tri, Ix_tri, Iy_tri] = triangle_inertia(b, h);
fprintf('Triangle b=%.3fm h=%.3fm: A=%.6f m^2, Ix=%.6e m^4, Iy=%.6e m^4\n', b, h, A_tri, Ix_tri, Iy_tri);

% Circle (full)
[A_circ, Ix_circ, Iy_circ] = circle_inertia(R);
fprintf('Circle R=%.3fm: A=%.6f m^2, Ix=%.6e m^4, Iy=%.6e m^4\n', R, A_circ, Ix_circ, Iy_circ);

% Half circle (use provided simple formulas)
[A_half, Ix_half, Iy_half] = halfcircle_inertia(R);
fprintf('Half circle R=%.3fm: A=%.6f m^2, Ix=%.6e m^4, Iy=%.6e m^4\n', R, A_half, Ix_half, Iy_half);

% Quarter circle
[A_quarter, Ix_quarter, Iy_quarter] = quartercircle_inertia(R);
fprintf('Quarter circle R=%.3fm: A=%.6f m^2, Ix=%.6e m^4, Iy=%.6e m^4\n\n', R, A_quarter, Ix_quarter, Iy_quarter);

% Utilities: parallel axis, section modulus, radius of gyration, polar J
% Example: translate rectangle Ix about axis a distance L from centroid
L = 0.1; % m
Ix_shifted = parallel_axis(Ix_rect, A_rect, L);
fprintf('Rectangle Ix about parallel axis at L=%.3fm: Ix_shifted=%.6e m^4\n', L, Ix_shifted);

% Section modulus for rectangle about x (y_max = h/2)
Zx_rect = section_modulus(Ix_rect, h/2);
fprintf('Rectangle section modulus Zx = %.6e m^3 (y_max=%.3gm)\n', Zx_rect, h/2);

% Radius of gyration
K_rect = radius_of_gyration(Ix_rect, A_rect);
fprintf('Rectangle radius of gyration K = %.6e m\n', K_rect);

% Polar second moment J for rectangle (about same centroid)
J_rect = polar_J(Ix_rect, Iy_rect);
KJ_rect = sqrt(J_rect / A_rect);
fprintf('Rectangle polar J = %.6e m^4, polar K_J = %.6e m\n\n', J_rect, KJ_rect);

% Print a compact table of results for shapes
shapes = {'Rectangle','Triangle','Circle','Half circle','Quarter circle'};
A_vals  = [A_rect, A_tri, A_circ, A_half, A_quarter];
Ix_vals = [Ix_rect, Ix_tri, Ix_circ, Ix_half, Ix_quarter];
Iy_vals = [Iy_rect, Iy_tri, Iy_circ, Iy_half, Iy_quarter];

fprintf('Shape\t\tA (m^2)\t\tIx (m^4)\t\tIy (m^4)\n');
for k = 1:numel(shapes)
    fprintf('%-12s %.4e\t %.4e\t %.4e\n', shapes{k}, A_vals(k), Ix_vals(k), Iy_vals(k));
end

% --------- Local function definitions ---------

function [A, Ix, Iy] = rect_inertia(b, h)
% Rectangle centroidal area and second moments
    A = b * h;
    Ix = b * h^3 / 12;   % about centroidal x-axis (axis through centroid, parallel to b)
    Iy = h * b^3 / 12;   % about centroidal y-axis
end

function [A, Ix, Iy] = triangle_inertia(b, h)
% Triangle area and centroidal second moments
% Uses formulas provided: Ix = b*h^3/36, Iy = h*b^3/36
    A = 0.5 * b * h;
    Ix = b * h^3 / 36;
    Iy = h * b^3 / 36;
end

function [A, Ix, Iy] = circle_inertia(R)
% Full circle area and centroidal second moments (about centroidal axes)
    A = pi * R^2;
    Ix = pi * R^4 / 4;
    Iy = Ix;
end

function [A, Ix, Iy] = halfcircle_inertia(R)
% Half circle (as provided). Interpretations:
% Using the provided simple formulas Ix = Iy = pi R^4 / 8
    A = 0.5 * pi * R^2;
    Ix = pi * R^4 / 8;
    Iy = Ix;
end

function [A, Ix, Iy] = quartercircle_inertia(R)
% Quarter circle (as provided): Ix = Iy = pi R^4 / 16
    A = 0.25 * pi * R^2;
    Ix = pi * R^4 / 16;
    Iy = Ix;
end

function I_shift = parallel_axis(I_centroid, A, L)
% Parallel axis theorem: I_about_new_axis = I_centroid + A * L^2
    I_shift = I_centroid + A * L^2;
end

function Z = section_modulus(I, y_max)
% Section modulus Z = I / y_max
    Z = I / y_max;
end

function K = radius_of_gyration(I, A)
% Radius of gyration K = sqrt(I / A)
    K = sqrt(I ./ A);
end

function J = polar_J(Ix, Iy)
% Polar second moment J = Ix + Iy
    J = Ix + Iy;
end