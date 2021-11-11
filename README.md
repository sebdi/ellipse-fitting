Ellipse Fitting
========================

A collection of ellipse fitting algorithms:
* Least-Squares with algebraic distance [2]
* Least-Squares with orthogonal distance [3]
* Gradient-Weighted Least-Sqaures [2]
* M-Estimator (Cauchy)
* Least Median of Squares

If you find that code helpful please cite my paper [1].

How to use
-------------------
Use the main.m file. You can use it like this:

main(0,0,24,12,0,0.25,[0.5 * pi 1.5 * pi],200,30,0)

for a simulation of an ellipse with center (0;0) , axes a=24 & b=12, alpha=0, noise variance of 0.25, interval of measurements [0.5 * pi;1.5 * pi], # measurements 200, without outlier.

With

main(0,0,24,12,0,0.25,[0.5 * pi 1.5 * pi],200,30,1)

outliers are added to the simulation.

References:
-------------------
[1] [Sebastian Dingler, "*Fitting ellipses to noisy measurements*.", arXiv preprint arXiv:2111.05359, 2021.](https://arxiv.org/abs/2111.05359)

[2] Zhengyou Zhang, "*Parameter estimation techniques: a tutorial with application to conic fitting*", Image and Vision Computing, 15(1):59 - 76, 1997.

[3] Sung Joon Ahn, W. Rauh, and M. Recknagel, "*Ellipse fitting and parameter assessment of circular object targets for robot vision*", Intelligent Robots and Systems, 1999.
 
