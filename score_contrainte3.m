function [ scores3 ] = score_contrainte3( generation_edt )
%voir le rapport, contrainte 3

scores3 = abs(sum(generation_edt(1:20,:))-3) + abs(sum(generation_edt(21:40)) -3);

end