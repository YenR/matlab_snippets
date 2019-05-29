% Tom Tucek, 1325775


function [meanW] = myMean(Train)
% INPUT
% Train -> samples of a class

%OUTPUT
% meanW -> estimated mean of a class w

% 2.1 TODO: estimate mean from samples

%meanW = mean(Train);
meanW = 1/length(Train) * sum(Train);

end

