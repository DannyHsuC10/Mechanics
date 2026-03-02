clc;clear;
function tools = energyToolkit()

% Physical constants (SI)
c = 299792458;                  % m/s
h = 6.62607015e-34;             % J*s (Planck constant)
kB = 1.380649e-23;              % J/K (Boltzmann constant)
sigma = 5.670374419e-8;         % W/m^2/K^4 (Stefan-Boltzmann)
tools.constants.c = c;
tools.constants.h = h;
tools.constants.kB = kB;
tools.constants.sigma = sigma;
tools.constants.eV = 1.602176634e-19; % J per eV

% Kinetic & potential energy
tools.kinetic_energy = @(m, v) 0.5 .* m .* v.^2;
tools.grav_potential = @(m, g, h) m .* g .* h;
tools.elastic_potential = @(k, x) 0.5 .* k .* x.^2;
tools.electric_energy = @(Q, V) Q .* V;

% Conservation (mechanical): solve for vf from energy conservation
% vf = sqrt( vi^2 + 2 g (hi - hf) )
tools.solve_final_vel_from_energy = @(m, vi, hi, hf, g) sqrt( max(0, vi.^2 + 2 .* g .* (hi - hf)) );

% Inverse helpers (examples use algebraic rearrangements)
tools.solve_initial_vel_for_energy = @(vf, hi, hf, g) sqrt( max(0, vf.^2 - 2 .* g .* (hi - hf)) );
tools.solve_height_from_vel = @(m, vi, vf, g) ( (0.5 .* m .* (vi.^2 - vf.^2)) ./ (m .* g) );

% Mass-energy equivalence
tools.mass_energy = @(m) m .* c.^2;

% Photoelectric / photon energy
tools.photon_energy = @(h_in, f) h_in .* f;        % typically use tools.constants.h

% Planck's law (spectral radiance)
% B_nu(nu,T) = 2 h nu^3 / c^2 * 1/(exp(h nu / (k_B T)) - 1)
tools.planck_Bnu = @(nu, T) (2 .* h .* nu.^3 ./ c.^2) .* (1 ./ (exp( (h .* nu) ./ (kB .* T) ) - 1));

% B_lambda(lambda,T) = 2 h c^2 / lambda^5 * 1/(exp(h c /(lambda k_B T)) - 1)
tools.planck_Bl = @(lambda, T) (2 .* h .* c.^2 ./ lambda.^5) .* (1 ./ (exp( (h .* c) ./ (lambda .* kB .* T) ) - 1));

end


tools = energyToolkit;          % runs demo if no output

% Kinetic energy
K = tools.kinetic_energy(1.5, 4.0)   % J

% Gravitational potential
U = tools.grav_potential(1.5, 9.81, 2.0) % J

% Elastic potential
Us = tools.elastic_potential(150, 0.02)  % J

% Conservation: compute final speed after falling from 5 m to 0 m
vf = tools.solve_final_vel_from_energy(1, 0, 5, 0, 9.81)

% Mass-energy
E = tools.mass_energy(0.01)  % J

% Photon energy / photoelectric
Eph = tools.photon_energy(tools.constants.h, 5e14) % J

% Planck spectral radiance
Bnu = tools.planck_Bnu(5e14, 3000)     % W sr^-1 m^-2 Hz^-1
Blambda = tools.planck_Bl(500e-9, 3000)% W sr^-1 m^-3