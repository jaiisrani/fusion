
% I shall import the variables corresponding to the particle's cartesian 
% trajectory from the file trajectories_bottle_cartesian.mat and find the 
% corresponding trajectory in cylindrical coordinates.

load("trajectories_bottle_cartesian.mat", "y");
load("trajectories_bottle_cartesian.mat", "tspan");

% y = [x y z vx vy vz]

r = sqrt ( y(:, 1).^2 + y(:, 2).^2 + y(:, 3).^2 );
z = y(:, 3);
phi = acos (z ./ r);

y_cylindrical = [r, phi, z];

plot(y_cylindrical(:, 2), y_cylindrical(:, 3));