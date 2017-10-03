function [ resultat ] = fonction_cout(X, p, c, t, d)
% Cette fonction renvoie le scalaire de l'évaluation du cout de X
% X est une matrice en 3 dimensions de taille p * c * (t * d)
% p est le nombre de profs
% c le nombres de classes
% t le nombre de créneaux par jours
% d le nombre de jours

% Ainsi, les lignes correspondent aux profs
% Et les colonnes correspondent aux classes
% La profondeur constitue les créneaux : le premier étant celui du
% lundi matin et le dernier, le deuxième du vendredi aprem-midi.

% n est le nombre de cases utile de X
n = p * c * t *d;

% On a besoin que X soit sous la forme d'un vecteur de taille (size(X, 1)*size(X, 2)*size(X, 3)) * 1
% On l'appelera donc V :
% On va boucler sur les créneaux en premier, puis sur les classes puis sur
% les profs

V = [];
for i=1:size(X, 1)
    for j=1:size(X, 2)
        for k=1:size(X, 3)
            V = [V ; X(i, j, k)];
        end
    end
end
V
% Calcul de du vecteur C de taille n * 1
% Ce vecteur vaut 1 lorsque un triplet prof/classe/créneau correspondant à
% son indice compte dans la fonction de minimisation. Donc lorsque il
% s'agit d'un créneau d'extrémités de journée.
% C ressemblera à ça C = [1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0 ; 1 ...]

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

