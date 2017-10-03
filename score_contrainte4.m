function [ scores4 ] = score_contrainte4( generation_edt )

scores4 = abs(sum(generation_edt(41:60,:))-3) + abs(sum(generation_edt(61:80,:)) -0);

end