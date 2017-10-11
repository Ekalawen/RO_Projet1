function [ V ] = CreationV(x)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

% Cette fonction transforme une matrice 3D x sous forme de vecteur V

% pour chaque indice de notre vecteur colonne V
for u = 1:size(x,1)*size(x,2)*size(x,3)
    % on va récupérer l'indice correspondant dans la matrice 3D X
    [i,j,k] = indV2indX(u);
    V(u) = x(i,j,k);
end

end