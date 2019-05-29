% Tom Tucek, 1325775

% BAYES THEOREM

% data: 100 x 5 -> 100 samples, 4 features, 1 class label
N = [data{4} data{5}]; % 2.6.1 TODO: select best feature

% TRAININGSET
Train = [N(1:25,:); N(51:75,:)];

% TESTSET
Test = [N(26:50,:); N(76:100,:)];

% priors P(w1) = P(w2) = 0.5 -> equal
priorW1 = 0.5;
priorW2 = 0.5;

% estimate parameters of class conditional pdfs p(X|w1) und p(X|w2)
% -> assume normal (Gaussian) distribution

%% 2.1 TODO
% estimate means
% 2.1 TODO -> myMean.m
meanW1 = myMean(Train(1:25,1));
meanW2 = myMean(Train(26:50,1));

% estimate variances
% 2.1 TODO -> myVar.m
varW1 = myVar(Train(1:25,1),meanW1); 
varW2 = myVar(Train(26:50,1),meanW2);

% determine likelihoods for X
% find suitable limits for X
maxX = max(meanW1+3*sqrt(varW1),meanW2+3*sqrt(varW2));
minX = min(meanW1-3*sqrt(varW1),meanW2-3*sqrt(varW2));
X = minX:0.001:maxX;

% 2.1 TODO -> determineLikelihood.m
weightedLikelihoodW1 = determineWeightedLikelihood(meanW1, varW1, priorW1, X);
weightedLikelihoodW2 = determineWeightedLikelihood(meanW2, varW2, priorW2, X);

% draw likelihoods for X
figure;
title('Weighted class conditional pdfs p(X|w1)*P(w1) and p(X|w2)*P(w2)');
hold on;
% plot weighted class conditional pdfs w1
plot(X, weightedLikelihoodW1, 'b');
% plot weighted class conditional pdfs w2
plot(X, weightedLikelihoodW2, 'g');
xlabel('X');
ylabel('Likelihood');
hold off;

%% 2.2 TODO
% determine evidence for X
evidence = determineEvidence(weightedLikelihoodW1, weightedLikelihoodW2); % 2.2 TODO -> determineEvidence.m 

% draw evidence
figure;
hold on;
plot(X, evidence, 'k');
xlabel('X');
ylabel('Evidence p(X)');
hold off;

%% 2.3 TODO
% determine posteriors for X
posteriorW1 = determinePosterior(weightedLikelihoodW1, evidence); % 2.3 TODO -> determinePosterior.m
posteriorW2 = determinePosterior(weightedLikelihoodW2, evidence); % 2.3 TODO -> determinePosterior.m

% draw posteriors for X
figure;
hold on;
title('A posteriori probabilities P(w1|X) and P(w2|X)');
% plot posterior w1
plot(X, posteriorW1, 'b');
% plot posterior w2
plot(X, posteriorW2, 'g');

% Bayes decision rule for X
classificationBayes = bayesDecision(posteriorW1, posteriorW2); % 2.3 TODO -> bayesDecision.m

%% 2.4 TODO
% determine conditional error P(error|X) for X
conditionalError = determineError(posteriorW1, posteriorW2, classificationBayes); % 2.4 TODO -> determineError.m

% plot conditional error P(error|X) for X
fill([X fliplr(X)], [conditionalError zeros(1,size(conditionalError,2))], 'r', 'edgecolor','r', 'FaceAlpha', 0.3);
xlabel('X');
ylabel('Posterior');
hold off;

%% 2.5 TODO
% apply on Testset
weightedLikelihoodW1 = determineWeightedLikelihood(meanW1, varW1, priorW1, Test);
weightedLikelihoodW2 = determineWeightedLikelihood(meanW2, varW2, priorW2, Test);
evidence = determineEvidence(weightedLikelihoodW1, weightedLikelihoodW2);
posteriorW1 = determinePosterior(weightedLikelihoodW1, evidence);
posteriorW2 = determinePosterior(weightedLikelihoodW2, evidence);
classificationBayes = bayesDecision(posteriorW1, posteriorW2); 
errorBayes = evaluate(classificationBayes, Test(:,size(Test,2)));
disp(['Bayes decision rule wrongly classified ', sprintf('%.2f',errorBayes), '% of Testset.']);