%%%%%%%%%%%%%%%%%%%%%
%
% N = 1e3: .63
% N = 1e4: .638
% N = 1e6: .635
% N = 1e7: .6399
%
% N = 1e5: .6403
%
% N = 1e5 does not seem like a reasonable amount of trials since the
% probability keeps flucating from a large range of values. more trials
% would create a more accurate result.
%
% This problem is more difficult than previous problems since we are
% considering a 2-D shape instead of one singular point. Even though a
% square is defined, there is a smaller range where the coin can land in
% without touching the edges.
%
%%%%%%%%%%%%%%%%%%%%%%


function prob = estimate_Coin_In_Square_Probability(r,N)

% intializes counter to see how many times coin lands in the square
in_Square = 0;

% if loop that tosses coin and counts times the coin lands in the circle
for i=1:N
    
    % tosses coin - see function below
    val = toss_Coin();
    
    % if statement to check if x and y values of the coin are in the bounds
    % of the square. we only use less than & greater than signs since we do 
    % not want the coin to touch the edges of the square. if the
    % coordinates where less than r away from any of the edges, part of the
    % coin will be outside the square
    if val(1) > r && val(1) < 1-r && val(2) > r && val(2) < 1-r
        in_Square = in_Square + 1; % counts when coin is in bound
    end
end

% divides the amount of times the coin lands in the square by the amount of
% times the coin is flipped to find the probability
prob = in_Square/N;

% function to toss a coin
function distance = toss_Coin()

% picks random cooridinates for the center of the coin to land between 0
% and 1 for each x and y
x = rand();
y = rand();

% calculates the distance from the center of the coin to the x and y axes
% and puts into a matrix to be pulled from in the main function
distance(1) = 1 - x;
distance(2) = 1 - y;