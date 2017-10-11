function [ V ] = run_algorithme(choix, A, B, C)
% Cette fonction s'occupe de lancer l'algorithme choisi avec choix
% Les matrices A et B sont les contraintes de notre problème
% Elle retourne l'emploi du temps en vecteur nommé V

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

% La taille voulu de notre vecteur
n = p * c * d * t;

switch choix
    case 1
        % On utilise les fonctions implantés dans matlab
        disp("Algorithme Matlab (IntLinpProg)\n");
        [intcon, Aintlinprog, Bintlinprog, Aeq, beq, lb, ub] = CreationParamIntlinprog();
        V = intlinprog(C, intcon, Aintlinprog, Bintlinprog, Aeq, beq, lb, ub);
    case 2
        disp("Algorithme Génétique (un peu lent car échantillons de tailles importantes)");
        echantillon_taille = 400;
        V = genetique(echantillon_taille);
        % V est un vecteur de taille n
    case 3
        disp("Algorithme de Gomory");
        [V, f] = gomory(1, C, A, B, 1, n);
        % V est un vecteur de taille supérieur à n
    case 4
        % On a pas besoin d'envoyer les matrices pour ce solveur là
        % car il faut rentrer les équations à la main
        disp("Algorithme GLP");
        X = glpsol();
        % glpsol renvoie une matrice 3D mais on veut un vecteur, donc on le
        % convertit 
        V = CreationV(X);
    otherwise
        disp("Cet algorithme n'existe pas !");
end

% Si V est trop grand, on garde juste la partie qui nous intéresse
V = V(1:n);

return
end

