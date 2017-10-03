function [ scores9 ] = score_contrainte9( generation_edt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

scores9 = sum(generation_edt(261:280,:)) + abs(generation_edt(255) - 1);

end
