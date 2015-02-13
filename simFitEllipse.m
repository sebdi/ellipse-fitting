function [ output_args ] = simFitEllipse( X_c,Y_c,a,b,alpha,var,sampleInterval,nMeasurements)
%SAMPLEELLIPSE Simulates the fitting of an ellipse without outlier
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
r = plotEllipse(X_c, Y_c, a, b, rad2deg(alpha), 100,'black',4);
hold on;
noise = sampleEllipse(X_c,Y_c,a,b,alpha,var,sampleInterval,nMeasurements);
plot(noise(1,:),noise(2,:),'O','Color','black');
hold on;
% Ellipse fitting with Least-Squares based on orthogonal distance
rORTHO = fitWithLSO(noise(1,:),noise(2,:));
r = plotEllipse(rORTHO(1), rORTHO(2), rORTHO(3), rORTHO(4), rad2deg(rORTHO(5)), 100,'red',1);
hold on;
% Ellipse fitting with Least-Squares based on algebraic distance
p = fitWithLSA(noise(1,:),noise(2,:));
[x0,y0,a,b,alpha] = Matrix2AngleForm(p(1),p(2),1-p(1),p(3),p(4),p(5));
r = plotEllipse(x0, y0, a, b, rad2deg(alpha), 100,'green',1);
hold on;
% Ellipse fitting with Weighted Least-Squares based on algebraic distance
p = fitWithGWLS(noise(1,:),noise(2,:));
[x0,y0,a,b,alpha] = Matrix2AngleForm(p(1),p(2),1-p(1),p(3),p(4),p(5));
r = plotEllipse(x0, y0, a, b, rad2deg(alpha), 100,'yellow',1);
legend('GroundTruth','Noise','L-S with orthogonal distance','L-S with algebraic distance','Gradient Weighted L-S')
ylim([-30 30]);
end
