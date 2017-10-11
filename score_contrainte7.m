function [ scores7 ] = score_contrainte7( generation_edt )

%voir le rapport, contrainte 7
scores7 = abs(sum(generation_edt(161:180,:)) - 6) + sum(generation_edt(181:200,:));

end