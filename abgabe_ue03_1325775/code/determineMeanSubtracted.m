% Tom Tucek, 1325775
function [trainingMeanSubtracted] = determineMeanSubtracted(training, meanVector)
% INPUT
% training ... training set
% meanVector ... mean vector of training set

% OUTPUT
% trainingMeanSubtracted ... training data minus mean vector (mean object)

trainingMeanSubtracted = zeros(size(training));

for i=1:size(training,1)
   trainingMeanSubtracted(i, :) = double(training(i, :)) - meanVector;
end

end

