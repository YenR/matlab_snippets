% Tom Tucek, 1325775

function [error] = evaluate(classification, gt)
% INPUT
% classification -> result of classifier
% gt -> ground truth, real class labels

% OUTPUT
% error -> how many samples were classified incorrect in %

% 1.2 TODO: calculate how many samples were classified incorrect in %

errors = 0;

for i = 1 : length(classification)

    if classification(i)~= gt(i)
        errors = errors +1;
    end
    
end

error = errors / length(classification) * 100;

% shorter but requires only 1 and 0 as possible classes
% error = sum(abs(classification - gt)) / length(classification);

end

