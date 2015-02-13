function [p, X, y2] = fitWithLSA(x, y)
%FITWITHLSA Ellipse Fitting with Least-Squares based on algebraic distance
% 
% [1] Zhengyou Zhang, "Parameter estimation techniques: a tutorial with 
% application to conic fitting", 
% Image and Vision Computing, 15(1):59 - 76, 1997.
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014

X = [];
y2 = [];
for i = 1 : length(x)
    X = [X;x(i)^2-y(i)^2 2*x(i)*y(i) 2*x(i) 2*y(i) 1];
    y2 = [y2;-y(i)^2];
end
% Least-Square
p=pinv(X' * X) * X' * y2;
end

