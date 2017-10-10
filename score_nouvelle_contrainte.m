function [ nouveau_score ] = score_nouvelle_contrainte( generation_edt )
% Calcul le score correspondant au fait que les étudiant de la promo 1 ont
% 18 cours en tout par semaine et les étudiants de la promo 2 ont 17 cours
% par semaine

nouveau_score = abs(sum(generation_edt) - 35);
end

