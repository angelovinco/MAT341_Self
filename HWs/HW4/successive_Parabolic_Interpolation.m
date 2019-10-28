function N = successive_Parabolic_Interpolation(tol)

% sets initial points
x1 = 0;
x2 = .6;
% x3 = .9;
% x3 = 2;
x3 = 1.2;

% initializes counter
N = 0;

% calculates error between the largest and the smallest points. it takes
% the absolute value just in case the largest and smallest values are
% flipped
err = abs(x3-x1);

% runs the while loop while the difference between the two points are
% greater than the tolerance
while err > tol
    
    % we are trying to find a parabola between all 3 of the given points.
    % to do so we need to create a matrix with quadratic equations that
    % correspond to each x value
    A=[x1^2 x1 1 f(x1);x2^2 x2 1 f(x2);x3^2 x3 1 f(x3)];
    
    % we row reduce the matrix to find the coefficients of the parabola
    B=rref(A);
    
    % uses the vertex formula to find the minimum of the created parabola
    xMin = -B(2,4)/(2*B(1,4));
    
    % throws away the smallest point and replaces it with the minimum
    x3 = x2;
    x2 = x1;
    x1 = xMin;
    
    % recalculates error
    err = abs(x3-x1);
    
    % counts up iteration
    N = N+1;
end

% defines function
function val = f(x)

val = 0.5 - x*exp(-(x^2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It takes 7 iterations to reach a 1e-8 accuracy with the initial guesses.
%
% It takes 186 iterations to reach a 1e-8 accuracy with x3 changed. No
% warnings are issued.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%