% Pareto quality indices developed by
% Bahman Ahmadi , University of Twente, b.ahmadi@utwente.nl
% ------------------------------------------------------------------------

function S=metric_of_spacing(PS)
% "PS", which is a matrix representing a set of Pareto solutions in a multi-dimensional space. The output 
% of the function is a scalar value called "S", which represents the metric of spacing of the 
% set of points.

npf=size(PS,1); 
for i=1:npf 
    D1=repmat(PS(i,:),npf,1); % This line creates a matrix called "D1" by replicating the i-th
    % row of matrix PS npf times. Each row of matrix D1 represents the same point as the i-th
    % row of PS.

    D2=D1-PS; % This line creates a matrix called "D2" by subtracting each row of PS from
    % the corresponding row of D1. Each row of matrix D2 represents the vector from the i-th 
    % point to another point in the set.

    for j=1:npf % This line starts a nested loop that goes through each point in the set.

        D3(j)=sum(abs(D2(j,:))); % This line computes the Manhattan distance between the 
        % j-th point and the i-th point and stores the result in the j-th element of vector D3.

    end

    D3(i)=[]; % This line removes the i-th element from vector D3 because it corresponds to the
    % distance between the i-th point and itself, which is not used in the calculation.

    Distance(i)=min(D3); % This line computes the minimum distance from the i-th point to its
    % closest neighbor in the set and stores the result in the i-th element of vector Distance.

end

d_average=(1/npf)*sum(Distance); % This line computes the average distance between each point and its 
% closest neighbor in the set.

total_distance=0; % This line initializes a variable called "total_distance" to zero.

for i=1:npf % This line starts a loop that goes through each point in the set.

    total_distance=total_distance+((Distance(i)-d_average)^2); % This line adds the squared
    % difference between the distance from the i-th point to its closest neighbor and the 
    % average distance to the variable "total_distance".

end

%S=(sqrt(total_distance/npf))/d_average; 
S=(sqrt(total_distance/(npf-1))); % This line computes the metric of spacing "S" by 
% dividing the square root of the sample variance of the distances by (npf-1), which is 
% consistent with the original definition of the metric of spacing.

% S=(sqrt(total_distance/(npf))); 
end 