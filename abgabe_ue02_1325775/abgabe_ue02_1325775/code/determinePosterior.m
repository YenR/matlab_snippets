% Tom Tucek, 1325775

function [posterior] = determinePosterior(weightedLikelihood, evidence)
% INPUT
% weightedLikelihood -> p(x|w)*P(w) of a class w and feature(s) x
% evidence -> P(x) of feature(s) x

% OUTPUT
% posterior -> P(w|x) of feature(s) x and class w

% 2.3 TODO: determine posterior

posterior = weightedLikelihood ./ evidence;

end

