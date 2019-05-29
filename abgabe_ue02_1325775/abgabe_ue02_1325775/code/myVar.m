% Tom Tucek, 1325775


function [varW] = myVar(Train, meanW)
% INPUT
% Train -> samples of a class
% meanW -> estimated mean of class

%OUTPUT
% varW -> estimated variance of a class

% 2.1 TODO: estimate variance from samples and mean

temp = Train;

for i=1:size(temp)
   temp(i,:)=temp(i,:)-meanW; 
end

varW = 1/(length(Train)-1) * sum(temp.^2);

end

