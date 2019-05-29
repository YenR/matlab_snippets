% Tom Tucek, 1325775

function [result] = kmeansClustering(data, noc)
% Input
% data ... input data
% noc ... number of clusters

% Output
% result ... cluster labels

% TODO 1.2

% random cluster middle points
rng(0);
mid = rand(noc, 2);

result = zeros(size(data{1}, 1), 1);

run = 1;

while run
    for i=1:size(data{1}, 1)

        pointx = data{1}(i);
        pointy = data{2}(i);

        %calculate distances to cluster centers
        distance = zeros(noc, 1);
        for j=1:noc
            distance(j) = pdist([pointx, pointy; mid(j,1), mid(j,2)] , 'euclidean');       
        end

        %find closest cluster center
        [M, index] = min(distance);
        result(i) = index;
    end
    
    oldmid = mid;
    
    %calculate new centers
    for i=1:noc
        clusterx = data{1}(result==i);
        clustery = data{2}(result==i);
        if(~isempty(clusterx))
            mid(i,1) = mean(clusterx);
            mid(i,2) = mean(clustery);
        end
    end
    
    % if no change, finish
    if(isequal(oldmid, mid))
        run = 0;
    end
    
end

end