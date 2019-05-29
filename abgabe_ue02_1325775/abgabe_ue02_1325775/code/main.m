% Tom Tucek, 1325775

clc; % clear console
close all; % close all previous figures

%% READ DATASET
file = fopen('lilien.txt');
data = textscan(file, '%f %f %f %f %f');
fclose(file);

% 0.0 TODO: Normalize the data

data{1} = (data{1} - min(data{1}))/(max(data{1}) - min(data{1}));
data{2} = (data{2} - min(data{2}))/(max(data{2}) - min(data{2}));
data{3} = (data{3} - min(data{3}))/(max(data{3}) - min(data{3}));
data{4} = (data{4} - min(data{4}))/(max(data{4}) - min(data{4}));

% figure;
% colors = zeros( length(data{5}), 3);
% colors(:,1) = data{5};
% colors(:,2) = 1 - data{5};
% scatter(data{3}, data{4}, [], colors, 'filled')
% title('3 & 4');
% figure;
% scatter3(data{2}, data{3}, data{4}, [], colors, 'filled')
% title('2 & 3 & 4');

%% k-NEAREST-NEIGHBORS (kNN) Tasks
kNNTasks

%% BAYES THEOREM Tasks
bayesTasks