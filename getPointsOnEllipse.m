function r = getPointsOnEllipse(x, y, a, b, angle, steps)
%GETPOINTSONELLIPSE Summary of this function goes here
%   Detailed explanation goes here
%# This functions returns points to draw an ellipse
%#
%#  @param x     X coordinate
%#  @param y     Y coordinate
%#  @param a     Semimajor axis
%#  @param b     Semiminor axis
%#  @param angle Angle of the ellipse (in degrees)
%#

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

