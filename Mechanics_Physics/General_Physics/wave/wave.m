clc;clear;
function tools = waveToolkit()


% Constants (defaults)
tools.constants.p_ref = 20e-6;  % Pa, common SPL reference
tools.constants.P_ref = 1;      % W, generic power reference (user-specified as needed)

% Period & frequency
tools.freq_from_period     = @(T) 1 ./ T;
tools.period_from_freq     = @(f) 1 ./ f;
tools.freq_from_wave       = @(v, lambda) v ./ lambda;  % wave speed v, wavelength lambda
tools.wavelength_from_freq = @(v, f) v ./ f;

% Decibel / power
tools.db_from_power    = @(P, Pref) 10 .* log10( P ./ (Pref) );  % 10*log10 for power quantities
tools.power_from_db    = @(dB, Pref) (Pref) .* 10.^( dB ./ 10 );

% Sound pressure level (SPL) using pressure amplitude: SPL = 20*log10(p / p_ref)
tools.spl_from_pressure    = @(p, p_ref) 20 .* log10( p ./ (p_ref) );
tools.pressure_from_spl    = @(SPL, p_ref) (p_ref) .* 10.^( SPL ./ 20 );

% If user omits reference, use defaults
tools.db_from_power_def = @(P) tools.db_from_power(P, tools.constants.P_ref);
tools.power_from_db_def = @(dB) tools.power_from_db(dB, tools.constants.P_ref);
tools.spl_from_pressure_def = @(p) tools.spl_from_pressure(p, tools.constants.p_ref);
tools.pressure_from_spl_def = @(SPL) tools.pressure_from_spl(SPL, tools.constants.p_ref);

end


tools = waveToolkit;               % runs demo if no output
% Period/frequency
f = tools.freq_from_period(0.02)   % 50 Hz
lambda = tools.wavelength_from_freq(343, 1000) % wave length for f=1000 Hz in air

% Decibel (power)
dB = tools.db_from_power(0.01, 1)  % 10*log10(0.01/1) = -20 dB

% Sound pressure level (SPL) using default reference 20 μPa
SPL = tools.spl_from_pressure_def(0.02)   % 20 mPa -> compute SPL
p = tools.pressure_from_spl_def(60)       % pressure corresponding to 60 dB SPL