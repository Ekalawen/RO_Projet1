function [ scores15] = score_contrainte15( generation_edt )

%voir le rapport, contrainte 15
scores15 = zeros(size(generation_edt,2),1)';
cours_prof = zeros(8,size(generation_edt,2));

for i = 1:8 
    for k = 1:20
        cours = zeros(size(generation_edt,2),1)';

        for c = 1:2
            %nombre de cours qu'un prof a en même temps au créneau k
            %1 * 1000
            cours = cours + generation_edt(indX2indV(i,c,k),:);
        end
        cours_prof(i,:) = cours_prof(i,:) + cours;
        cours_prof(cours_prof <=1) = 0;
    end
    
    
    

end
sum(cours_prof);
scores15 = sum(cours_prof);
end