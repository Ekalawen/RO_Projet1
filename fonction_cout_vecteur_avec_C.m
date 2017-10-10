function [ resultat ] = fonction_cout_vecteur_avec_C(V, C)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

% Cette fonction renvoie le scalaire de l'évaluation du cout de V
% V est une vecteur de taille p * c * (t * d) ou supérieure
% p est le nombre de profs
% c le nombres de classes
% t le nombre de créneaux par jours
% d le nombre de jours

% n est la taille utile de V sur laquelle seront effectués les calculs
n = p * c * t *d;

% Il ne reste plus qu'à faire le produit matriciel !
resultat = C' * V ;
return

end

