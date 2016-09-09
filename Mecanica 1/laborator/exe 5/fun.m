function [ y] = fun( x )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
if  x>-2 & x<0;
    y=x.^2
elseif  x>=0 & x<3;
    y=x.^3
elseif x>=3 & x<4;
    y=x.^2+18
else y=0
end

