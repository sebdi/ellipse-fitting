function [ p ] = fitWithMEstimator(x, y)
%FITWITHMESTIMATOR Summary of this function goes here
%   Detailed explanation goes here
X=[];
y2=[];
for i=1:length(x)
    X=[X;x(i)^2-y(i)^2 2*x(i)*y(i) 2*x(i) 2*y(i) 1];
    y2=[y2;-y(i)^2];
end

p=robustfit(X,y2,'cauchy','','off');

end

