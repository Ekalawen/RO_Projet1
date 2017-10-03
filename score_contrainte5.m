function [ scores5 ] = score_contrainte5( generation_edt )

scores5 = abs(sum(generation_edt(81:100,:))-5) + sum(generation_edt(101:120,:));

end