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

Bx = -(B0 / L^2) * Z .* X;
By = -(B0 / L^2) * Z .* Y;
Bz = B0 * (1 + (Z.^2)/L^2 );

q = quiver3(X, Y, Z, Bx, By, Bz);
axis equal;
q.ShowArrowHead = 'on';
q.Marker = '.';
xlabel("x");
ylabel("y");
zlabel("z");

save("bottle_field_cartesian.mat")