% Pareto quality indices developed by 
% Bahman Ahmadi , University of Twente, b.ahmadi@utwente.nl
% ------------------------------------------------------------------------

% Generate some random Pareto optimal solutions with two objectives
function PF=Generate_Pareto_example(nn)
n=nn*4;
x1 = linspace(0, 1, n)';
x2 = sqrt(1 - x1.^2)+rand(n,1)/50;
pareto_front = [-x1+1, -x2+abs(min(-x2))];
PF=[];

for i=1:n
    dom=0;
    for j=[1:i-1 i+1:n]
        if Dominates(pareto_front(j,:),pareto_front(i,:))
            dom=1;
        end
    end
    if dom==0
    PF=[PF;pareto_front(i,:)];
    end
end
PF=PF(randperm(size(PF, 1)),:);
PF=PF(1:100,:);
% Plot the Pareto front
plot(PF(:,1), PF(:,2), '.');
xlabel('Objective 1');
ylabel('Objective 2');
title('Pareto Front');

end