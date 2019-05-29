% Tom Tucek, 1325775

% load data
% TODO 1.1

file = fopen('datasets/Aggregation.txt');
data1 = textscan(file, '%f %f %f');
fclose(file);

file = fopen('datasets/Jain.txt');
data2 = textscan(file, '%f %f %f');
fclose(file);

%normalize
data1{1} = (data1{1} - min(data1{1}))/(max(data1{1}) - min(data1{1}));
data1{2} = (data1{2} - min(data1{2}))/(max(data1{2}) - min(data1{2}));

data2{1} = (data2{1} - min(data2{1}))/(max(data2{1}) - min(data2{1}));
data2{2} = (data2{2} - min(data2{2}))/(max(data2{2}) - min(data2{2}));

% cluster datasets: k-Means
% TODO 1.2

num_clusters1 = size(unique(data1{3}),1);
num_clusters2 = size(unique(data2{3}),1);

result1 = kmeansClustering({data1{1} data1{2}}, num_clusters1);
result2 = kmeansClustering({data2{1} data2{2}}, num_clusters2);

% cluster datasets: Agglomerative
% TODO 1.3

agglo1 = clusterdata([data1{1} data1{2}], 'maxclust', num_clusters1, 'distance', 'euclidean', 'linkage', 'centroid');
agglo2 = clusterdata([data2{1} data2{2}], 'maxclust', num_clusters2, 'distance', 'euclidean', 'linkage', 'weighted');

% show datasets and results
% TODO 1.4

figure;
subplot(1,3,1);
scatter(data1{1}, data1{2}, 30, data1{3}, 'filled');
title('Ground Truth Dataset 1');

subplot(1,3,2);
scatter(data1{1}, data1{2}, 30, result1, 'filled');
title('k-Means Clustering Dataset 1');

subplot(1,3,3);
scatter(data1{1}, data1{2}, 30, agglo1, 'filled');
title('Agglomerative Clustering Dataset 1');


figure;
subplot(1,3,1);
scatter(data2{1}, data2{2}, 30, data2{3}, 'filled');
title('Ground Truth Dataset 2');

subplot(1,3,2);
scatter(data2{1}, data2{2}, 30, result2, 'filled');
title('k-Means Clustering Dataset 2');

subplot(1,3,3);
scatter(data2{1}, data2{2}, 30, agglo2, 'filled');
title('Agglomerative Clustering Dataset 2');

