# fusion

In [this](https://github.com/jaiisrani/fusion/blob/main/trajectories_homogenous_cartesian.m) program, I use ```ode45``` solver in MATLAB to solve the set of ordinary differential equations describing trajectories of a charged particle in a homogenous magnetic field. The differential equations are none else but Lorentz' law that have been derived manually from the Lagrangian using Euler-Lagrange equations in Cartesian coordinates. Quantities of interest such as $x, y, z, v_x, v_y, v_z$ can be plotted against time upon modifying line 13 of my code. The magnetic field is homogenous along $z$ axes but that can be modified in the functions in lines 27-35.

If we write the equation of Lorentz' law in cylindrical coordinates $(r, \phi, z)$, we derive a set of ordinary differential equations having variables $(r, \phi, z, v_r, v_{\phi}, v_z)$. I solve for these variables using ```ode45``` and upon plotting them against time (line 16 of code), get physically the same result as in using Cartesian coordinates in Lorentz' law. Note that $r$ and $\dot{\phi}$ are not independent becuase they are related by a constraint equation of centrifugal force. So we have a total of 5 independant degrees of freedom as opposed to the 6 while using Cartesian coordinates. But this is because while deriving the differential equations I have assumed the motion to be circular in using $\frac{d \hat{\phi}}{dt} = -v_{\phi} \hat{r} $. The code for this can be found [here](https://github.com/jaiisrani/fusion/blob/main/trajectories_homogenous_cylindrical.m).

The program for plotting trajectories for a magnetic bottle in Cartesian coordinates can be found [here](https://github.com/jaiisrani/fusion/blob/main/trajectories_bottle_cartesian.m). The magnetic field is given by $\vec{B} = {B_0} \big(-\frac{zx}{L^2} \hat{i} + -\frac{zy}{L^2} \hat{j} + (1 + \frac{z^2}{L^2}) \hat{k}\big)$. The equations of motion are derived using Lorentz' law. Line 13 of the program can be uncommented to plot individual quantities like $x, y, z, v_x, v_y, v_z$ (that are all independant degrees of freedom). Line 16 has the code for plotting the 3d trajectory using `plot3` function in MATLAB.

## Plotting field lines
[This](https://github.com/jaiisrani/fusion/blob/main/plotting_vector_fields.m) code is an example of plotting magnetic field lines using `quiver3` for $\vec{B} = {B_0} \big(-\frac{zx}{L^2} \hat{i} + -\frac{zy}{L^2} \hat{j} + (1 + \frac{z^2}{L^2}) \hat{k}\big)$. I have plotted the vector field at various coordinate points marked by `X`, `Y`, `Z`. For additional documentation on `quiver3` refer [here](https://ch.mathworks.com/help/matlab/ref/quiver3.html#mw_eaf91c51-2b00-4962-9837-cf547e770890).
