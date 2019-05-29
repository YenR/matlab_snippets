% Tom Tucek, 1325775
function [basis] = determineBasis(A, eigenvectors)
% INPUT
% A ... training data minus mean vector
% eigenvectors

% OUTPUT
% basis ... matrix of normalized basis vectors

basis = normc(A*eigenvectors);

end

