function lcm_val = calculate_LCM(x,y)

% counter for later 
count = 1;

% if-statement to put multiples of x into an matrix by multiplying x by
% every number until y since x*y the lcm if x & y have no common factors
for i=1:y
    multiples_x(i) = x * i;
end

% if-statement to put multiples of y into an matrix by multiplying y by
% every number until x for the same reasons stated above
for j=1:x
    multiples_y(j) = y * j;
end

% series of for loops that compares every number in the matrices created
% above. if there are numbers that are the same, it puts them into a
% different matrix
for i=1:length(multiples_x)
    for j=1:length(multiples_y)
        if multiples_x(i) == multiples_y(j)
            least_com(count) = multiples_x(i);
            count = count + 1; % counter to count cells in a matrix
        end
    end
end

% takes the minimum value of the matrix that was created which had like
% multiples
lcm_val = min(least_com);