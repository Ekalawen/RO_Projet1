function [ scores8 ] = score_contrainte8( generation_edt )

%voir le rapport, contrainte 8
scores8 = sum(generation_edt(221:240,:)) + abs(sum(generation_edt(201:220,:)) - 6);

end

