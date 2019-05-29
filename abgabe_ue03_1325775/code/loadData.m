% Tom Tucek, 1325775
function [test, training] = loadData()
% OUTPUT
% test     ... test set (colum: sample, row: feature)
% training ... training set (colum: sample, row: feature)

% Define the location of the data set
path = 'coil-100/';

%% Training set
% Select eight views of five classes (out of 100 classes)

classes = [10, 13, 16, 20, 36];
index = 1;

for i=1:5
    for j=1:8
        image = imread(strcat(path, 'obj', num2str(classes(i)), '__', num2str(40 * j), '.png'));
        gray = rgb2gray(image);
        vector = gray(:);
        training(:, index) = vector;
        index = index +1;
    end
end

%% Test set
% Select four views of five classes (out of 100 classes)
index = 1;

for i=1:5
    for j=1:4
        image = imread(strcat(path, 'obj', num2str(classes(i)), '__', num2str(55 * j), '.png'));
        gray = rgb2gray(image);
        vector = gray(:);
        test(:, index) = vector;
        index = index +1;
    end
end

end

