function [ resultat ] = fonction_cout_vecteur(V)

% Les variables p, c, d et t sont globales et définies dans le main

% Cette fonction renvoie le scalaire de l'évaluation du cout de V
% V est une vecteur de taille p * c * (t * d) ou supérieure
% p est le nombre de profs
% c le nombres de classes
% t le nombre de créneaux par jours
% d le nombre de jours

% n est la taille utile de V sur laquelle seront effectués les calculs
n = p * c * t *d;

% Calcul du vecteur C de taille n * 1
% Ce vecteur vaut 1 lorsque un triplet prof/classe/créneau correspondant à
% son indice compte dans la fonction de minimisation. Donc lorsque il
% s'agit d'un créneau d'extrémités de journée.
% C ressemblera à ça C = [1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0 ; 1 ...]

% TODO
% C = getC();

C = [];
for i=1:n
    if (mod((i-1), 4) == 0 || mod((i-1), 4) == 3)
        C = [C ; 1];
    else
        C = [C ; 0];
    end
end
% On complète avec des 0 pour les cases qui ont étés rajoutés !
for i=n+1:size(V)
    C = [C ; 0];
end
C

resultat = C' * V ;
return

end

