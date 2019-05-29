% Tom Tucek, 1325775

function [classification] = bayesDecision(posteriorW1, posteriorW2)
% INPUT
% posteriorW1 -> posterior of class w1
% posteriorW2 -> posterior of class w2

% OUTPUT
% classification -> result of bayes decision, class label (0 or 1)

% 2.3 TODO: Decide for a class label for each x in X.

classification = zeros(1, length(posteriorW1));

for i=1:length(posteriorW1)

    if posteriorW1(i) > posteriorW2(i)
       classification(i) = 0;
    else
       classification(i) = 1;       
    end
    
end

end

