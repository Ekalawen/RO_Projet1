function [i, j, k] = indV2indX(indV, p, c, t, d)

% Bonjour je suis la fonction non commenté que tu n'arriveras jamais à
% débugger si jamais elle plante <3

% calcul le créneau
k = mod(indV, t*d);
if k == 0
    k = t*d;
end

% calcul la classe
j = mod(indV - k, c*t*d);
j = j / (t*d) + 1;

% calcul le prof
i = (indV - k - t*d*(j-1)) / (t*d*c) + 1;

return
end

