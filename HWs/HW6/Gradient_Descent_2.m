function N = Gradient_Descent_2(tol)

% initializes error
err = 1;

% sets initial guess point
x0 = [1.0; 1.5];

% set initial gamma
gamma = .5;

% counter
N = 0;

% while loop
while err > tol
    
    % first iteration of gradient descent (subtracts gamma * gradient @ x0
    % from x0)
    x1 = x0 - gamma * G(x0);
    
    % calculates l2 - norm error
    err = sqrt((x1-x0).'*(x1-x0));
    
    % calculates  Barzilai-Borwein step size
    gamma = ( abs( (x1-x0).' * (G(x1) - G(x0))) / ((G(x1) - G(x0)).' * (G(x1) - G(x0)) ));
    
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
% It takes 6 iterations to achieve 1e-6 accuracy using the Barzilai-Borwein
% step size.
%
% It takes 7 iterations to achieve 1e-10 accuracy using the Barzilai-Borwein
% step size.
%
%%%%%%%%%%%%%%%%%%%%%%