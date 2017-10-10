function [ choix ] = choix_algorithme()
% Permet à l'utilisateur de choisir l'algorithme de résolution à utiliser !
message = 'Choisissez votre algorithme de résolution : \n(1) Algorithme Matlab (intlinprog)\n(2) Algorithme Génétique (utilisant de la Métaheuristique)\n(3) Algorithme des Coupes de Gomory\n\nVotre Choix : ';
choix = 0;
while (choix < 1) | (choix > 3)
    choix = input(message);
end

return
end

