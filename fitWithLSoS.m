function r = fitWithLSoS(measurements, p2)
%FITWITHLSOS Ellipse fitting with Least Median of Square
%
% [1] Zhengyou Zhang, "Parameter estimation techniques: a tutorial with
% application to conic fitting",
% Image and Vision Computing, 15(1):59 - 76, 1997.
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014

% 1. Draw m random subsamples of p different points
m=round(length(measurements)/p2);
p=[];

for i = 1 : m
    J=datasample(measurements',p2);
    % 2. For each subsample use LSA for fitting a conic
    p(i,:) = fitWithLSA(J(:,1),J(:,2));
    [x0,y0,a,b,alpha]=Matrix2AngleForm(p(i,1),p(i,2),1-p(i,1),p(i,3),p(i,4),p(i,5));
    % 3. Compute the residual for all measurements
    for j = 1 : length(measurements)
        xy = XY2xy([measurements(1,j);measurements(2,j)], alpha, [x0;y0]);
        x_new = getOrthoPoint(xy(1), xy(2), a, b);
        X_new = xy2XY2(x_new, alpha, [x0;y0]);
        r(j) = norm([measurements(1,j);measurements(2,j)]-X_new);
    end
    M(i) = median(r.^2);
end
% Take median
[v,idx] = min(M);
[x0,y0,a,b,alpha] = Matrix2AngleForm(p(idx,1),p(idx,2),1-p(idx,1),p(idx,3),p(idx,4),p(idx,5));
r = [x0;y0;a;b;alpha];
end

