% Define symbolic variables for the components of the unknown forces
syms F1z F2z F3z F4z real;

% Total load vector (in Newtons)
total_load = [100, 50, 30];

% Define positions of forces relative to the point (in meters)
position1 = [1, 0, 0];
position2 = [0, 2, 0];
position3 = [-3, 1, 0];
position4 = [2, -1, 0];

% Define the objective function (to be minimized)
objective = @(x) norm(cross(position1, [0, 0, x(1)])) + norm(cross(position2, [0, 0, x(2)])) + ...
                norm(cross(position3, [0, 0, x(3)])) + norm(cross(position4, [0, 0, x(4)]));

% Define the nonlinear constraint function
nonlcon = @(x) [x(1) + x(2) + x(3) + x(4) - total_load(3);
                norm([0, 0, x(1)]) - eps;
                norm([0, 0, x(2)]) - eps;
                norm([0, 0, x(3)]) - eps;
                norm([0, 0, x(4)]) - eps];

% Initial guess for the forces
x0 = [1, 1, 1, 1];

% Minimize the objective function subject to the constraints
options = optimoptions('fmincon', 'Display', 'iter');
x = fmincon(objective, x0, [], [], [], [], [], [], nonlcon, options);

% Display the results
disp(['Force 1: [0, 0, ', num2str(x(1)), ']']);
disp(['Force 2: [0, 0, ', num2str(x(2)), ']']);
disp(['Force 3: [0, 0, ', num2str(x(3)), ']']);
disp(['Force 4: [0, 0, ', num2str(x(4)), ']']);












