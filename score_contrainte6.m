function [ scores6 ] = score_contrainte6( generation_edt )

scores6 = sum(generation_edt(121:140,:)) + abs(sum(generation_edt(141:160,:)) -4);

end