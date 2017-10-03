function [ scores2 ] = score_contrainte2( generation_edt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
scores2 = generation_edt(121,:) + generation_edt(122,:) + 
    generation_edt(141,:) + generation_edt(142,:);

end

