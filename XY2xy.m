function r = XY2xy(X, alpha, Xc)
%XY2XY Transforms ellipse that it is symmetric to x- and y-axis
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
R = [cos(alpha) sin(alpha);-sin(alpha) cos(alpha)];
r = R*(X-Xc);
end

