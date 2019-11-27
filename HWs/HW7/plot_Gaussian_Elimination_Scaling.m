function plot_Gaussian_Elimination_Scaling()

% given N vector
NVec = 2:1:100;

% runs each value in NVec through the Gaussian Elimination algorithm then
% holds the number of operations in another vector
for i = 1:length(NVec)
    GaussVec(i) = go_Go_Gaussian_Elimination(NVec(i));
end

% graphs matrix sizes and operation counts on a loglog plot with color and
% line width defined and axes labeled
figure(1); loglog(NVec,GaussVec,'b','LineWidth',5)
xlabel('Size of Matrix, N');
ylabel('Operation Count');

% graphs matrix sizes and operation counts on a regular plot with color and
% line width defined and axes labeled
figure(2); plot(NVec,GaussVec,'b','LineWidth',5)
xlabel('Size of Matrix, N');
ylabel('Operation Count');

%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% As the size of the matrix increase, the number of operations required to
% compute the corresponding reduced row echelon form appears quadratic.
% That is because for each extra N, there is an extra row and column to do
% operations to. Therefore the number of operations grow at a quadratic
% rate with even more terms being added to matrix each time. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%