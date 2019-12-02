function perform_NonLinear_Least_Squares()

% initalizes # of points and data points
N = 2500;
data = give_NonLinear_Least_Squares_Data(N);
xData = data(:,1);
yData = data(:,2);

% initializing beta values
B = [1 .5 .3]';

% initializes tolerance and error
tol = 1e-5;
err = 1;

% while error is greater than tolerance...
while err > tol
    
    % for each data value
    for i = 1:N
        x = xData(i);
        
        % calculates the expontent part with the beta 
        expy = exp((-(x-B(2))^2)/(2*(B(2)^2)));
        
        % calculates jacobian
        J(i,1) = expy;
        J(i,2) = B(1) * ((x-B(2))/(B(3)^2)) * expy;
        J(i,3) = B(1) * (((x-B(2))^2)/(B(3)^3)) * expy;
    end
    
    for i = 1:N
        x = xData(i);
        y = yData(i);
        
        % calculates residual
        expy = exp(-(x-B(2))^2/(2*B(3)^2));
        f(i,1) = y - B(1) *expy;
    end
    
    % calculates psuedo inverse and multiples it by residual
    pseudo_inv = inv(J'*J)*(J'*f);
    
    % adds psuedo inverse to beta value
    B1 = B + pseudo_inv;
    
    % calculates l2 norm of B1-B
    err = sqrt((B1-B)'*(B1-B));
    
    % sets new beta as 'original' beta
    B = B1;
    
end

% calculates function value with optimizied beta value
for i = 1:N
        x = xData(i);
        expy = exp(-(x-B(2))^2/(2*B(3)^2));
        f(i,1) = B(1) * expy;
end

% prints optimized beta
B

% prints l2 norm error
err

% plots data and line of best fit
plot(xData,f,'red','LineWidth',4);
legend('Data','Model Fit');
