function [r] = sampleEllipse(x_c, y_c, a, b, phi, var, sampleInterval, nSamples)
%SAMPLEELLIPSE Samples a ellipse
% Samples a ellipse of the form:
% x(t)=x_c + a * cos(t) * cos(alpha) - b * sin(t) * sin(alpha) + var*randn;
% y(t)=y_c + a * cos(t) * sin(alpha) + b * sin(t) * cos(alpha) + var*randn;
% 
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
t=linspace(sampleInterval(1),sampleInterval(2),nSamples);
for i=1:length(t)
    x(i)=x_c+a*cos(t(i))*cos(phi)-b*sin(t(i))*sin(phi)+sqrt(var)*randn;
    y(i)=y_c+a*cos(t(i))*sin(phi)+b*sin(t(i))*cos(phi)+sqrt(var)*randn;
end
r=[x;y];
end
