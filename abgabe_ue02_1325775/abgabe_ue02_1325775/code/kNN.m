% Tom Tucek, 1325775

function [classification] = kNN(Test, Train, k)
% INPUT
% Test -> samples to be classified
% Train -> samples in trainingset
% k -> size of neighborhood

% OUTPUT
% classification -> class labels for testset

% initialize output with zeros (for each sample in testset)
classification = zeros(size(Test,1),1);

% 1.1 TODO: implement kNN classifier on your own
% use of knnsearch is forbidden!
% distance metric: Euclidean

for i = 1 : length(Test)

    distances = zeros(length(Train), 2);
    
    % calculate all distances to trainings data
    for j = 1 : length(Train)
       
        % 1. value = distance, 2. value = class of training data
        distances(j, :) = [ euclidean_distance(Test(i, 1:(size(Test,2)-1) ), Train(j, 1:(size(Train,2)-1) )) Train(length(Train) * (size(Train,2)-1) + j) ];
        
    end
    
    % sort distances by distance
    distances = sortrows(distances);
    
    % get the top k classes
    classes = distances(1:k, 2);
    
    % classification = the most common entry
    classification(i) = mode(classes);
    
end

    
end

function [d] = euclidean_distance(x, y)

d = sqrt(sum((x - y).^2));

end