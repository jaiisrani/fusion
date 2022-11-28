
% parameters
e = 1; B0 = 1; m = 1; c = 1; L = 1;

% initial and boundary conditions
tspan = [0 20]; 
y0 = [0 0 0 1 0 1];

% solving the differential equations
[t, y] = ode45( @(t, y)DEs(t,y,e,B0,m,c,L), tspan, y0);

% plotting the desired quantities
% plot( t, y(:, 1) );

% plotting trajectory
plot3(y(:, 1), y(:, 2), y(:, 3));
xlabel('x');
ylabel('y');
zlabel('z');

% system of differential equations
    % y = [x y z vx vy vz]
function dydt = DEs(t, y, e, B0, m, c, L)

    dydt = zeros(6, 1);
    dydt(1) = y(4);
    dydt(2) = y(5);
    dydt(3) = y(6);
    dydt(4) = (e * B0)/(m*c) * ( y(5)*(1 + (y(3)^2)/L^2) + y(6)*y(2)*y(3)/L^2 );
    dydt(5) = -(e * B0)/(m*c) * ( y(4)*(1 + (y(3)^2)/L^2) + y(6)*y(1)*y(3)/L^2 );
    dydt(6) = (e * B0)/(m*c) * ( y(5)*y(1)*y(3)/L^2 - y(4)*y(2)*y(3)/L^2 );

end
