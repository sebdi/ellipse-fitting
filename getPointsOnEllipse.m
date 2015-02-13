function r = getPointsOnEllipse(x, y, a, b, angle, steps)
%GETPOINTSONELLIPSE Draws points from an ellipse
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014

beta = angle * (pi / 180);
sinbeta = sin(beta);
cosbeta = cos(beta);

alpha = linspace(0, 360, steps)' .* (pi / 180);
sinalpha = sin(alpha);
cosalpha = cos(alpha);

X = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
Y = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);

r = [X Y];
end

