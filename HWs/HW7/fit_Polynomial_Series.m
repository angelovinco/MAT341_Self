function fit_Polynomial_Series()


% initializes # of points and data points
%N = 10;
N = 50;
%N = 250;
xData = linspace(-2*pi,2*pi,N);
yData = cos(xData)';

% takes each x value and puts it into a matrix where each row in the matrix
% takes the x and puts it to a power j for each column entry
for i = 1:N
    x = xData(i);
    y = yData(i);
    for j=1:13
        A(i,j) = x^(j-1);
    end
  
    % takes each y value and makes a column matrix where each row
    % corresponds to a x value
    B(i,:) = y;
end
   
% calculates the psuedo inverse and multiples by the matrix of y values
beta = inv(A'*A)*A'*B;
    
for i = 1:N
    x = xData(i);
    
    % initializes summation matrix
    f(i,1) = 0;
    
    %initializes counter
    j=1;
    
    % takes each power of x and multiplies it by the corresponding beta
    % values and adds them all together
    while j < 14
        f(i,1) = f(i,1) + beta(j) * x^(j-1);
        j = j+1;
    end
end

% plots the data and the line of best fit
plot(xData,f,'red','MarkerSize',4)
hold on;
plot(xData,yData,'b.','MarkerSize',6)
legend('Best Poly Fit','Data')
hold off;

% calculates residual
res = B - A*beta;
    
% calculates l2 norm of residual and prints it
l2_err = sqrt(res'*res)

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
        