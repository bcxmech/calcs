syms F1x F1y F1z F2x F2y F2z F3x F3y F3z F4x F4y F4z real; % Define symbolic variables for the components of the unknown forces
total_load = [100, 50, 30]; % Total load vector (in Newtons)

% Define positions of forces relative to the point (in meters)
position1 = [1, 0, 0];
position2 = [0, 2, 0];
position3 = [-3, 1, 0];
position4 = [2, -1, 0];

% Calculate moments for each force
moment1 = cross(position1, [F1x, F1y, F1z]);
moment2 = cross(position2, [F2x, F2y, F2z]);
moment3 = cross(position3, [F3x, F3y, F3z]);
moment4 = cross(position4, [F4x, F4y, F4z]);

% Set up equilibrium equations (moment equals total moment)
eq1 = moment1(3) + moment2(3) + moment3(3) + moment4(3) == 0; % Equilibrium about z-axis
eq2 = moment1(1) + moment2(1) + moment3(1) + moment4(1) == 0; % Equilibrium about x-axis
eq3 = moment1(2) + moment2(2) + moment3(2) + moment4(2) == 0; % Equilibrium about y-axis
eq4 = F1x + F2x + F3x + F4x == total_load(1); % Total load equilibrium in x-direction
eq5 = F1y + F2y + F3y + F4y == total_load(2); % Total load equilibrium in y-direction
eq6 = F1z + F2z + F3z + F4z == total_load(3); % Total load equilibrium in z-direction

% Solve equations to find unknown forces
[sol_F1x, sol_F1y, sol_F1z, sol_F2x, sol_F2y, sol_F2z, sol_F3x, sol_F3y, sol_F3z, sol_F4x, sol_F4y, sol_F4z] = ...
    solve([eq1, eq2, eq3, eq4, eq5, eq6], [F1x, F1y, F1z, F2x, F2y, F2z, F3x, F3y, F3z, F4x, F4y, F4z]);

% Display results
disp(['Force 1: [', char(sol_F1x), ', ', char(sol_F1y), ', ', char(sol_F1z), ']']);
disp(['Force 2: [', char(sol_F2x), ', ', char(sol_F2y), ', ', char(sol_F2z), ']']);
disp(['Force 3: [', char(sol_F3x), ', ', char(sol_F3y), ', ', char(sol_F3z), ']']);
disp(['Force 4: [', char(sol_F4x), ', ', char(sol_F4y), ', ', char(sol_F4z), ']']);