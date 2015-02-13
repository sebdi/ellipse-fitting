function [ new ] = fitWithLSO( Xi, Yi)
%FITWITHLSO Summary of this function goes here
%   Detailed explanation goes here
%Orthogonal distances fitting of ellipse

% initial guess
p = fitWithLSA(Xi,Yi);
[Xc,Yc,a,b,alpha] = Matrix2AngleForm(p(1),p(2),1-p(1),p(3),p(4),p(5));



lambda=0.1;
for k=1:50
    J=[];
    X_2strich=[];
    for i=1:length(Xi)
        r=XY2xy([Xi(i);Yi(i)],alpha,[Xc;Yc]);
        x_strich=getOrthoPoint(r(1),r(2),a,b);
        X_strich=xy2XY2(x_strich,alpha,[Xc;Yc]);
        %plot(X_strich(1),X_strich(2),'gO'); Orthogonal Punkt ist richtig
        %hold on;
        xi=XY2xy([Xi(i);Yi(i)],alpha,[Xc;Yc]);
        J=[J;calcJacobianMatrix(a,b,x_strich(1),x_strich(2),alpha,xi(1),xi(2))];
        X_2strich=[X_2strich;[Xi(i);Yi(i)]-X_strich];
    end
    r=-pinv(J)*X_2strich;
    %norm(r)
    Xc=Xc-lambda*r(1);
    Yc=Yc-lambda*r(2);
    a=a-lambda*r(3);
    b=b-lambda*r(4);
    alpha=alpha-lambda*r(5);
end
new=[Xc,Yc,a,b,alpha];

end

function r=calcJacobianMatrix(a,b,x,y,alpha,xi,yi)
% Jacobian matrix at the orthogonal contacting point on ellipse
C=cos(alpha);
S=sin(alpha);
R=[C S;-S C];
B1=[b^2*x*C-a^2*y*S;b^2*(yi-y)*C+a^2*(xi-x)*S];
B2=[b^2*x*S+a^2*y*C;b^2*(yi-y)*S-a^2*(xi-x)*C];
B3=[a*(b^2-y^2);2*a*y*(xi-x)];
B4=[b*(a^2-x^2);-2*b*x*(yi-y)];
B5=[(a^2-b^2)*x*y;(a^2-b^2)*(x^2-y^2-x*xi+y*yi)];
B=[B1 B2 B3 B4 B5];
Qk=[b^2*x a^2*y;(a^2-b^2)*y+b^2*yi (a^2-b^2)*x-a^2*xi];
J=pinv(R)*pinv(Qk)*B;
r=J;
end
