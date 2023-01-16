% visualizing Cartesian trajectories in time

% loading initial conditions
load("input_variables.mat", "tspan");

% loading the trajectories simulated in trajectories_bottle_cartesian.m
load("trajectories_bottle_cartesian.mat", "y");

% calculate number of timesteps
n_steps = length(tspan);

%% plotting x, y and z coordinates individually against time
figure(1);
plot(tspan, y(:, 1)); % plotting x against t
xlabel("t");
ylabel("x");
hold on;
figure(2);
plot(tspan, y(:, 2)); % plotting y against t
xlabel("t");
ylabel("y");
hold on;
figure(3);
plot(tspan, y(:, 3)); % plotting z against t
xlabel("t");
ylabel("z");
hold on;

%% plotting 3d trajectory in timesteps
figure(4);
for step = 1: n_steps/50 :n_steps %% 'step' need not be an integer so
                                  %% we use float below
    x1 = y(1: floor(step), 1); % x coordinate
    x2 = y(1: floor(step), 2); % y coordinate
    x3 = y(1: floor(step), 3); % z coordinate
    
    plot3(x1, x2, x3);
    xlim([0, 2]); % clean this up
    ylim([-1, 1]); % clean this up
    zlim([-2, 2]); % clean this up
    xlabel('x');
    ylabel('y');
    zlabel('z');
    hold on;
    pause(1);
end