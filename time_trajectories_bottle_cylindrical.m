% visualizing Cylindrical trajectories in time

% loading initial conditions
load("input_variables.mat", "tspan");

% loading the trajectories simulated in trajectories_bottle_cartesian.m
load("trajectories_bottle_cylindrical.mat", "R", "phi", "z");

% calculate number of timesteps
n_steps = length(tspan);

R = R; phi = phi; z = z;

%% plotting R, phi and z coordinates individually against time
figure(2);
plot(tspan, phi); % plotting R against t
xlabel("t");
ylabel("phi");
hold on;
figure(1);
plot(tspan, R); % plotting phi against t
xlabel("t");
ylabel("R");
hold on;
figure(3);
plot(tspan, z); % plotting z against t
xlabel("t");
ylabel("z");
hold on;

%% plotting 3d trajectory in timesteps
figure(4);
for step = 1: n_steps/50 :n_steps %% 'step' need not be an integer so
                                  %% we use float below
    x1 = R(1: floor(step)); % x coordinate
    x2 = phi(1: floor(step)); % y coordinate
    x3 = z(1: floor(step)); % z coordinate
    
    plot3(x1, x2, x3);
    xlim([0, 2]); % clean this up
    ylim([-1, 1]); % clean this up
    zlim([-2, 2]); % clean this up
    xlabel('R');
    ylabel('phi');
    zlabel('z');
    hold on;
    pause(1);
end