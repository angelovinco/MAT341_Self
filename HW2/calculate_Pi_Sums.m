function calculate_Pi_Sums()

% sets inital sums for a and b

a = 0;
b = 0; 

% sets tolerance that will be checked

tol = 1e-6;

% sets initial errors for a and b that will decrease with each term

% i made them separate to distinguish the differences between how
% 'efficient' each series will be 

aErr = 1;
bErr = 1;

% sets initial value for N for each a and b so that each can counted
% seperately

aN = -1;
bN = -1;

% while loop to calculate a-series
% it prints out every term in the series

while aErr > tol
    
    % counts up a
    aN = aN + 1; 
    
    % a series
    a = a + ((6/sqrt(3)) * ((-1)^aN) / ((3^aN)*(2*aN+1)))
    
    % calculates absolute value of the error between the a-sum and pi 
    aErr = abs(a-pi); 
end

% while loop to calculate b-series
% it prints out every term in the series

while bErr > tol
    
    % counts up b 
    bN = bN + 1;
    
    % b series
    b = b + ((16 * ((-1)^bN) / ((5^(2*bN+1)) * (2*bN+1))) - (4 * ((-1)^bN) / ((239^(2*bN+1)) * (2*bN+1)))) 
    
    % calculates absolute value of the error between the b-sum and pi
    bErr = abs(b-pi); 
end



