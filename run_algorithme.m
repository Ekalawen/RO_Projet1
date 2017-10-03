function [ X ] = untitled6(choix, A, B)
% Cette fonction s'occupe de lancer l'algorithme choisi avec choix
% Les matrices A et B sont les contraintes de notre problème
% Elle retourne l'emploi du temps en 3D nommé X

switch choix
    case 1
        disp("Algorithme de Gomory\n");
        X = algorithme_Gomory(A, B);
    case 2
        disp("Algorithme par Séparations et Évaluations\n");
        X = algorithme_Gomory(A, B);
    case 3
        disp("Algorithme Génétique\n");
        X = algorithme_Gomory(A, B);
    otherwise
        disp("Cet algorithme n'existe pas !");
end

return
end

