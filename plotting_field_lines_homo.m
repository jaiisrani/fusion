% This piece of code is for plotting field lines for a homogenous magnetic
% field.

X = [ 0 ];
Y = [ 0 ];
Z = [ 0 ];

for x = [ -4:1:3 ] % range of plotting the field
    for y = [ -4:1:3 ]
        for z = [ -4:1:3 ]
            X = [X, x]; % this is to append
            Y = [Y, y];     % the new coordinate
            Z = [Z, z];     % to the list of coords
        end
    end
end

load("input_variables.mat", "B0", "L")

Bx = 0*ones(1, 513); % homogenous magnetic field
By = 0*ones(1, 513); % homogenous magnetic field
Bz = B0*ones(1, 513); % homogenous magnetic field

q = quiver3(X, Y, Z, Bx, By, Bz);
axis equal;
q.ShowArrowHead = 'on';
q.Marker = '.';
xlabel("x");
ylabel("y");
zlabel("z");

save("bottle_field_cartesian.mat")