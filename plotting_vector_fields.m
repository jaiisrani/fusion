X = [ 0 ];
Y = [ 0 ];
Z = [ 0 ];

for x = [ -3:2:3 ]
    for y = [ -3:2:3 ]
        for z = [ -3:2:3 ]
            X = [X, x]; % this is to append
            Y = [Y, y];     % the new coordinate
            Z = [Z, z];     % to the list of coords
        end
    end
end

B0 = 1; L =1;

Bx = -(B0 / L^2) * Z .* X;
By = -(B0 / L^2) * Z .* Y;
Bz = B0 * (1 + (Z.^2)/L^2 );

q = quiver3(X, Y, Z, Bx, By, Bz);
axis equal;
q.ShowArrowHead = 'off';
q.Marker = '.';
xlabel("Bx");
ylabel("By");
zlabel("Bz");