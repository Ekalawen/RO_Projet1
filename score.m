function [ scores ] = score( generation_edt )

% generation_edt est l'ensemble des edt juxtaposés en colonne dans une
% matrice
% scores est le vecteur contenant le score relatif aux contraintes pour
% tous les edt

poids = 10; % la pondératoin d'une contrainte par rapport aux autres contraintes

% on l'initialise
scores = zeros(size(generation_edt,2),1)';

% pour chaque contrainte, on va ajouter son score au score total
scores = scores + score_contrainte1(generation_edt)*poids ;%poids faible (0-5)
scores = scores + score_contrainte2(generation_edt)*poids; %poids faible (0-5)
scores = scores + score_contrainte3(generation_edt)*poids; %poids moyen (10-15)
scores = scores + score_contrainte4(generation_edt)*poids; %poids moyen (15-20)
scores = scores + score_contrainte5(generation_edt)*poids; %poids moyen (15-20)
scores = scores + score_contrainte6(generation_edt)*poids;
scores = scores + score_contrainte7(generation_edt)*poids;
scores = scores + score_contrainte8(generation_edt)*poids;
scores = scores + score_contrainte9(generation_edt)*poids;
scores = scores + score_contrainte10(generation_edt)*poids;
scores = scores + score_contrainte11(generation_edt)*poids*10;
scores = scores + score_contrainte12(generation_edt);
scores = scores + score_contrainte13(generation_edt);
scores = scores + score_contrainte14(generation_edt);
scores = scores + score_contrainte15(generation_edt);
scores = scores + score_contrainte16(generation_edt);


end

