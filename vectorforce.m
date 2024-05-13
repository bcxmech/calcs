% Define symbolic variables for forces at each point
syms F1x F1y F1z F2x F2y F2z F3x F3y F3z F4x F4y F4z

% Coordinates of the points (Assuming arbitrary values, modify as per your system)
% For example, p1 at (1,0,0), p2 at (0,1,0), p3 at (-1,0,0), p4 at (0,-1,0)
p1 = [1, 0, 0];
p2 = [0, 1, 0];
p3 = [-1, 0, 0];
p4 = [0, -1, 0];

% Equilibrium equations for forces
eq1 = F1x + F2x + F3x + F4x == 0;
eq2 = F1y + F2y + F3y + F4y == 0;
eq3 = F1z + F2z + F3z + F4z == 1500;

% Equilibrium equations for moments about origin (0,0,0)
eq4 = dot(p1, cross([1,0,0], [F1x,F1y,F1z])) + dot(p2, cross([1,0,0], [F2x,F2y,F2z])) + ...
      dot(p3, cross([1,0,0], [F3x,F3y,F3z])) + dot(p4, cross([1,0,0], [F4x,F4y,F4z])) == 0;
eq5 = dot(p1, cross([0,1,0], [F1x,F1y,F1z])) + dot(p2, cross([0,1,0], [F2x,F2y,F2z])) + ...
      dot(p3, cross([0,1,0], [F3x,F3y,F3z])) + dot(p4, cross([0,1,0], [F4x,F4y,F4z])) == 0;
eq6 = dot(p1, cross([0,0,1], [F1x,F1y,F1z])) + dot(p2, cross([0,0,1], [F2x,F2y,F2z])) + ...
      dot(p3, cross([0,0,1], [F3x,F3y,F3z])) + dot(p4, cross([0,0,1], [F4x,F4y,F4z])) == 0;

% Solve the system of equations
sol = solve([eq1, eq2, eq3, eq4, eq5, eq6], [F1x, F1y, F1z, F2x, F2y, F2z, F3x, F3y, F3z, F4x, F4y, F4z]);

% Display the solution
disp(sol);



