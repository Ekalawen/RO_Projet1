function [ scores4 ] = score_contrainte4( generation_edt )

%voir le rapport, contrainte 4
scores4 = abs(sum(generation_edt(41:60,:))-3) + abs(sum(generation_edt(61:80,:)) -3);

end