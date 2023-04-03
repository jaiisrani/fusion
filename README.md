# fusion

- In [this](https://github.com/jaiisrani/fusion/blob/main/trajectories_homogenous_cartesian.m) program, I use ```ode45``` solver in MATLAB to solve the set of ordinary differential equations describing trajectories of a charged particle in a homogenous magnetic field. The differential equations are none else but Lorentz' law that have been derived manually from the Lagrangian using Euler-Lagrange equations in Cartesian coordinates. Quantities of interest such as $x, y, z, v_x, v_y, v_z$ can be plotted against time upon modifying line 13 of my code. The magnetic field is homogenous along $z$ axes but that can be modified in the functions in lines 27-35.

- If we write the equation of Lorentz' law in cylindrical coordinates $(r, \phi, z)$, we derive a set of ordinary differential equations having variables $(r, \phi, z, v_r, v_{\phi}, v_z)$. I solve for these variables using ```ode45``` and upon plotting them against time (line 16 of code), get physically the same result as in using Cartesian coordinates in Lorentz' law. Note that $r$ and $\dot{\phi}$ are not independent becuase they are related by a constraint equation of centrifugal force. So we have a total of 5 independant degrees of freedom as opposed to the 6 while using Cartesian coordinates. But this is because while deriving the differential equations I have assumed the motion to be circular in using $\frac{d \hat{\phi}}{dt} = -v_{\phi} \hat{r} $. The code for this can be found [here](https://github.com/jaiisrani/fusion/blob/main/trajectories_homogenous_cylindrical.m).

- The program for plotting trajectories in Cartesian coordinates for a magnetic bottle can be found [here](https://github.com/jaiisrani/fusion/blob/main/trajectories_bottle_cartesian.m). The magnetic field is given by $\vec{B} = {B_0} \big(-\frac{zx}{L^2} \hat{i} + -\frac{zy}{L^2} \hat{j} + (1 + \frac{z^2}{L^2}) \hat{k}\big)$. The equations of motion are derived using Lorentz' law. Line 13 of the program can be uncommented to plot individual quantities like $x, y, z, v_x, v_y, v_z$ (that are all independant degrees of freedom). Line 16 has the code for plotting the 3d trajectory using `plot3` function in MATLAB.

- Upon having derived the Cartesian coordinate trajectories above, if we want to analyze plots in cylindrical coordinates we can first save the coordinate and time variables in trajectories_cartesian_bottle.mat. Then we import these variables and perform coordinate transformations from cartesian to cylindrical in [this](https://github.com/jaiisrani/fusion/blob/main/cartesian_bottle_cylindrical.m) file. Upon running the latter file and editing line 17, one can plot the evolution in cylindrical coordinates.

## Plotting field lines
- [This](https://github.com/jaiisrani/fusion/blob/main/plotting_vector_fields.m) code is an example of plotting magnetic field lines using `quiver3` for $\vec{B} = {B_0} \big(-\frac{zx}{L^2} \hat{i} + -\frac{zy}{L^2} \hat{j} + (1 + \frac{z^2}{L^2}) \hat{k}\big)$. I have plotted the vector field at various coordinate points marked by `X`, `Y`, `Z`. For additional documentation on `quiver3` refer [here](https://ch.mathworks.com/help/matlab/ref/quiver3.html#mw_eaf91c51-2b00-4962-9837-cf547e770890).
- Field lines for a homogenous magnetic field have been plotted [here](https://github.com/jaiisrani/fusion/blob/main/plotting_field_lines_homo.m) using the code from above.

## Deeper analysis of simulated trajectories
- In the code [trajectories_bottle_cartesian.m](https://github.com/jaiisrani/fusion/blob/main/trajectories_bottle_cartesian.m), we numerically solve the set of Lorentz' differential equations to obtain particle trajectories in $(x, y, z)$ coordinates. We also finally plot a 3 dimensional graph of the trajectory in Cartesian coordinates. However, no temporal analysis has been done yet. In further tasks, we use the timesteps and Cartesian coordinate trajectories derived in this piece of code, so if the trajectory needs to be re-derived upon changing parameters, then this file must be ran first, before any other files. On that note, [input_variables.m](https://github.com/jaiisrani/fusion/blob/main/input_variables.m) is the file containing variables that store values of input parameters used in all pieces of code for this section.

- Using the code [visualizing_field_and_traj_combined](https://github.com/jaiisrani/fusion/blob/main/visualizing_field_and_traj_combined.m), in the same figure I have plotted the 3 dimensional Cartesian trajectory of the particle, and, vector lines of the magnetic field.

- It is important to visualise how the particle's coordinates evolve in time. Upon running [time_trajectories_bottle_cartesian.m](https://github.com/jaiisrani/fusion/blob/main/time_trajectories_bottle_cartesian.m), four figures are outputted. In the first three figures we have plotted $x$ against $t$, $y$ against $t$, and $z$ against $t$. In Figure 4, we evolve the 3 dimensional plot in equally spaced timesteps. [time_trajectories_bottle_cylindrical.m](https://github.com/jaiisrani/fusion/blob/main/time_trajectories_bottle_cylindrical.m) does similar analyses in Cylindrical coordinates $(R, \phi, z)$. [cartesian_bottle_cylindrical](https://github.com/jaiisrani/fusion/blob/main/cartesian_bottle_cylindrical.m) must be ran before this in order to convert Cartesian trajectories to Cylindrical.

## Autoencoders
- A [single MATLAB file](https://github.com/jaiisrani/fusion/blob/main/autoencoders_practice.m) containing all the relevant code for implementing a generic autoencoder. A diagram of this autoencoder network and the training log are depicted [here](https://github.com/jaiisrani/fusion/blob/main/training%20log.png).

- Next, I train an autoencoder similar to the one above, with some values of parameters tweaked. The training dataset I use is the following, and it is coded [here](https://github.com/jaiisrani/fusion/blob/main/creating_matrix1.m): 

|       | DataPoint1 | DataPoint2 | DataPoint3 | ..... | DataPoint3000 |
| :---: |    :---:     |    :---:       |    :---:       | :---: |    :---:      | 
| $x_1$ | 1 * 1/3000^2 | 1 * 2^2/3000^2 | 1 * 3^2/3000^2 | ..... |    1          | 
| $x_2$ | 2 * 1/3000^2 | 2 * 2^2/3000^2 | 2 * 3^2/3000^2 | ..... |    2          | 
| $x_3$ | 3 * 1/3000^2 | 3 * 2^2/3000^2 | 3 * 3^2/3000^2 | ..... |    3          | 

$(x_1, x_2, x_3)$ are the three features of each datapoint. One can clearly see that for DataPoint_i, $(x_1, x_2, x_3) = (1 * i^2/3000^2, 2 * i^2/3000^2, 3 * i^2/3000^2)$. The best autoencoder I managed to train here is coded [here](https://github.com/jaiisrani/fusion/blob/main/autoencoders_playing1.m). I specifically chose to take number of points in the softmax layer to be equal to 2, because there can be 2 independent correlations in $(x_1, x_2, x_3)$. It gives around $80-90$ percent accuracy for (0.20, 0.55, 0.75).

## Autoencoders for trajectories
I move to implementing autoencoders in Python in this section, because Keras in Python provides a variety of loss functions, whereas MATLAB just allows ```msesparse```. However, I generate the training data and labels using MATLAB. I try two different methods, to verify if any of them can actually learn to predict the output conditions given the input conditions and simulation time (don't confuse with code execution time).
- First I keep a fixed simulation time (not real computer-time). 
- In this method, the training data is collected over different time intervals. The variable corresponding to simulation time is also a part of the autoencoder's input. So in total there are 7 inputs and 6 outputs.
