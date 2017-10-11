function [ resultat ] = fonction_cout_3D(X)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

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
for i=1:size(X, 1) % pour chaque prof
    for j=1:size(X, 2) % pour chaque promo
        for k=1:size(X, 3) % pour chaque créneau
            V = [V ; X(i, j, k)];
        end
    end
end

% Calcul de du vecteur C de taille n * 1
% Ce vecteur vaut 1 lorsque un triplet prof/classe/créneau correspondant à
% son indice compte dans la fonction de minimisation. Donc lorsque il
% s'agit d'un créneau d'extrémités de journée.
% C ressemblera à ça C = [1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0 ; 1 ...]
C = getC(size(V));

% Il ne reste plus qu'à faire le produit matriciel !
resultat = C' * V ;

return

