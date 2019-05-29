% Tom Tucek, 1325775

function growTree(X, gt)
% Input
% X ... input data (2D points)
% gt ... ground truth (class labels)

% Output: text output in console

% TODO 2.1

iN = unreinheit(X,gt);

if iN == 0  %rein => leaf
    data = strcat('(', num2str(X(:,1)), ',', num2str(X(:,2)), ')');
    data = data';
    disp(strcat('Leaf: ', data(:)'));
else

    xcoords = unique(X(:,1));
    ycoords = unique(X(:,2));

    % try cuts along x
    highest_diNx = 0;
    best_cutx = 0;

    for i=1:size(xcoords,1)-1
         cut = ( xcoords(i) + xcoords(i+1) ) / 2;

         PL = size(X(X(:,1)<=cut),1) / size(X,1); 

         iNL = unreinheit(X((X(:,1)<=cut), :), gt(X(:,1)<=cut));
         iNR = unreinheit(X((X(:,1)>cut), :), gt(X(:,1)>cut));

         diN = iN - PL * iNL - (1-PL) * iNR;

         if(diN >= highest_diNx)
            best_cutx = cut;
            highest_diNx = diN;
         end
    end

    % try cuts along y
    highest_diNy = 0;
    best_cuty = 0;

    for i=1:size(ycoords,1)-1
         cut = ( ycoords(i) + ycoords(i+1) ) / 2;

         PL = size(X(X(:,1)<=cut),1) / size(X,1); 

         iNL = unreinheit(X((X(:,2)<=cut), :), gt(X(:,2)<=cut));
         iNR = unreinheit(X((X(:,2)>cut), :), gt(X(:,2)>cut));

         diN = iN - PL * iNL - (1-PL) * iNR;

         if(diN >= highest_diNy)
            best_cuty = cut;
            highest_diNy = diN;
         end
    end

    %decide where to cut
    if(highest_diNx >= highest_diNy)
        disp(strcat('Node: sepearation in x. Threshold: ', num2str(best_cutx)));
        growTree(X((X(:,1)<=best_cutx), :), gt(X(:,1)<=best_cutx));
        growTree(X((X(:,1)>best_cutx), :), gt(X(:,1)>best_cutx));
    else
        disp(strcat('Node: sepearation in y. Threshold: ', num2str(best_cuty)));
        growTree(X((X(:,2)<=best_cuty), :), gt(X(:,2)<=best_cuty));
        growTree(X((X(:,2)>best_cuty), :), gt(X(:,2)>best_cuty));
    end
end
end

function [result] = unreinheit(input, gt)

    class1 = size(input(gt==0), 2);
    class2 = size(input(gt==1), 2);
    
    s = class1 + class2;
    
    class1 = double(class1)/s;
    class2 = double(class2)/s;
    
    if class1 == 0 || class2 == 0 
        result = 0;
    else
        result = - (class1*log2(class1) + class2*log2(class2)); 
    end
     
end