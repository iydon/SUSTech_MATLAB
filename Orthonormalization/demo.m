%% Initial
syms x;

interval = [0,1];
basis    = [1,x,x^2,x^3,x^4,x^5,x^6,x^7];
f        = @(x)sqrt(x);

model    = orthDecomp(basis,f,interval);



%% Calculate
% Orthonormalize
orthBasis = orthDecomp.orthnorm(model);
% Approaching Function --- pretty(fcn)
fcn       = orthDecomp.approach(model);
% Visualization
err       = orthDecomp.visualize(model);