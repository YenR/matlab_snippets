% Tom Tucek, 1325775

% k-NEAREST-NEIGHBOR (kNN)

% data: 100 x 5 -> 100 samples, 4 features, 1 class label
%N = [data{1} data{2} data{3} data{4} data{5}]; % 1.3 TODO: Try different features and feature combinations to achieve the best result (minimum error).
N = [data{2} data{3} data{4} data{5}]; % 1.3 TODO: Try different features and feature combinations to achieve the best result (minimum error).

% TRAININGSET
Train = [N(1:25,:); N(51:75,:)];

% TESTSET
Test = [N(26:50,:); N(76:100,:)];

k = 1 : 2 : 21; % test for different k
errorskNN = zeros(length(k),1); % store error of each k

for i = 1 : length(k)
    % classify
    [classificationkNN] = kNN(Test, Train, k(i)); % 1.1 TODO: implement kNN -> kNN.m
    % evaluate
    errorskNN(i) = evaluate(classificationkNN, Test(:,size(Test,2))); % 1.2 TODO: evaluate results of classification -> evaluate.m
    disp(['kNN wrongly classified ', sprintf('%.2f',errorskNN(i)), '% of Testset with k = ', sprintf('%d',k(i)), '.']);
end

% draw error in % over different k
figure;
hold on;
title('Error of kNN in %');
xlabel('value of k'); % x-axis label
ylabel('error in %'); % y-axis label
axis([k(1),k(length(k)),0,max(errorskNN)]); % limits of axis
plot(k,errorskNN,':r*');
hold off;