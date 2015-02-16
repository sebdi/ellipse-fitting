% Simulation of different ellipse fitting algorithms
%
% Input:
% x_c            - x center of ellipse
% y_c            - y center of ellipse
% a              - major axis a
% b              - minor axis b
% alpha          - angle of ellipse
% var            - variance of measurement noise
% sampleInterval - interval of measurements must be between [0;2*pi]
% nMeasurements  - # of measurements
% nOutlier       - # of outlier
% withOutlier    - bool switch for simulation with or withour outlier
%
% Example:
% >> main(0,0,24,12,0,0.25,[0.5*pi 1.5*pi],200,30,0)
%
% AUTHOR Sebastian Dingler <s.dingler@gmail.com>
%        Karlsruhe Institute of Technology (KIT), Germany
%
% DATE   22.12.2014
function main(x_c, y_c, a, b, alpha, var, sampleInterval, nMeasurements, nOutlier, withOutlier)
if withOutlier
    simFitEllipseOutlier(x_c,y_c,a,b,alpha,var,sampleInterval, nMeasurements, nOutlier);
else
    simFitEllipse(x_c,y_c,a,b,alpha,var,sampleInterval, nMeasurements);
end
end