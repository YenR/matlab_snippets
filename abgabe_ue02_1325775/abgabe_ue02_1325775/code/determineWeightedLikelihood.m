% Tom Tucek, 1325775


function [likelihood] = determineWeightedLikelihood(mean, var, prior, x)
% INPUT
% mean -> estiamted mean of a class conditional pdf
% var -> estiamted var of a class conditional pdf
% prior -> prior of a class
% x -> value of feature(s)

% OUTPUT
%  weighted likelihood -> p(x|w)*P(w) likelihood of class w for feature value(s) x

% 2.1 TODO calculate likelihood with the help of MATLAB's function for normal probability density functions

likelihood = pdf('Normal', x, mean, sqrt(var)) * prior;

end

