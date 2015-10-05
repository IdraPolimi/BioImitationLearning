function [ outhsv ] = ColorFilter( hsv, h, s )
%COLORFILTER Summary of this function goes here
%   Detailed explanation goes here

    if nargin < 2
        h = [];
    end
    if nargin < 3
        s = [];
    end

    if size(h,2)==1
        h = padarray(h, [0 1], 1/100, 'post');
    end

    if size(s,2)==1
        s = padarray(s, [0 1], 1/100, 'post');
    end

    if isempty(h)
        v_of_h = ones(size(hsv,1), size(hsv,2));
    else
        v_of_h = WeightFunction( hsv(:,:,1), h(:,1), h(:,2));
    end

    if isempty(s)
        v_of_s = ones(size(hsv,1), size(hsv,2));
    else
        v_of_s = WeightFunctionOnce( hsv(:,:,2), s(:,1), s(:,2));
    end

    outhsv = hsv;
    outhsv(:,:,3) = hsv(:,:,3) .* v_of_h .* v_of_s;

end

