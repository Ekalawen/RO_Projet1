function [ x ] = CreationX(V)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

% Cette fonction transforme le vecteur V sous forme de matrice 3D x

% pour chaque case de la matrice 3D X
for i=1:p
    for j=1:c
        for k =1:d*t
            % on récupère la valeur correspondante dans le veteur V
            x(i,j,k) = V(indX2indV(i,j,k));
        end
    end
end