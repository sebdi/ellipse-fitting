function [ r ] = sampleEllipseWithOutlier(X_c, Y_c, a, b, alpha, var, sampleInterval, nSample, nOutlier)
%SAMPLEELLIPSEWITHOUTLINER Samples a ellipse with outliers
% Samples a ellipse of the form:
% x(t)=x_c + a * cos(t) * cos(alpha) - b * sin(t) * sin(alpha) + var*randn;
% y(t)=y_c + a * cos(t) * sin(alpha) + b * sin(t) * cos(alpha) + var*randn;
% 
% Plus adds uniformly distributed outliers 
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
[XY] = sampleEllipse(X_c,Y_c,a,b,alpha,var,sampleInterval,nSample);
% add uniformly distributed outliers 
X = [XY(1,:) X_c-a*rand(1,nOutlier/4) X_c-a*rand(1,nOutlier/4) X_c-a*rand(1,nOutlier/4) X_c-a*rand(1,nOutlier/4)];
Y = [XY(2,:) Y_c+a*rand(1,nOutlier/4) Y_c-a*rand(1,nOutlier/4) Y_c-a*rand(1,nOutlier/4) Y_c+a*rand(1,nOutlier/4)];
r = [X;Y];
end

