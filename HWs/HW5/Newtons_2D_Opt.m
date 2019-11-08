function N = Newtons_2D_Opt(tol)

% intializes points
% xN = [-.25;.25];
xN = [-4.5;4.5];

% first iteration of Newton's Method with first and second derivative
xM = xN - H(xN(1),xN(2)) * G(xN(1),xN(2));

% calculates error
err = sqrt((xM-xN)'*(xM-xN));

% sets new point as 'original' point
xN = xM;

% counter
N = 1;

% while loop
while err > tol
    
    % Newton;s Method
    xM = xN - H(xN(1),xN(2)) * G(xN(1),xN(2));
    
    % calculates error
    err = sqrt((xM-xN).'*(xM-xN));
    
    % sets new point as 'original' point
    xN = xM;
    
    % counts up for each iteration
    N = N + 1;
end

% Calculates gradient of original function
function val = G(x,y)

val1 = -cos(x);
val2 = sin(y);

val = [val1; val2];

% Calculates Hessian of original function and then inverse of function
function val = H(x,y)

val1 = sin(x);
val2 = 0;
val3 = 0;
val4 = cos(y);

val = inv([val1, val2; val3, val4]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It took 5 iterations to find the minima with this initial guess.
% It found a minima at (-4.7124,0).
%
% It took 4 iterations to find the minima with the new guess.
% It found a minima at (-4.7124,0).
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%