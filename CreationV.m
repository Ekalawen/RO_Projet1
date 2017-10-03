function [ V ] = CreationV(x)

% Les variables p, c, d et t sont globales et définies dans le main

% Cette fonction transforme une matrice 3D x sous forme de vecteur V

for u = 1:size(x,1)*size(x,2)*size(x,3)
    [i,j,k] = indV2indX(u,p,c,t,d);
    V(u) = x(i,j,k);
end

end