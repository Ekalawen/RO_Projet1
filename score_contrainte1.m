function [ scores1 ] = score_contrainte1( generation_edt )

% Les variables p, c, d et t sont globales et définies dans le main

%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
scores1 = generation_edt(49,:) + generation_edt(50,:) + generation_edt(51,:) 
        + generation_edt(52,:) + generation_edt(69,:) + generation_edt(70,:)
        + generation_edt(71,:) + generation_edt(72,:);


end

