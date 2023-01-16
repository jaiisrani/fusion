% This file is for visualizing magnetic field and trajectories in
% the same plot

% load variables pertaining magnetic field
load("bottle_field_cartesian.mat", "Bx", "By", "Bz");
% plot magnetic field
figure(1);
q = quiver3(X, Y, Z, Bx, By, Bz);
axis equal;
q.ShowArrowHead = 'off';
q.Marker = '.';
xlabel("x");
ylabel("y");
zlabel("z");
hold on;

% load variables pertaining trajectories
load("trajectories_bottle_cartesian.mat", "y");

% plotting trajectory
figure(1);
plot3(y(:, 1), y(:, 2), y(:, 3));
xlabel('x');
ylabel('y');
zlabel('z');
hold on;