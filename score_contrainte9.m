function [ scores9 ] = score_contrainte9( generation_edt )

%voir le rapport, contrainte 9
scores9 = sum(generation_edt(261:280,:)) + abs(generation_edt(255) - 1);

end
