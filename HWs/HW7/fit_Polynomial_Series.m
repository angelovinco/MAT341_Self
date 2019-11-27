function fit_Polynomial_Series()

%N = 10;
%N = 50;
N = 250;
xData = linspace(-2*pi,2*pi,N);
yData = cos(xData)';


for i = 1:N
    x = xData(i);
    y = yData(i);
    for j=1:13
        A(i,j) = x^(j-1);
    end
    B(i,:) = y;
end
    
beta = inv(A'*A)*A'*B;
    
for i = 1:N
    
    x = xData(i);
    
    f(i,1) = 0;
    j=1;
    
    while j < 14
        f(i,1) = f(i,1) + beta(j) * x^(j-1);
        j = j+1;
    end
end

plot(xData,f,'red','MarkerSize',4)
hold on;
plot(xData,yData,'b.','MarkerSize',6)
legend('Best Poly Fit','Data')
hold off;

res = B - A*beta;
    
l2_err = sqrt(res'*res);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% As N increases, the residual gets smaller. Are you asking for residual or
% l2 norm.
%
% Calc B? Taylor Series? Beta?
%
% I dont know
% 
% Maybe
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        