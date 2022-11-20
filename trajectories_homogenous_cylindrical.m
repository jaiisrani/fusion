
% Parameters
e = 1; m = 1; c = 1;
Bz = -1; % Homogenous magnetic field along z axis

% Initial conditions
tspan = [0 200];
y0 = [0.7 0 0 0 -Bz*e/(m*c) 0]; % we have to put vphi0 according
                   % to Bz because the other is automatically known if one is known

% Solve the system of DEs
[t, y] = ode45( @(t, y)odefn(t, y, e, m, c, Bz), tspan, y0 );
y(:, 2) = mod(y(:, 2), 2*pi);

% Plot the solutions
plot( t, y(:, 2) );

% Writing out the DEs
    % y = (r, phi, z, vr, vphi, vz)
function dydt = odefn(t, y, e, m, c, Bz)

    dydt = zeros(6, 1);
    dydt(1) = y(4);
    dydt(2) = y(5);
    dydt(3) = y(6);
    dydt(4) = y(1) * y(5)^2 + y(1) * y(5) * e*Bz / (m*c);
    dydt(5) = -2 * y(4) * y(5)/y(1) - (y(4)/y(1)) * e*Bz / (m*c);
    dydt(6) = 0;

end
