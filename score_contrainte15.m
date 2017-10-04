function [ scores15] = score_contrainte15( generation_edt )

scores15 = zeros(size(generation_edt,2),1)';
cours_prof = zeros(8,1);
cours = 0;
for i = 1:8 
    cours = 0;
    for k = 1:20
        for c = 1:2
            cours = cours + generation_edt(indX2indV(i,c,k),:);
        end
    end
    cours_prof(i) = cours;
    cours_prof(cours_prof <=1) = 0;

end
scores15 = sum(cours
end