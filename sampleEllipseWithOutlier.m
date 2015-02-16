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
X = [XY(1,:) (a*2) * (rand(1,nOutlier)-0.5)+X_c];
Y = [XY(2,:) (a*2) * (rand(1,nOutlier)-0.5)+Y_c];
r = [X;Y];
end

