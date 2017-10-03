function [ scores7 ] = score_contrainte7( generation_edt )

scores7 = abs(sum(generation_edt(161:180,:)) - 6) + sum(generation_edt(181:200,:));

end