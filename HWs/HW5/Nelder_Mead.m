function N = Nelder_Mead(tol)

% initializes points
 points = [.35 2.8; -.25 .3; 1.5 .5];
% points = [.35 2.8; 1.75 .1; 1.5 .5];
% points = [.35 2.8; 4 4; 4.5 4.5];

% creates matrix of function values of each pair of points
A = [f(points(1,:)),f(points(2,:)),f(points(3,:))];

% creates a sorted matrix of function values from smallest to largest and 
% saves their original positions
[fNew,indesVec] = sort(A);

% labels each set of points as the best, middle, and worst
xBest = points(indesVec(1),:);
xMiddle = points(indesVec(2),:);
xWorst = points(indesVec(3),:);

% counter
N=1;

% while loop for when the differences between the best and worst are
% greater than the given tolerance
while (abs(f(xBest)-f(xWorst))) > tol
    
    % computes midpoint between best and worse point
   xM = .5 * (xBest + xMiddle);
   
   % computes reach vector
   xR = xM + (xM - xWorst);
   
   % transformation step
   
   if f(xR) < f(xWorst)
       % sets reach vector as the new worst value
       xWorst = xR; 
 
   elseif f(xR) > f(xWorst)
       
       % finds midpoint between midpoint and worst value
       xC = .5 * (xM + xWorst);
       if f(xC) < f(xWorst)
           
           % sets this midpoint as new worst value
           xWorst = xC;
       else
           
           % finds midpoints between best and middle and worst and best
           % points and sets the as the new middle and worst points
           % respectectively
           xMiddle = .5 * (xBest + xMiddle);
           xWorst = .5 * (xWorst + xBest);
       end
   end
   
   % creates new matrix of function values for the new points
   A = [f(xBest), f(xMiddle), f(xWorst)];
   
   % stores new points in a matrix
   B = [xBest; xMiddle; xWorst];
   
   % creates a sorted matrix of function values from smallest to largest and 
   % saves their original positions
   [fNew,indesVec] = sort(A);
   
   % labels each set of points as the best, middle, and worst
   xBest = B(indesVec(1),:);
   xMiddle = B(indesVec(2),:);
   xWorst = B(indesVec(3),:);
   
   % counter!
   N=N+1;
end

% defines function
function  val = f(x)

val = -1 * (sin(x(1)) + cos(x(2)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It takes 38 iterations to achieve a 1e-8 accruacy.
%
% For the initial point, it appears to converge towards (1.5709,-.0001).
% The true point the minima is located is at (pi/2, 0). However, this does
% not look like a 1e-8 accuracy. This is because the algorithm looks at the
% function value and how close it is to the actualy function value minimum.
% However, it does not look at the actual x,y values so see if they are at
% a 1e-8 accuracy. 
%
% After changing the initial points, it took 60 iterations to achieve a
% 1e-8 accuracy. It approached the mimium of (1.5707,.0001).
%
% After changing the initial points, it approaced the mimimum at
% (-4.7124,0.001).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
