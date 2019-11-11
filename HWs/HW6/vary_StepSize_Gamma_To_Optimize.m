function vary_StepSize_Gamma_To_Optimize()

% creates a vector different gamma values between .5 and .9 incrementing by
% 0.02 each time
gamVec = [0.5:0.02:1.5];

% creates a vector of the number of iterations it takes to run through the
% gradient decent method at tolerance of 1e-10 for each gamma value
for i=1:length(gamVec)
    gdVec(i) = Gradient_Descent_1(1e-10,gamVec(i));
end

% creates a plot with gamma as the x and iterations as the y, with a line
% width at 5 and blue and with axes labeled and a legend
semilogx(gamVec,gdVec,'blue','LineWidth',5);
xlabel('gamma (step-size)');
ylabel('# of Iterations, N');
legend('Fixed Step');

%%%%%%%%%%%%%%%%%%%%%%
%
% The 'best' step-size for this function seems to be gamma = 1.
%
%%%%%%%%%%%%%%%%%%%%%%