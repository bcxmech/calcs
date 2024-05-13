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

% Display results if none of the force vectors are zero
if norm([sol_F1x, sol_F1y, sol_F1z]) ~= 0 && norm([sol_F2x, sol_F2y, sol_F2z]) ~= 0 && norm([sol_F3x, sol_F3y, sol_F3z]) ~= 0 && norm([sol_F4x, sol_F4y, sol_F4z]) ~= 0
    disp(['Force 1: [', num2str(double(sol_F1x)), ', ', num2str(double(sol_F1y)), ', ', num2str(double(sol_F1z)), ']']);
    disp(['Force 2: [', num2str(double(sol_F2x)), ', ', num2str(double(sol_F2y)), ', ', num2str(double(sol_F2z)), ']']);
    disp(['Force 3: [', num2str(double(sol_F3x)), ', ', num2str(double(sol_F3y)), ', ', num2str(double(sol_F3z)), ']']);
    disp(['Force 4: [', num2str(double(sol_F4x)), ', ', num2str(double(sol_F4y)), ', ', num2str(double(sol_F4z)), ']']);
else
    disp('One or more force vectors have a norm of 0. Solution is not unique.');
end




