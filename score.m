function [ scores ] = score( generation_edt )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
scores = zeros(size(generation_edt,2),1)';

scores = scores + score_contrainte1(generation_edt) *10000 ;%poids faible (0-5)
scores = scores + score_contrainte2(generation_edt) * 10000; %poids faible (0-5)
scores = scores + score_contrainte3(generation_edt) *10000; %poids moyen (10-15)
scores = scores + score_contrainte4(generation_edt)*10000; %poids moyen (15-20)
scores = scores + score_contrainte5(generation_edt)*10000; %poids moyen (15-20)
scores = scores + score_contrainte6(generation_edt)*10000;
scores = scores + score_contrainte7(generation_edt)*10000;
scores = scores + score_contrainte8(generation_edt)*10000;
scores = scores + score_contrainte9(generation_edt)*10000;
scores = scores + score_contrainte10(generation_edt)*10000;
scores = scores + score_contrainte11(generation_edt);
scores = scores + score_contrainte12(generation_edt);
scores = scores + score_contrainte13(generation_edt);
scores = scores + score_contrainte14(generation_edt);
scores = scores + score_contrainte15(generation_edt);
scores = scores + score_contrainte16(generation_edt);

end

