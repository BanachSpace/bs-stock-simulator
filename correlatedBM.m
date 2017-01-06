function [B1,B2] = correlatedBM(T, rho)
% generates two correlated Brownian motions on the array T (which is
% supposed to be a time interval) with parameter rho, which means that the
% two are correlated with factor rho

%this simple function can be used for example in the Heston volatility
%model

X = length(T);

B1 = zeros(1,X);
B2 = zeros(1,X);

B1(1) = 0;
B2(1) = 0;

for i = 1 : X-1;
    dt = T(i+1)-T(i);
    X1 = randn;
    X2 = randn;
    X3 = rho*X1 + sqrt(1-rho^2)*X2;
    B1(i+1) = B1(i) + sqrt(dt) * X1;
    B2(i+1) = B2(i) + sqrt(dt) * X3;
    
end;

end

