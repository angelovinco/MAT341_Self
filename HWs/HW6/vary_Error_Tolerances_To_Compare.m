function vary_Error_Tolerances_To_Compare()

% defines the error tolerance vector
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];

for i=1:length(errTolVec)
    gd1Vec(i) = Gradient_Descent_1(errTolVec(i),1);
    gd1Vec(i) = Gradient_Descent_1(errTolVec(i),.5);
    gd2Vec(i) = Gradient_Descent_2(errTolVec(i));
end

% plots the two algorithms vs the error tolerances. blue is the Fixed Step 
% Size, and red is the Barzilai-Borwein. line width is defined at 5. 
% axes are labeled and legend is defined
figure(1); 
semilogx(errTolVec,gd1Vec,'blue',errTolVec,gd2Vec,'red','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Fixed Step','Barzilai-Borwein');

figure(2);
loglog(errTolVec,gd1Vec,'blue',errTolVec,gd2Vec,'red','LineWidth',5);
xlabel('error tolerance, tol');
ylabel('# of Iterations, N');
legend('Fixed Step','Barzilai-Borwein');

%%%%%%%%%%%%%%%%%%%%%%
%
% The fixed step size algorithm appears to converge to the minimum faster.
%
% When the fixed step size gamma is changed to .5, the Barzilai-Borwein
% step size algoritm converges faster. 
%
% The advantage of using the Barzilai-Borwein step size is that you do not
% have to look for the best step size to minimize the iterations.
%
% You would want to use the Barzilai-Borwein method since you can just pick
% a gamma instead of finding the best gamma for the step size.
%
%%%%%%%%%%%%%%%%%%%%%%
