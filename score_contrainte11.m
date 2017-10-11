function [ scores11 ] = score_contrainte11( generation_edt )

%voir le rapport, contrainte 11
scores11 = sum(generation_edt(241:254,:)) + sum(generation_edt(256:274,:)) + sum(generation_edt(276:294,:)) + sum(generation_edt(296:314,:)) + sum(generation_edt(316:320,:));

end

