function [error] = reconstructEval(U, dataset, meanVector)
% INPUT
% U ... basis
% dataset ... training or test set
% meanVector ... mean vector calculated from training set

% OUTPUT
% error ... vector with error per sample for all possible basis (all eigenvectors -> 1 eigenvector)

koeff = U' * determineMeanSubtracted(dataset, determineMeanVector(dataset));

error = zeros(1, size(dataset, 2));

for i=1:size(koeff,2)
    
    reconst = U * koeff(:, 1:size(koeff,2) - (i-1)) + determineMeanSubtracted(dataset(:, 1:size(koeff,2) - (i-1)), determineMeanVector(dataset(:, 1:size(koeff,2) - (i-1))));
    error(i) = norm(reconst-double(dataset(:, 1:size(koeff,2) - (i-1))));
    
end

end

