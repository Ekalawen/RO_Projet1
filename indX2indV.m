function [ ind_V ] = indX2indV(i, j, k)
% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

% i est l'indice du prof
% j est l'indice de la promo
% k est l'indice du créneau

% On vérifie que les indices i, j, k sont bien contenus dans la matrice X
if i<=p & j<=c & k<=d*t
    % On convertit
    ind_V = (d*t*c) * (i-1) + (d*t) * (j-1) + k;
else
    disp("prof (i), promo (j), créneau (k) inexistant dans indX2indV(i,j,k)");
end

return
end

