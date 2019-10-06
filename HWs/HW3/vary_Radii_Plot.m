%%%%%%%%%%%%%%%%%%%%%%%%%
%
% A radius of 0.15 would give an estimated probability of .5.
% A radius of 0.35 would give an estimated probability of .1.
% A radius of 0.45 would give an estimated probability of .01.
%
%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Radii_Plot()

% given vector of r values to test
rVec = [0.01:0.005:0.10 0.1:0.01:0.5];

% runs each radius value through estimate_Coin_In_Square_Probability
for i=1:length(rVec)
    prob(i) = estimate_Coin_In_Square_Probability(rVec(i),1e5);
end

% plots the radius values and corresponding probabilities with each point
% being a star
plot(rVec,prob,'r*');
xlabel('Radius');
ylabel('Probabilities for a Particular Radius');
