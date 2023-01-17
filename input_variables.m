% This file contains variables whose values need to be inputted before
% simulations

m = 1; % mass of particle
e = 1; % charge of particle

c = 1; % speed of light

% magnetic bottle
B0 = 5; % order of magnitude of magnetic field
L = 1; % inverse scaling factor of magnetic field with distance from origin

% initial/boundary conditions for trajectory
tspan = [0:0.01:20]; % sim. time % an array from 0 to 100 with step of 0.1
y0 = [1 0 1 1 1 0]; % initial conditions for y = [x y z vx vy vz]

save("input_variables.mat"); % copying all these variables in a .mat file
% that can be called using the 'load' function.