function main(x_c, y_c, a, b, alpha, var, sampleInterval, nMeasurements, nOutlier, withOutlier)
    if withOutlier
        simFitEllipseOutlier(x_c,y_c,a,b,alpha,var,sampleInterval, nMeasurements, nOutlier);
    else
        simFitEllipse(x_c,y_c,a,b,alpha,var,sampleInterval, nMeasurements);
    end
end