% Tom Tucek, 1325775

%% Data
X = [1 1; 3 2; 5 3; 7 4; 7 1; 2 5; 5 9; % class 0
    2 9; 3 7; 7 7; 9 8; 9 5; 10 2; 10 10]; % class 1
gt = [0 0 0 0 0 0 0 1 1 1 1 1 1 1]; % ground truth, class labels

figure;
gscatter(X(:,1), X(:,2), gt, 'br','xo');
axis([0 11 0 11]);
xlabel('x');
ylabel('y');
legend('off');

%% Grow Tree
growTree(X, gt); % TODO 2.1
