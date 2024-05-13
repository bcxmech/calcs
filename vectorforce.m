% Define the objective function (simple, could be zero as we focus on feasibility)
objective = @(F) sum(F.^2);  % Quadratic objective to promote smaller force values

% Initial guesses for the forces
F0 = ones(12,1);  % Initial guess (all forces start positive)

% Define the non-linear constraints (equilibrium equations)
nonlcon = @(F) deal([...
    F(1) + F(4) + F(7) + F(10),    % eq1: Sum of Fx components
    F(2) + F(5) + F(8) + F(11),    % eq2: Sum of Fy components
    F(3) + F(6) + F(9) + F(12) - 1500,  % eq3: Sum of Fz components - 1500 (force balance)
    dot([1, 0, 0], cross([1,0,0], F(1:3))) + dot([0, 1, 0], cross([1,0,0], F(4:6))) + ...
    dot([-1, 0, 0], cross([1,0,0], F(7:9))) + dot([0, -1, 0], cross([1,0,0], F(10:12))),  % eq4: Moment about x-axis
    dot([1, 0, 0], cross([0,1,0], F(1:3))) + dot([0, 1, 0], cross([0,1,0], F(4:6))) + ...
    dot([-1, 0, 0], cross([0,1,0], F(7:9))) + dot([0, -1, 0], cross([0,1,0], F(10:12))),  % eq5: Moment about y-axis
    dot([1, 0, 0], cross([0,0,1], F(1:3))) + dot([0, 1, 0], cross([0,0,1], F(4:6))) + ...
    dot([-1, 0, 0], cross([0,0,1], F(7:9))) + dot([0, -1, 0], cross([0,0,1], F(10:12)))  % eq6: Moment about z-axis
], []);

% Set lower and upper bounds for the force components
lb = zeros(12,1);  % Lower bounds (force components must be positive)
ub = [];           % Upper bounds (no upper bounds)

% Options for fmincon
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');

% Solve using fmincon
[F_opt, fval, exitflag, output] = fmincon(objective, F0, [], [], [], [], lb, ub, nonlcon, options);

% Display the optimized forces
disp('Optimized forces:');
disp(F_opt);
