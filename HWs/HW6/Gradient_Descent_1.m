function N = Gradient_Descent_1(tol,gamma)

% initializes error
err = 1;

% initial guess
x0 = [1.0; 1.5];

% counter
N = 0;

% while loop
while err > tol
    
    % first iteration of gradient descent (subtracts gamma * gradient @ x0
    % from x0)
    x1 = x0 - gamma * G(x0);
    
    % calculates l2 - norm error
    err = sqrt((x1-x0).'*(x1-x0));
    
    % sets new point as 'initial' point
    x0 = x1;
    
    % iterates counter up one
    N=N+1;
end

% calculates gradient vector
function val = G(x)

val1 = -cos(x(1));
val2 = sin(x(2));

val = [val1; val2];

%%%%%%%%%%%%%%%%%%%%%%
%
% It takes 35 iterations to achieve a 1e-10 accuracy using gamma = 0.5.
%
% It takes 12 iterations to achieve a 1e-10 accuracy using gamma = 0.9.
%
% It takes 34 iterations to achieve a 1e-10 accuracy using gamma = 1.5.
%
%%%%%%%%%%%%%%%%%%%%%%