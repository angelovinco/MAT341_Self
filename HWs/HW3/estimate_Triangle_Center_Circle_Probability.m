%%%%%%%%%%%%%%%%%
%
% The probabily comes out to be around .75
%
%%%%%%%%%%%%%%%%%%


function prob = estimate_Triangle_Center_Circle_Probability(N)

% initializes value that will check how many times the origin will be in
% the triangle
in_Triangle = 0;

% for loop that will pick points and check for the origin N times
for i=1:N
    
    % calls function to pick 3 points for a triangle
    val = pick_Three_Points();
    
    % if then statement to check if the middle angle value is in the
    % correct position to have the origin be in the triangle. the middle
    % point has to be between the diagonals created by the biggest and
    % smallest values. this is where the values being polar coordinates
    % come in handy since we can easily add values to them. we added pi 
    % (180 degrees) to the smallest value and subtracted pi from the
    % largest value to create an interval where the third point must be in
    if val(2) > (val(1) - pi) && val(2) < (val(3) + pi)
        
        % counts every time that a triangle created contains the origin
        in_Triangle = in_Triangle + 1;
    end
end

% divides the amount of triangles that work by the amount of triangles
% created to find the probabilty
prob = in_Triangle/N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function to pick three points
function points = pick_Three_Points 

% for loop to pick 3 theta values. here we are working in polar
% coordinates so there is no need to plug numbers into a formula. we only
% care about what the angles created by points (theta values) so we can
% compare where they end up in the cirlce
for i=1:3
    
    % select random angle values on the circle by multiplying a random 
    % number between 0-1 by 2pi
    theta(i) = 2 * pi * rand();
end

% for loop to put angle values in order from largest to smallest to make it
% easier to distinguish between them later. just because the numbers are
% random, it does not mean they will be picked in order. this puts them in
% order.
for i=1:length(theta)
    
    % takes each theta value, checks if its the min max or neither and
    % orders them in a new matrix accordingly
    if theta(i) == max(theta)
        p(1) = theta(i);
    elseif theta(i) == min(theta)
        p(3) = theta(i);
    else
        p(2) = theta(i);
    end
end

% returns the matrix with the angles in order
points = p;
