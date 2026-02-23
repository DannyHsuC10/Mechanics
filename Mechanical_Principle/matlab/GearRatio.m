
% R = simpleGearRatio(T_driver, T_driven)
% Returns ratio R = omega_driven / omega_driver (signed: negative -> reversed direction).
function R = simpleGearRatio(T_driver, T_driven)
    validateattributes(T_driver, {'numeric'}, {'scalar','positive'});
    validateattributes(T_driven, {'numeric'}, {'scalar','positive'});
    % For simple external mesh: omega_driven / omega_driver = - T_driver / T_driven
    R = - T_driver ./ T_driven;
end

R = simpleGearRatio(20, 40); % -> -0.5 (driven rotates opposite at half speed)
disp(R);

% R = compoundGearRatio(T_drive_list, T_driven_list)
% Both inputs are vectors of equal length N representing N meshes (stages).
% Each stage i meshes a driving gear with teeth T_drive_list(i) to a driven gear T_driven_list(i).
% Returns overall ratio R = omega_out / omega_in (signed).
function R = compoundGearRatio(T_drive_list, T_driven_list)
    validateattributes(T_drive_list, {'numeric'}, {'vector','positive'});
    validateattributes(T_driven_list, {'numeric'}, {'vector','positive'});
    if numel(T_drive_list) ~= numel(T_driven_list)
        error('T_drive_list and T_driven_list must have same length.');
    end
    % Product of stage ratios (-T_drive/T_driven) for external meshes
    stageRatios = - T_drive_list(:) ./ T_driven_list(:);
    R = prod(stageRatios);
end


% Two-stage compound: driver->intermediate, intermediate->output
R = compoundGearRatio([20, 10], [40, 30]);
% Equals (-20/40)*(-10/30) = ( -0.5 )*( -0.3333 ) = +0.1667

% epicyclicGearRatio.m
% [omega_out, R] = epicyclicGearRatio(Ts, Tr, inputType, inputSpeed, outputType, carrierSpeed)
% Ts = teeth on sun, Tr = teeth on ring (internal), carrierSpeed optional (default 0).
% inputType/outputType: 'sun' | 'ring' | 'carrier'
% inputSpeed: numeric scalar (default 1). Returns omega_out and ratio R = omega_out / inputSpeed.
%
% Relation used (planetary with external planets meshing sun and internal ring):
% (omega_ring - omega_carrier) / (omega_sun - omega_carrier) = - Ts / Tr
function [omega_out, R] = epicyclicGearRatio(Ts, Tr, inputType, inputSpeed, outputType, carrierSpeed)
    % default args
    if nargin < 6, carrierSpeed = 0; end
    if nargin < 4 || isempty(inputSpeed), inputSpeed = 1; end

    validateattributes(Ts, {'numeric'}, {'scalar','positive'});
    validateattributes(Tr, {'numeric'}, {'scalar','positive'});
    validatestring(inputType, {'sun','ring','carrier'});
    validatestring(outputType, {'sun','ring','carrier'});
    validateattributes(inputSpeed, {'numeric'}, {'scalar'});
    validateattributes(carrierSpeed, {'numeric'}, {'scalar'});

    % unknowns: omega_s, omega_r, omega_c (carrier). Relation:
    % (omega_r - omega_c) = - (Ts/Tr) * (omega_s - omega_c)
    k = - Ts / Tr;

    % We'll express everything relative to carrier speed to simplify:
    % let xs = omega_s - omega_c, xr = omega_r - omega_c => xr = k * xs
    % so omega_s = xs + omega_c, omega_r = xr + omega_c = k*xs + omega_c
    % Given an input (one of omega_s,omega_r,omega_c) we solve for xs then compute desired output.

    switch lower(inputType)
        case 'sun'
            omega_s = inputSpeed;
            xs = omega_s - carrierSpeed;
        case 'ring'
            omega_r = inputSpeed;
            % xr = omega_r - omega_c = k * xs  => xs = xr / k
            xs = (omega_r - carrierSpeed) / k;
        case 'carrier'
            omega_c = inputSpeed;
            % carrier is given: xs unknown. But if only carrier given, and no other motion, we cannot determine others.
            % In this case we return outputs equal to carrier (no relative motion) unless other info provided.
            xs = 0;
            carrierSpeed = inputSpeed;
    end

    % compute all omegas
    omega_c = carrierSpeed;
    omega_s = xs + omega_c;
    omega_r = k * xs + omega_c;

    % pick output
    switch lower(outputType)
        case 'sun'
            omega_out = omega_s;
        case 'ring'
            omega_out = omega_r;
        case 'carrier'
            omega_out = omega_c;
    end

    R = omega_out ./ inputSpeed; % signed ratio
end


% Example 1: Sun driven at 10 rad/s, ring output desired (carrier fixed at 0)
[omega_ring, R] = epicyclicGearRatio(20, 60, 'sun', 10, 'ring', 0);
% Uses k = -20/60 = -1/3; (omega_r - 0) = k*(omega_s - 0) => omega_r = -1/3*10 = -3.333 rad/s
disp([omega_ring, R])
% Example 2: Carrier driven at 2 rad/s, sun input at 0 (locked), compute ring speed:
[omega_ring, R] = epicyclicGearRatio(18, 54, 'carrier', 2, 'ring', 2);
% With provided code xs = 0 -> omega_s = omega_c, omega_r = omega_c as returned.
disp([omega_ring, R])
% Example 3: Given ring input 5 rad/s, find sun speed (carrier 0):
[omega_sun, R] = epicyclicGearRatio(16, 64, 'ring', 5, 'sun', 0);
disp([omega_sun, R])