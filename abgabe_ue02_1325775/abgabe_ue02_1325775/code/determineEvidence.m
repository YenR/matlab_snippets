% Tom Tucek, 1325775


function [evidence] = determineEvidence(weightedLikelihoodW1, weightedLikelihoodW2)
% INPUT
% weightedLikelihoodW1 -> likelihood of class w1 for certain x p(x|w1)
% weightedLikelihoodW2 -> likelihood of class w2 for certain x p(x|w2)

% OUTPUT
% evidence

% 2.2 TODO: determine evidence, consider that likelihoods could be single values or vectors!

evidence = weightedLikelihoodW1 + weightedLikelihoodW2;

end

