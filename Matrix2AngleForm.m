function [x0,y0,a,b,angle] = Matrix2AngleForm(A,B,C,D,E,F)
%MATRIX2ANGLEFORM Summary of this function goes here
%  See: http://en.wikipedia.org/wiki/Matrix_representation_of_conic_sections#Reduced_equation
B=2*B;
D=2*D;
E=2*E;
AQ=[A B/2 D/2;B/2 C E/2;D/2 E/2 F];
A33=[A B/2;B/2 C];
% Center
center=pinv(A33)*[-D/2;-E/2];
x0=center(1);
y0=center(2);
% Major and minor axis
e=eig(A33);
[V,D]=eig(A33);
a=sqrt(-det(AQ)/(det(A33)*e(1)));
b=sqrt(-det(AQ)/(det(A33)*e(2)));
% angle
angle=acos(-dot(V(:,1),[1;0])/norm(V(:,1)));

end

