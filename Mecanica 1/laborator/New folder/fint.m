function [Y] = fint(t, X)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Y=zeros(2, 1);
Y(1)=-9*X(1)/sqrt(X(1)^2+X(2)^2) -3;
Y(2)= -9*X(2)/sqrt(X(1)^2+X(2)^2);

end

