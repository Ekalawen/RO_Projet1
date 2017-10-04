
% Main
% Programme de lancement du projet de l'Emploi du Temps

% Récupération des données du problème    
    % Les données unitaires qui seront globales
        % le nombre de profs
        global p;
        p = 8;
        % le nombre de classes
        global c;
        c = 2;
        % le nombre de jours dans la semaine
        global d;
        d = 5;
        % le nombre de créneaux par jours
        global t;
        t = 4;
        
    % La matrice des contraintes A    
    % Le vecteur des seconds membres B
    % Le vecteur de la fonction coût C
    [A, B, C] = CreationABC();
    

% Choix de l'algorithme
% choix = 1 => Coupes de Gomory
% choix = 2 => Séparations et Évaluations
% choix = 3 => Algorithme Génétique
choix = choix_algorithme();

% Lancement de l'algorithme
% Récupération du vecteur de l'emploi du temps
V = run_algorithme(choix, A, B, C);

% On convertit notre vecteur colonne en notre matrice en 3D
X = CreationX(V);

% Extraction des emplois du temps des promos 1 et 2
[Promo1, Promo2] = getEdtPromos(X);

% Affichage des résultats des promos 1 et 2
AffichageResultats(Promo1, Promo2);





