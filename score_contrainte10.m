function [ scores10 ] = score_contrainte10( generation_edt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

scores10 = sum(generation_edt(281:300,:)) + abs(generation_edt(315) - 1);

end
