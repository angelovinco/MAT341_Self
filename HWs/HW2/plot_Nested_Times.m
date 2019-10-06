function plot_Nested_Times()

% this sets the matrix of all the values we will be testing

N = [1:1:10 20:10:100 125 150 175 200 225 250];

% this for-loop takes the time it takes to for the nested for-loop to run
% for each value in the matrix and places it in another matrix time so it
% can be plotted against N

% i had to go from 1 to length(N) since in the first 2 entries of N, there
% are incremented values as well. it is easier than counting each
% individual number

for i = 1:length(N)
    time(i) = calculate_Nested_For_Loop_Time(N(i));
end

% this graphs the plot as a log log plot with N as the x axis and time as
% the y. the line is magenta with a 3px width
loglog(N,time,'magenta','LineWidth',3)

% these are the axis labelers
xlabel('N')
ylabel('time')