function [ scores11 ] = score_contrainte11( generation_edt )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

scores11 = generation_edt(241:254,:) + generation_edt(256:274,:)
+ generation_edt(276:294,:) + generation_edt(296:314,:)
+ generation_edt(316:320,:);

end

