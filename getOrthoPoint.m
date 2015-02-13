function r = getOrthoPoint(xi, yi, a, b)
%GETORTHOPOINT Compute orthogonal Point on ellipse
%
% [1] Sung Joon Ahn, W. Rauh, and M. Recknagel, "Ellipse fitting and
% parameter assessment of circular object targets for robot vision",
% Intelligent Robots and Systems, 1999.
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014

%Orthogonal contacting point on ellipse
xk1 = ([xi;yi]*a*b)/sqrt(b^2*xi^2+a^2*yi^2);
if abs(xi)<a
    xk2=[xi;sign(yi)*(b/a)*sqrt(a^2-xi^2)];
else
    xk2=[sign(xi)*a;0];
end

x_e = 0.5*(xk1+xk2); % x_0
for i=1:4
    x = x_e(1);
    y = x_e(2);
    Qk = [b^2*x a^2*y;(a^2-b^2)*y+b^2*yi (a^2-b^2)*x-a^2*xi];
    fk = [0.5*(a^2*y^2+b^2*x^2-a^2*b^2);b^2*x*(yi-y)-a^2*y*(xi-x)];
    x_e = x_e-pinv(Qk)*fk;
end
r = x_e;
end

