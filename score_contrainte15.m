function [ scores15] = score_contrainte15( generation_edt )

scores15 = zeros(size(generation_edt,2));

for i = 1:8 
    for k = 1:20
        scores15 = sum(generation_edt(indX2indV(i,1,k),:)); 
    end
end
scores15(scores15 <=1) = 0;
end