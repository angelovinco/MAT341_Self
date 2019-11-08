function N = Newtons_1D_Opt(tol)

% initializes points
xN = .25;
%xN = 1.5;

% first iteration of Newton's Method w/ first and second derivative
xM = xN - (f1(xN)/f2(xN)); 

% calculates error
err = abs(xM - xN);

% sets new point as 'original' point
xN = xM;

% counter
N = 1;

% while loop
while err > tol
    
    % counts up for each iteration
    N=N+1;
    
    % Newton's Method
    xM = xN - (f1(xN)/f2(xN)); 
    
    % recalculates error
    err = abs(xM - xN);
    
    % sets new point as 'original' point
    xN = xM;
end

% calculates first derivative
function val = f1(x)

val = exp(-(x^2))*(2*(x^2)-1);

% calculates second derivative
function val = f2(x)

val = 2*x*exp(-(x^2))*(-2*(x^2)+3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It takes 7 iterations to achieve a 1e-8 accuracy with the initial guesses
%
% It takes 737 iterations to achieve a 1e-8 accuracy with the guess of
% 1.5. Wow!
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%