% Tom Tucek, 1325775


function [conditionalError] = determineError(posteriorW1, posteriorW2, classificationBayes)
% INPUT
% posteriorW1 -> posterior of class w1
% posteriorW2 -> posterior of class w2
% classificiationBayes -> result of Bayes decision rule

% OUTPUT
% conditionalError -> conditional error P(error|x)

% 2.4 TODO: Determine conditional error P(error|x).

conditionalError = zeros(1, length(posteriorW1));

for i=1:length(posteriorW1)

    if classificationBayes(i) == 1
        conditionalError(i) = posteriorW1(i);
    else
        conditionalError(i) = posteriorW2(i);
    end

end

end

