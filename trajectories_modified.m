
%% simulating trajectories %%

% parameters
m = 1 * 10^(-27); 
c = 3 * 10^8; e = 1.6 * 10^(-19);

B_varphi = 0.2;
A_varphi = 0.2;
E_R = 0.2; E_Z = 0.2;

% Boundary conditions
tspan = [0 100];
y0 = [0.5 0.5 0.5 0.5 0.5 0.5];

% solving the systems of DEs
[t, y] = ode45(@(t, y)odefn(t, y, m, c, e, B_varphi, A_varphi, E_R, E_Z), tspan, y0);

% plotting the solutions
plot(t, y(5), 'o');
%plot(t, y(5), '-');
%plot(t, y(2), '*');


% Writing the RHS of differential equations 
    % y = [R, Z, v_R, v_Z, varphi, p_varphi]
function dydt = odefn(t, y, m, c, e, B_varphi, A_varphi, E_R, E_Z)

    dydt = zeros(6, 1);
    dydt(1) = y(3);
    dydt(2) = y(4);
    
    dydt(3) = - (B_varphi*e/(m*c))*y(4) + m^(-2)*( y(6)/y(1) - ...
        e*A_varphi/c)*( y(6)/(y(1)^2) + 0) + (e*E_R)/m; % replace 0 by e/c * \partial{A_varphi}/\partial{R}
    dydt(4) = - (B_varphi*e/(m*c))*y(3) + m^(-2)*( y(6)/y(1) - ...
        e*A_varphi/c)*0 + (e*E_Z)/m; % replace 0 by e/c * \partial{A_varphi}/\partial{Z}
    
    dydt(5) = ( y(6)/y(1) - e*A_varphi/c )*1/(m*y(1));
    dydt(6) = 0;
end