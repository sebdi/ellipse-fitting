Ellipse Fitting
========================

A collection of ellipse fitting algorithms:
* Least-Squares with algebraic distance [1]
* Least-Squares with orthogonal distance [2]
* Gradient-Weighted Least-Sqaures [1]
* M-Estimator (Cauchy)
* Least Median of Squares

You can test it online as a web service on [www.cloudrunner.eu](www.cloudrunner.eu/algorithm/172/ellipse-fitting/)!

How to use
-------------------
Use the main.m file. You can use it like this:

main(0,0,24,12,0,0.25,[0.5*pi 1.5*pi],200,30,0)

for a simulation of an ellipse with center (0;0) , axes a=24 & b=12, alpha=0, noise variance of 0.25, interval of measurements [0.5*pi;1.5*pi], # measurements 200, without outlier.


References:
-------------------
[1] Zhengyou Zhang, "*Parameter estimation techniques: a tutorial with application to conic fitting*", Image and Vision Computing, 15(1):59 - 76, 1997.

[2] Sung Joon Ahn, W. Rauh, and M. Recknagel, "*Ellipse fitting and parameter assessment of circular object targets for robot vision*", Intelligent Robots and Systems, 1999.
 
