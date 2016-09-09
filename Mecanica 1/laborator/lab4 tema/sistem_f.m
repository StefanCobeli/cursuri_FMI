function [ f] = sistem_f(t,q) 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
f=zeros(2,1); 
date; 
f=[q(2);-g*sin(q(1))/R];

end

