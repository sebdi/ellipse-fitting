function [ r ] = xy2XY2(x, alpha, Xc)
%XY2XY2 Summary of this function goes here
%   Detailed explanation goes here
R=[cos(alpha) sin(alpha);-sin(alpha) cos(alpha)];
r=pinv(R)*x+Xc;
end

