function [ x ] = CreationX(V)

% Les variables p, c, d et t sont globales et définies dans le main

% Cette fonction transforme le vecteur V sous forme de matrice 3D x
for i=1:p
    for j=1:c
        for k =1:d*t
            x(i,j,k) = V(indX2indV(i,j,k));
        end
    end
end