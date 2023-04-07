% This piece of code will prepare the required arrays for training data
% . i.e. the cumulative set of datapoints for various loops at various
% times. We keep v constant as that ensures constant gyrophase

m = 1; % mass of particle
e = 1; % charge of particle

c = 1; % speed of light

% magnetic bottle parameters
B0 = 50; % order of magnitude of magnetic field
L = 1; % inverse scaling factor of magnetic field with distance from origin

tspan = [0:0.05:30]; % sim. time % an array from 0 to 30 with step of 0.05

training_data = zeros(1, 6); % initialize the variable called training_data. We
                            % will append rows to it later

counter = 0; % a counter used for indexing the two arrays as visible below
% the loop below is used for preparing the training data and labels.
for x0 = 0.1 : 0.1 : 1 
    for y0 = 0.1 : 0.1 : 1
        for z0 = 0.1 : 0.1 : 1 
                counter = counter + 1;

                y_0 = [x0 y0 z0 1 0 1]; % initial conditions for y = [x y z vx vy vz]

                [t, y] = ode45( @(t, y)DEs(t,y,e,B0,m,c,L), tspan, y_0); % solving the DEs

                training_data = [training_data; y]; % appending datapoints as rows

        end
    end
end

% saving all variables, including the training data and labels, in a .mat file
save("training_data_and_labels.mat");

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