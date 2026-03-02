clc;clear;
function tools = opticsToolkit()

% Basic helpers
tools.deg2rad = @(x) (pi/180) .* x;
tools.rad2deg = @(x) (180/pi) .* x;
tools.is_propagating = @(s) abs(s) <= 1;

% Diffraction: d*sin(theta) = n*lambda
tools.theta_from_diffraction = @(d, n, lambda) arrayfun(@(D,N,L) safe_asin_check(N.*L./D), d, n, lambda);
tools.lambda_from_diffraction = @(d, n, theta) (d .* sin(theta)) ./ n;
tools.order_from_diffraction = @(d, theta, lambda) (d .* sin(theta)) ./ lambda;

% Reflection: theta_r = theta_i
tools.reflection_angle = @(theta_i) theta_i;

% Refraction (Snell): n1*sin(theta1) = n2*sin(theta2)
tools.snell_theta2 = @(n1, theta1, n2) arrayfun(@(N1,Th1,N2) safe_asin_check(N1*sin(Th1)./N2), n1, theta1, n2);
tools.snell_theta1 = @(n2, theta2, n1) arrayfun(@(N2,Th2,N1) safe_asin_check(N2*sin(Th2)./N1), n2, theta2, n1);

% Internal safe asin with NaN on total internal reflection / invalid args
    function th = safe_asin_check(x)
        if isnan(x)
            th = NaN;
            return
        end
        if abs(x) <= 1
            th = asin(x);
        else
            % total internal reflection or invalid geometry -> return NaN
            th = NaN;
            warning('Value %.6g out of [-1,1]: result is not a propagating angle (returned NaN).', x);
        end
    end

end


tools = opticsToolkit;                      % runs demo if no output

% Diffraction: find angle for first-order maximum
d = 2e-6; lambda = 650e-9; n = 1;
theta = tools.theta_from_diffraction(d, n, lambda);   % radians
theta_deg = tools.rad2deg(theta)

% Compute wavelength for given theta and order
lambda_calc = tools.lambda_from_diffraction(d, n, theta)

% Reflection: reflected angle equals incident
theta_r = tools.reflection_angle(tools.deg2rad(25))  % input radians

% Refraction (Snell): compute theta2
n1 = 1.0; n2 = 1.33; theta1 = tools.deg2rad(30);
theta2 = tools.snell_theta2(n1, theta1, n2)          % output radians