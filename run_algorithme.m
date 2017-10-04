function [ X ] = run_algorithme(choix, A, B, C)
% Cette fonction s'occupe de lancer l'algorithme choisi avec choix
% Les matrices A et B sont les contraintes de notre problème
% Elle retourne l'emploi du temps en 3D nommé X

switch choix
    case 1
        disp("Algorithme de Gomory\n");
        [X, f] = gomory(C, A, B, 1);
    case 2
        disp("Algorithme par Séparations et Évaluations\n");
        X = algorithme_Gomory(A, B);
    case 3
        disp("Algorithme Génétique\n");
        echantillon_taille = 20;
        X = genetique(echantillon_taille);
        % X est un vecteur de taille 320
    otherwise
        disp("Cet algorithme n'existe pas !");
end

return
end

