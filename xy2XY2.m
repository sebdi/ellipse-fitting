function r = xy2XY2(x, alpha, Xc)
%XY2XY2 Rotates ellipse back (inverse function of XY2xy.m)
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
R = [cos(alpha) sin(alpha);-sin(alpha) cos(alpha)];
r = pinv(R)*x+Xc;
end

