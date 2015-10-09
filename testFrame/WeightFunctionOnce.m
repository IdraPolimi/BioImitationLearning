function y = WeightFunctionOnce( x, mu, sigma ) 

    if nargin<2
        mu=0;
    elseif nargin<3
        sigma=1./100.;
    end


    if any(size(mu) ~= size(sigma))
        error('mu and sigma should be of the same size');
    end

    y = zeros([size(x) numel(mu)]);

    for i=1:numel(mu)
        y(:,:,i) = exp(-((x - mu(i)) .^ 2 ./ (2 .* sigma(i) .^ 2)));
    end

    %y = sum(y,3)/size(y,3);
    y = 1-prod(1-y,3);
    
end