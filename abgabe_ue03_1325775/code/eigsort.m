% Tom Tucek, 1325775
function [sortedVectors, sortedValues] = eigsort(eigenvectors, eigenvalues)
% INPUT
% eigenvectors
% eigenvalues

% OUTPUT
% sortedVectors ... sorted Eigenvectors (decending)
% sortedValues ... sorted Eigenvalues (decending)

% taken from http://de.mathworks.com/matlabcentral/fileexchange/18904-sort-eigenvectors---eigenvalues

sortedValues=diag(sort(diag(eigenvalues),'descend'));
[c, ind]=sort(diag(eigenvalues),'descend');
sortedVectors=eigenvectors(:,ind); 

end

