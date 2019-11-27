function fit_Sine_Series()

M = 5;

N = 500;
xData = linspace(-pi,pi,N);
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';

for i=1:N
    x = xData(i);
    y = yData(i);
    for j=1:M
        A(i,j) = sin(j*x);
    end
    B(i,:) = y;
end

beta = inv(A'*A)*A'*B;

for i = 1:N
    x=xData(i);
    f(i,1) = 0;
    j=1;
    while j <= M
        f(i,1) = f(i,1) + beta(j) * sin(j*x);
        j = j+1;
    end
end

plot(xData,f,'red','MarkerSize',4)
hold on;
plot(xData,yData,'b.','MarkerSize',6)
legend('Best Sine Series Fit','Data')
hold off;

res = B - A*beta;
    
l2_err = sqrt(res'*res);

%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%
        