function [ p ] = fitWithGWLS( x,y )
%FITWITHGWLS Summary of this function goes here
%   Detailed explanation goes here
[p0,X,y2]=fitWithLSA(x,y);
W=zeros(length(x));
p=p0;
for k=1:10
    for i=1:length(x)
        partialX=2*p(1)*x(i)+2*p(2)*y(i)+2*p(3);
        partialY=-2*p(1)*y(i)+2*p(2)*x(i)+2*p(4)+2*y(i);
        W(i,i)=partialX^2+partialY^2;
    end
    
    p_new=pinv(X'*pinv(W)*X)*X'*pinv(W)*y2;
    if norm(p-p_new)<0.1
        break
    else
        p=p_new;
    end
end

