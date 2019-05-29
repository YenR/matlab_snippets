% Tom Tucek, 1325775

% Load dataset -> TODO 2.1
[test, training] = loadData();

% Mean vector -> TODO 2.2
meanVector = determineMeanVector(training);

% Subtract mean vector from training data -> TODO 2.3
A = determineMeanSubtracted(training, meanVector);

% Eigenvectors and Eigenvalues of A'A 
[eigenvectors, eigenvalues] = eig(A'*A); % -> TODO 2.4
[eigenvectors, eigenvalues] = eigsort(eigenvectors, eigenvalues); % -> TODO 2.5

% Basis (Eigenobjects) -> TODO 2.6
U = determineBasis(A, eigenvectors);

% Reconstruction and evaluation -> TODO 2.7
errorTrain = reconstructEval(U, training, meanVector);
errorTest = reconstructEval(U, test, meanVector);

figure;
hold on;
title('Reconstruction error per sample');
xlabel('number of eigenvectors'); % x-axis label
ylabel('error per sample'); % y-axis label
axis([1, size(U,2), 0, max([errorTrain errorTest])]); % limits of axis
plot(errorTrain,'g');
plot(errorTest, 'r');
hold off;