function val = square_Root_Sequence(m,n)

val=sqrt(m); % evaluates initial square root of the value

% we are basically working from right to left


% this if-then statement identifies whether, from right to left what will 
% be the first sign of the sequence
% for even number of terms, it will be - and for odd, it will be +

if mod(n,2)==0
    minus = -1;
else
    minus = 1;
end

% this is the actual calculation for the term of the sequence
% it takes the first sqrt value, multiples it by a - or + depending on the
% number of terms in the sequence then multiplies it by a alternator that
% makes the sign after the square root +/- depending on what it was
% previously

for i = 2:n
    val = sqrt( m + ((-1)^(i)) * minus * val );
end


%%% Answers
% square_Root_Sequence(13,1000) = 3
% square_Root_Squence(31,1000) = 5
% square_Root_Squence(43,1000) = 6