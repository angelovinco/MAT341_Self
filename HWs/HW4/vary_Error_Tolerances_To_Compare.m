function vary_Error_Tolerances_To_Compare()

% defines the error tolerance vector
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];

% goes through every error tolerance and runs it through both the
% algorithms and then places the number of iterations in another matrix to
% be graphed and compared later
for i=1:length(errTolVec)
    goldVec(i) = golden_Search(errTolVec(i));
    paraVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

% plots the two algorithms vs the error tolerances. blue is the Golden
% Search and red is the Successive Parabolic Interpolation. line width is
% defined at 5. axes are labeled and 
figure(1); semilogx(errTolVec,goldVec,'blue',errTolVec,paraVec,'red','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Golden Search','Succ. Parr. Interp.');

figure(2); loglog(errTolVec,goldVec,'blue',errTolVec,paraVec,'red','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Golden Search','Succ. Parr. Interp.');

%%%%%%%%%%%%%%%%%%%%%%%%%
%
% a) he Successive Parabolic Interpolation Algorithm converges faster to the
% minimum when we are looking for less accurate tolarances.
%
% b) As the accuracy threshold gets smaller and the minimum is more accurate,
% the Golden Search Algorithm converges faster, rather than the SPI
% Algorithm which converges faster when looking for less accuracy. 
% The SPI Algorithm changed speeds because when a higher accuracy is needed
% the 3 points will be very close together, meaning the parabola would have
% to get closer and closer to a more specific shape to contain the minimum,
% rather than have the x value of the minimum being searched for in a
% specific range. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%