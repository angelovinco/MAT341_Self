function OpCount = go_Go_Gaussian_Elimination(N)

% defines matrix of dimensions NxN of random numbers between 0 and 1 
A = rand(N,N);

% duplicates matrix to hold history of previous operations
B = A;

% operation counter
OpCount = 0;

% i = row
% j = column
    
%%% THIS PART IS FOR ROW ECHELON FORM %%%

% for each row
for i = 1:N
    
    % for each element in the row
    for j = 1:N
        
        % divide each element in the row by the first entry of the row to
        % get the first entry to become 1
        
        A(i,j) = B(i,j) / B(i,i);
        
        % divided once
        OpCount = OpCount + 1;
    end
    
    % stores matrix operation histry
    B = A;
    
    % sets n to be current row #
    n = i;
    
    % while the row is not the last row
    while n < N
        
        % set n to the next row number
        n = n + 1;
        
        % for every element in the row
        for j= 1:N
            
            % takes each element inthe next row number and adds the
            % opposite of the corresponding element of the current row
            A(n,j) = B(n,j) - B(n,i) * B(i,j);
            
            % subtracted then multiplied
            OpCount = OpCount + 2;
        end
    end
    
    % stores matrix history
    B=A;
end

%%% THIS PART IS FOR ROW REDUCED ECHELON FORM %%%

% copies the dimension of the matrix to mark the last row
n = N;

% while it isn't the first row...
while n > 1
    
    % for each row that isn't the last row
    for i = 1:n-1
        
        % for each element in the row
        for j = 1:N
            
            % takes the 1 from the last row and zeros out all elements
            % above it
            A(i,j) = B(i,j) - B(i,n) * B(n,j);
            
            % subtracted and multiplied
            OpCount = OpCount + 2;
        end
    end
    
    % counts down the row # (works 'up' the matrix)
    n = n-1;
    
    % stores matrix history for the next iteration
    B = A;
end


% what i did to viusalize things

%%%%%%%%%%%%%%%%%%%%%%%%%%

% B = A;

%   A(1,1) = B(1,1) / B(1,1);
%   A(1,2) = B(1,2) / B(1,1);
%   A(1,3) = B(1,3) / B(1,1);

%   B = A;

%%%%%%%%%%%%%%%%%%%%%%%%%%

%   A(2,1) = B(2,1) - B(2,1) * B(1,1);
%   A(2,2) = B(2,2) - B(2,1) * B(1,2);
%   A(2,3) = B(2,3) - B(2,1) * B(1,3);

%   A(3,1) = B(3,1) - B(3,1) * B(1,1);
%   A(3,2) = B(3,2) - B(3,1) * B(1,2);
%   A(3,3) = B(3,3) - B(3,1) * B(1,3);

%   B = A;
%%%%%%%%%%%%%%%%%%%%%%%%

%   A(2,1) = B(2,1) / B(2,2);
%   A(2,2) = B(2,2) / B(2,2);
%   A(2,3) = B(2,3) / B(2,2);

%   B = A;
%%%%%%%%%%%%%%%%%%%%%%%%

%   A(3,1) = B(3,1) - B(3,2) * B(2,1);
%   A(3,2) = B(3,2) - B(3,2) * B(2,2);
%   A(3,3) = B(3,3) - B(3,2) * B(2,3);

%   B = A;
%%%%%%%%%%%%%%%%%%%%%%%%%%

%   A(3,1) = B(3,1) / B(3,3);
%   A(3,2) = B(3,2) / B(3,3);
%   A(3,3) = B(3,3) / B(3,3);

%   B=A;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%   A(1,1) = B(1,1) - B(1,3) * B(3,1);
%   A(1,2) = B(1,2) - B(1,3) * B(3,2);
%   A(1,3) = B(1,3) - B(1,3) * B(3,3);

%   A(2,1) = B(2,1) - B(2,3) * B(3,1);
%   A(2,2) = B(2,2) - B(2,3) * B(3,2);
%   A(2,3) = B(2,3) - B(2,3) * B(3,3);
 
%   B=A;

%%%%%%%%%%%%%%%%%%%%%%%%%%

%  A(1,1) = B(1,1) - B(1,2) * B(2,1);
%   A(1,2) = B(1,2) - B(1,2) * B(2,2);
%   A(1,3) = B(1,3) - B(1,2) * B(2,3);
   
%   B=A
