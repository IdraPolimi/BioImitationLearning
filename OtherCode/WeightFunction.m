function y = WeightFunction( x, mu, sigma ) 

    %y = WeightFunctionOnce(x,mu,sigma) + WeightFunctionOnce(x-1,mu,sigma);
    y = 1 - (1-WeightFunctionOnce(x,mu,sigma)) .* (1-WeightFunctionOnce(x-1,mu,sigma));

end