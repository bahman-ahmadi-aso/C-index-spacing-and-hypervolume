
% Pareto quality indices developed by
% Bahman Ahmadi , University of Twente, b.ahmadi@utwente.nl
% ------------------------------------------------------------------------

function C_index12=C_ind(PS1,PS2)
% This line defines a function called "C_ind" that takes in two input arguments,
% "PS1" and "PS2", which are matrices representing sets of points in a multi-dimensional space. 
% The output of the function is a scalar value called "C_index12", which represents the 
% the domination index of set PS1 by set PS2.

c=zeros(size(PS1,1),1); 
for z=1:size(PS1,1) 
    for t=1:size(PS2,1) 
        if Dominates(PS2(t,:),PS1(z,:)) % This line calls the "Dominates" function to check 
        % if the t-th row of matrix PS2 (Pareto) dominates the z-th Pareto of matrix PS1. If it does,
        % the corresponding element in vector "c" is set to 1.
            c(z,1)=1; 
        end

    end

end

C_index12=sum(c)/size(PS1,1); % This line calculates the C index "C_index12" by 
% summing up all non-zero elements in "c" and dividing by the total number of rows in matrix PS1.

end 
