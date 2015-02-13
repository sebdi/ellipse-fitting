function [ r ] = fitWithLSoS( measurements,p2 )
%FITWITHLSOS Summary of this function goes here
%   Detailed explanation goes here
% 1. Draw m random subsamples of p different points
m=round(length(measurements)/p2);
p=[];
for i=1:m
J=datasample(measurements',p2);
% 2. For each subsample use LSA for fitting a conic
p(i,:)=fitWithLSA(J(:,1),J(:,2));
[x0,y0,a,b,alpha]=Matrix2AngleForm(p(i,1),p(i,2),1-p(i,1),p(i,3),p(i,4),p(i,5));
% 3. Compute the residual for all measurements for the conic
for j=1:length(measurements)
strich=XY2xy([measurements(1,j);measurements(2,j)],alpha,[x0;y0]);
x_strich=getOrthoPoint(strich(1),strich(2),a,b);
X_strich=xy2XY2(x_strich,alpha,[x0;y0]);
r(j)=norm([measurements(1,j);measurements(2,j)]-X_strich);
end
M(i)=median(r.^2);
end
[v,idx]=min(M);
[x0,y0,a,b,alpha]=Matrix2AngleForm(p(idx,1),p(idx,2),1-p(idx,1),p(idx,3),p(idx,4),p(idx,5));
r=[x0;y0;a;b;alpha];
end

