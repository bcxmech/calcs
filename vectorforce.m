% Define the coordinates of the points as vectors
p1 = [x1, y1];  % Replace x1, y1 with actual values
p2 = [x2, y2];  % Replace x2, y2 with actual values
p3 = [x3, y3];  % Replace x3, y3 with actual values
p4 = [x4, y4];  % Replace x4, y4 with actual values

% Define symbolic variables for forces
syms F1 F2 F3 F4 real

% Equations
eq1 = F1 + F2 + F3 + F4 == 1500;  % Sum of vertical forces
eq2 = p1(2)*F1 + p2(2)*F2 + p3(2)*F3 + p4(2)*F4 == 0;  % Moments about x-axis
eq3 = p1(1)*F1 + p2(1)*F2 + p3(1)*F3 + p4(1)*F4 == 0;  % Moments about y-axis

% Solve symbolically, if feasible
solution = solve([eq1, eq2, eq3], [F1, F2, F3, F4]);
disp('Symbolic solution for Forces at each point:');
disp([solution.F1, solution.F2, solution.F3, solution.F4]);

% Define the function for numerical solving if necessary
fun = @(F) [sum(F) - 1500; 
            p1(2)*F(1) + p2(2)*F(2) + p3(2)*F(3) + p4(2)*F(4);
            p1(1)*F(1) + p2(1)*F(2) + p3(1)*F(3) + p4(1)*F(4)];
            
% Initial guess for the forces
F_initial = [375; 375; 375; 375];  % Initial guess for the forces

% Options for fsolve
options = optimoptions('fsolve', 'Display', 'iter', 'Algorithm', 'levenberg-marquardt');

% Solve numerically
F_solution = fsolve(fun, F_initial, options);

% Display the numerical solution
disp('Numerical solution for Forces at each point:');
disp(F_solution);