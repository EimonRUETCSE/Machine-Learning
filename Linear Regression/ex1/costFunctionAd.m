function [ J_val,Gradient ] = costFunctionAd( theta )
%COSTFUNCTIONAD Summary of this function goes here
%   Detailed explanation goes here
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:,1)];
hypothesis= X*theta;

J_val=sum(((hypothesis-y).^2))/(2*length(y));



Gradient= X'*((X*theta)-y);


end

