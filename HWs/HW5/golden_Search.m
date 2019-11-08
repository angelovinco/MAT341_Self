function N = golden_Search(tol)

% defines golden ratio
T = (sqrt(5)-1)/2;

% initializes the interval
a = 0;
b = 2;

% defines left and right bounds 
x1 = a + (1-T)*(b-a);
x2 = a + T*(b-a);

% evaulates the function at the two new x values
f1 = f(x1);
f2 = f(x2);

% initiazes the counter at 1 since the code above is the first iteration
N=1;

% while loop that will be exited once the difference between the two end
% points are too small
while (b-a) > tol
    
    % tests which y value of the two x values are larger or smaller
    if f1 > f2
        
        % sets the lower interval bound as the smaller x value, while leaving
        % the upper bound the same
        a = x1;
        
        % redefines left x value 
        x1 = x2;
        
        % redefines right x value
        x2 = a + T*(b-a);
        
        % redefines f1 and f2 values
        f1 = f2;
        f2 = f(x2);
        
    % if the f1 is equal or less than f2 then it will enter this if
    % statement
    else
        
        % sets the upper interval bound as the larger x value, while
        % leaving the lower bound the same
        b = x2;
        
        % redefines left and right x values
        x2 = x1;
        x1 = a + (1-T)*(b-a);
        
        % redefines f1 and f2 values
        f2 = f1;
        f1 = f(x1);
    end
    
    % iterates the counter up by 1 each run through the while loop
    N=N+1;
end


% defines function which we will be looking for a minimum
function val = f(x)

val = 0.5 - x*exp(-(x^2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% It takes 41 iterations to achieve a 1e-8 accuracy.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
