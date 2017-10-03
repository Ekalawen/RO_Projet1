function [ scores13 ] = score_contrainte13( generation_edt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

scores13 = zeros(size(generation_edt,2));

for i=1: 20 : 301
    scores13 = scores13 + generation_edt(i,:);

end

