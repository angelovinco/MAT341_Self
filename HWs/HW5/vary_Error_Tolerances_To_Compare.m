function vary_Error_Tolerances_To_Compare()

% defines the error tolerance vector
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];

% goes through every error tolerance and runs it through the three
% algorithms and then places the number of iterations in another matrix to
% be graphed and compared later
for i=1:length(errTolVec)
    goldVec(i) = golden_Search(errTolVec(i));
    paraVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
    newVec(i) = Newtons_1D_Opt(errTolVec(i));
end

% plots the three algorithms vs the error tolerances. blue is the Golden
% Search, red is the Successive Parabolic Interpolation, and black is the 
% Newton's Vector. line width is defined at 5. axes are labeled and legend
% is defined
figure(1); semilogx(errTolVec,goldVec,'blue',errTolVec,paraVec,'red',errTolVec,newVec,'black','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Golden Search','Succ. Parr. Interp.','Newton Method');

figure(2); loglog(errTolVec,goldVec,'blue',errTolVec,paraVec,'red',errTolVec,newVec,'black','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Golden Search','Succ. Parr. Interp.','Newton Method');

%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Successive Parabolic Interpolation appears to converge the fastest for 
% less accurate tolerances.
%
% When the accuracy threshold increases, Newton's Method ends up converging
% faster.
%
% The convergence rates depends on the initial values for each of these
% algorithms.
%
%%%%%%%%%%%%%%%%%%%%%%%%%