function [ scores10 ] = score_contrainte10( generation_edt )

%voir le rapport, contrainte 10
scores10 = sum(generation_edt(281:300,:)) + abs(generation_edt(315) - 1);

end
