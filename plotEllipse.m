function p = plotEllipse( x, y, a, b, angle, steps, lColor, lWidth)
%SAMPLEELLIPSE Plots a ellipse
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
p = getPointsOnEllipse(x, y, a, b, angle, steps);
plot(p(:,1), p(:,2),'Color',lColor,'LineWidth',lWidth);
axis equal;
end

