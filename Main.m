
% Main
% Programme de lancement du projet de l'Emploi du Temps

% Récupération des données du problème
    % La matrice des contraintes A    
    % Le vecteur des seconds membres B
    % Le vecteur de la fonction coût
    [A, B, C] = CreationAbc();
    
    % Les données unitaires
        % le nombre de profs
        p = 8;
        % le nombre de classes
        c = 2;
        % le nombre de jours dans la semaine
        d = 5;
        % le nombre de créneaux par jours
        t = 4;
    
% Choix de l'algorithme
% choix = 1 => Coupes de Gomory
% choix = 2 => Séparations et Évaluations
% choix = 3 => Algorithme Génétique
choix = choix_algorithme();

% Lancement de l'algorithme
% Récupération de la matrice en 3D de l'emploi du temps
X = run_algorithme(choix);

% Extraction des emplois du temps des promos 1 et 2
[Promo1, Promo2] = getEdtPromos(X, p, c, t, d);

% Affichage des résultats des promos 1 et 2
AffichageResultats(Promo1, Promo2);





