

e = 1; m = 1; c = 1;

% Initial conditions
tspan = [0 10];
y0 = [0 0 0 0 0.5 1];

% Solve the system of DEs
[t, y] = ode45( @(t, y)odefn(t, y, e, m, c), tspan, y0 );

% Plot the solutions
plot( t, y(:, 6) );

% Writing out the DEs
    % y = (x, y, z, vx, vy, vz)
function dydt = odefn(t, y, e, m, c)

    dydt = zeros(6, 1);
    dydt(1) = y(4);
    dydt(2) = y(5);
    dydt(3) = y(6);
    dydt(4) = ( y(5)*Bz() - By()*y(6) )*e/(m*c);
    dydt(5) = -( y(4)*Bz() - Bx()*y(6) )*e/(m*c);
    dydt(6) = ( y(4)*By() - Bx()*y(5) )*e/(m*c);

    function bx = Bx()
        bx = 0;
    end
    function by = By()
        by = 0;
    end
    function bz = Bz()
        bz = 2;
    end

end
