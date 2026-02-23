
fprintf('Centroid examples\n\n');

% 1) Straight line of length L along x from 0 to L
L = 2.0;
[x_line, y_line] = centroid_line_straight(L);
fprintf('Straight line (0->L): L=%.3g -> x_c=%.6g, y_c=%.6g\n', L, x_line, y_line);

% 2) Circular arc of radius r, central half-angle alpha (radians), centered so arc spans
r = 1.2;
alpha = pi/6; % 30 degrees
[x_arc, y_arc] = centroid_line_arc(r, alpha);
fprintf('Arc: r=%.3g, alpha=%.3g rad -> x_c=%.6g, y_c=%.6g (arc centroid)\n', r, alpha, x_arc, y_arc);

% 3) Rectangle width a, height b (corner at origin)
a = 3.0; b = 1.5;
[x_rect, y_rect] = centroid_rectangle(a, b);
fprintf('Rectangle: a=%.3g, b=%.3g -> x_c=%.6g, y_c=%.6g\n', a, b, x_rect, y_rect);

% 4) Right triangle with base a (x-direction) and height b (y-direction), right angle at origin
a = 3.0; b = 2.0;
[x_tri, y_tri] = centroid_right_triangle(a, b);
fprintf('Right triangle (right angle at origin): a=%.3g, b=%.3g -> x_c=%.6g, y_c=%.6g\n', a, b, x_tri, y_tri);

% 5) Circular sector (central angle 2*alpha) and full circle/semicircle special cases:
r = 2.0; alpha = pi/4; % sector half-angle; sector central angle = 2*alpha
[x_sector, y_sector] = centroid_sector(r, alpha);
fprintf('Sector (central angle=%.3g rad): r=%.3g -> x_c=%.6g, y_c=%.6g\n', 2*alpha, r, x_sector, y_sector);

% 6) Full circle centroid (should be at origin)
[x_circle, y_circle] = centroid_sector(r, pi); % alpha = pi gives full circle
fprintf('Full circle (r=%.3g) centroid -> x_c=%.6g, y_c=%.6g\n', r, x_circle, y_circle);

% 7) Semicircle (alpha = pi/2, central angle = pi)
[x_semic, y_semic] = centroid_sector(r, pi/2);
fprintf('Semicircle (r=%.3g) centroid -> x_c=%.6g, y_c=%.6g\n\n', r, x_semic, y_semic);

% --- Local functions ---

function [xc, yc] = centroid_line_straight(L)
% Centroid of a straight uniform line along x from 0 to L.
% Returns (xc, yc).
    xc = L/2;
    yc = 0;
end

function [xc, yc] = centroid_line_arc(r, alpha)
    if alpha == 0
        xc = 0; yc = 0;
        return
    end
    xc = 0;
    yc = r * sin(alpha) / alpha;
end

function [xc, yc] = centroid_rectangle(a, b)
% Centroid of rectangle width a (x) and height b (y) with corner at origin.
    xc = a/2;
    yc = b/2;
end

function [xc, yc] = centroid_right_triangle(a, b)

    xc = a/3;
    yc = b/3;
end

function [xc, yc] = centroid_sector(r, alpha)
    theta = 2*alpha; % central angle
    if theta == 0
        xc = 0; yc = 0; return
    end
    yc = (4 * r * sin(theta/2)) / (3 * theta);
    xc = 0;
end