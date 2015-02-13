function p = fitWithGWLS(x, y)
%FITWITHGWLS Ellipse fitting with Gradient Weighted Least-Squares
% 
% [1] Zhengyou Zhang, "Parameter estimation techniques: a tutorial with 
% application to conic fitting", 
% Image and Vision Computing, 15(1):59 - 76, 1997.
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014

% initial guess
[p0,X,y2] = fitWithLSA(x,y);


W = zeros(length(x));
p = p0;
for k = 1 : 10
    for i = 1 : length(x)
        % Gradient
        partialX = 2 * p(1) * x(i) + 2 * p(2) * y(i) + 2 * p(3);
        partialY = -2 * p(1) * y(i) + 2 * p(2) * x(i) + 2 * p(4) + 2 * y(i);
        W(i,i)=partialX^2+partialY^2;
    end
    % Weighted Least-Squares
    p_new=pinv(X' * pinv(W) * X) * X' * pinv(W) * y2;
    
    % stop criterium
    if norm(p-p_new)<0.1
        break
    else
        p=p_new;
    end
end

