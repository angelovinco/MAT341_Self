function fit_Sine_Series()

% initalizes M
% M = 5;
% M = 10;
% M = 20;
 M = 40;

% initalizes # of points and data points
N = 500;
xData = linspace(-pi,pi,N);
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';

% takes each x value and puts it into a matrix where each row in the matrix
% takes the x and multiples it by j and takes the sin of the value
% for each columnn entry
for i=1:N
    x = xData(i);
    y = yData(i);
    for j=1:M
        A(i,j) = sin(j*x);
    end
    
    % takes each y value and makes a column matrix where each row
    % corresponds to a x value
    B(i,:) = y;
end

% calculates the psuedo inverse and multiples by the matrix of y values
beta = inv(A'*A)*A'*B;

for i = 1:N
    x=xData(i);
    
    % initializes summation matrix
    f(i,1) = 0;
    
    %initializes counter
    j=1;
    
    % takes each sin of xj and multiplies it by the corresponding beta
    % values and adds them all together
    while j <= M
        f(i,1) = f(i,1) + beta(j) * sin(j*x);
        j = j+1;
    end
end

% plots data points and the line of best fit
plot(xData,yData,'b-','LineWidth',6)
hold on;
plot(xData,f,'r-','LineWidth',4)
xlabel('x');
ylabel('y');
legend('Data','Best Sine Series Fit')
hold off;

% prints beta coefficients
beta

% calculates residual
res = B - A*beta;
    
% calculates l2 norm of the residual and prints it
l2_err = sqrt(res'*res)

%%%%%%%%%%%%%%%%%%%%%%%%%
%
% l2 norm error for the residual for:
% M=5: 0.0813
% M=10: 0.0096
% M=20: 2.1412e-6
% M=40: 3.9199e-9
%
% Fourier sine series
%
%%%%%%%%%%%%%%%%%%%%%%%%%
        