function [ r ] = XY2xy(X,alpha,Xc)
%XY2XY Summary of this function goes here
%   Detailed explanation goes here
R=[cos(alpha) sin(alpha);-sin(alpha) cos(alpha)];
r=R*(X-Xc);
end

