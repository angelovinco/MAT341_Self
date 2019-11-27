function perform_NonLinear_Least_Squares()

N = 2500;
data = give_NonLinear_Least_Squares_Data(N);

xData = data(:,1);
yData = data(:,2);

B = [1 .5 .3]';

tol = 1e-5;
err = 1;

while err > tol
    
    for i = 1:N
        x = xData(i);
        expy = exp((-(x-B(2))^2)/(2*(B(2)^2)));
        
        J(i,1) = expy;
        J(i,2) = B(1) * ((x-B(2))/(B(3)^2)) * expy;
        J(i,3) = B(1) * (((x-B(2))^2)/(B(3)^3)) * expy;
    end
    
    for i = 1:N
        x = xData(i);
        y = yData(i);
        
        expy = exp(-(x-B(2))^2/(2*B(3)^2));
        f(i,1) = y - B(1) *expy;
    end
    
    pseudo_inv = inv(J'*J)*(J'*f);
    
    B1 = B + pseudo_inv;
    
    
    err = sqrt((B1-B)'*(B1-B));
    
    B = B1;
    
end

for i = 1:N
        x = xData(i);
        expy = exp(-(x-B(2))^2/(2*B(3)^2));
        f(i,1) = B(1) * expy;
end

B
err

plot(xData,f,'red','LineWidth',4);
legend('Data','Model Fit');
