function fit_Polynomial_Series()

% initializes # of points and data points
%N = 10;
%N = 50;
N = 250;
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
plot(xData,yData,'b-','LineWidth',6)
hold on
plot(xData,f,'r-','LineWidth',4)
legend('Data','Best Polyfit')
xlabel('x');
ylabel('y');
hold off;

% prints beta coefficients
beta

% calculates residual
res = B - A*beta;
    
% calculates l2 norm of residual and prints it
l2_err = sqrt(res'*res)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% l2 norm error of the residual for:
% N=10: 2.7347
% N=50: 5.15e-4
% N=250: .0011
%
% We have seen cosx written as a polynomial as a Taylor Series
% The coeffients are 1, 0, -1/2!, 0, 1/4!, 0, -1/6!, 0, 1/8!, 0, -1/10!
% 0, 1/12!
%
% .9999, 0.00, -.4998, -0.00, .0416, 0.00, -0.0014, -0.00, 0.00, 0.00,
% -0.00, -0.00, 0.00
% 
% yes, they are about the same coefficents
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        