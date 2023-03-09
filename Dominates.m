% Domination developed by 
% Bahman Ahmadi , University of Twente, b.ahmadi@utwente.nl
% ------------------------------------------------------------------------

function dom=Dominates(x,y)
    dom=all(x<=y) && any(x<y);
end