
function G = gear_params(T, M, TA, TB)
% G = gear_params(T, M, TA, TB)
% Compute gear geometry properties from teeth T and module M.
% Inputs:
%   T  - teeth (scalar)
%   M  - module (length units per tooth)
%   TA - (optional) teeth of mating gear A (if omitted TA = T)
%   TB - (optional) teeth of mating gear B (if omitted TB = TA)
% Output:
%   G - struct with fields for diameters, radii, circumferences, addendum, etc.
%
% Example:
%  G = gear_params(20, 2);          % single gear
%  Gpair = gear_params(20,2,40,20); % pair example (TA,TB provided)

if nargin < 3 || isempty(TA), TA = T; end
if nargin < 4 || isempty(TB), TB = TA; end

% Basic diameters and radii
G.T = T;
G.M = M;
G.Dp = T * M;                 % pitch diameter
G.Rp = G.Dp / 2;              % pitch radius
G.Cp = pi * G.Dp;             % pitch circumference

G.Dt = (T + 2) * M;           % tip (outside) diameter
G.Rt = G.Dt / 2;
G.Ct = pi * G.Dt;

G.Dr = (T - 2.5) * M;         % root diameter (per your table)
G.Rr = G.Dr / 2;
G.Cr = pi * G.Dr;

% Base diameter using cos(pi/9) factor from your table
G.Db = cos(pi/9) * T * M;
G.Rb = G.Db / 2;
G.Cb = pi * G.Db;

% Addendum, dedendum, tooth height, clearance, working depth
G.Addendum = 1 * M;
G.Dedendum = 1.25 * M;
G.ToothHeight = 2.25 * M;
G.Clearance = 0.25 * M;
G.WorkingDepth = 2 * M;

% Pitch, circular tooth thickness and space width (interpreted M2 as M/2)
G.PitchLinear = pi * M;
G.CircularThickness = pi * M / 2;
G.SpaceWidth = pi * M / 2;

% Fillet radius
G.FilletRadius = 0.236 * M;

% Center distance for gear pair (if TA,TB provided)
G.TA = TA; G.TB = TB;
G.CenterDistance = M * (TA + TB) / 2;

% Diametral pitch (imperial) - standard relation: DP = 25.4 / M
G.DiametralPitch = 25.4 ./ M;

% Derived checks/notes
G.Notes = { ...
    'Units of lengths follow those of M', ...
    'Diametral pitch DP = 25.4/M (imperial conversion)', ...
    'Root diameter formula uses T-2.5 as provided' ...
    };

% Print summary
fprintf('Gear parameters (T=%g, M=%g)\n', T, M);
fprintf(' Dp=%.6g, Rp=%.6g, Cp=%.6g\n', G.Dp, G.Rp, G.Cp);
fprintf(' Dt=%.6g, Rt=%.6g, Ct=%.6g\n', G.Dt, G.Rt, G.Ct);
fprintf(' Dr=%.6g, Rr=%.6g, Cr=%.6g\n', G.Dr, G.Rr, G.Cr);
fprintf(' Db=%.6g, Rb=%.6g, Cb=%.6g\n', G.Db, G.Rb, G.Cb);
fprintf(' Addendum=%.6g, Dedendum=%.6g, ToothHeight=%.6g\n', G.Addendum, G.Dedendum, G.ToothHeight);
fprintf(' Clearance=%.6g, WorkingDepth=%.6g\n', G.Clearance, G.WorkingDepth);
fprintf(' PitchLinear=%.6g, CircularThickness=%.6g, SpaceWidth=%.6g\n', G.PitchLinear, G.CircularThickness, G.SpaceWidth);
fprintf(' FilletRadius=%.6g\n', G.FilletRadius);
fprintf(' CenterDistance (pair TA=%g, TB=%g) = %.6g\n', TA, TB, G.CenterDistance);
fprintf(' DiametralPitch DP = %.6g (1/length units)\n', G.DiametralPitch);

end
T = 20;
M = 1;
gear_params(T, M)