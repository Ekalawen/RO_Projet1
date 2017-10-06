%%Idée prof : générer une population qui respecte les contraintes (tant pis
%%si c'est long, après ça sera super efficace)
%% Autre idée : intégrer des edt qui respectent les contraintes parmi tous ceux générés aléatoirement
%% Ici, l'algo est débuggué en grande partie mais les scores se staibilisent au bout d'un moment
%% autre idée : quand on arrive à une stabilisation des scores, relancer avec une nouvelle famille aléatoire, attendre la stabilisation et puis
%% faire faire des bébés à chaque entre chaque famille
%% Autre idée : générer les edt avec un nombre fixés de 1 (soit de créneaux
%% pris => facile à calculer et aidera grandement les calculs) 35 créneaux


function [ meilleur_enfant ] = genetique( nb_edt )
% Méthode génétique 

    %Generation aléatoire de la population d'emplois du temps
    % nb edt générés aléatoirement au début de l'algo et traités lors de la
    % recherche de solution
    premiere_gen = generation_init( nb_edt );
    trouve = false; %indique si on a trouvé un edt satisfaisant
    NB_MAX_ITER = 100;
    iter = 1;
    generations_stables = 0;
    ancien_score_min = 1000;
    generation_edt = premiere_gen;
 
    while (~trouve &&  iter <= NB_MAX_ITER)
        %Calculer le score de chaque vecteur edt
        scores = score(generation_edt) * 1000
        iter
        
        for p = 1: size(generation_edt,2)
            scores(p) = scores(p)+ fonction_cout_vecteur (generation_edt(:,p));
        end
        %Selectionner les meilleurs vecteurs
        [scores_tries, ind_tri] = sort(scores);
        size(scores_tries);
        
        
        indices_choisis=ind_tri(1:nb_edt/2);
        indices_non_choisis=ind_tri((nb_edt/2)+1:nb_edt);
    
        % Calcul de l'écart entre les scores entre les deux generations
        nouveau_score_min = scores(indices_choisis(1));
        if ancien_score_min == nouveau_score_min
            generations_stables = generations_stables + 1;
        end
        
        % Calcul du score max pour la prochaine iteration
        ancien_score_min = nouveau_score_min;

        if (generations_stables >= NB_MAX_ITER) 
            trouve = true;
        else 
            
            %Melanger les indices pour créer des paires aléatoires parmis les
            %meilleurs edt
            indices_choisis(randperm(length(indices_choisis)));
    
            %Créer nb_edt/4 paires d'edt
            for j=1:2:(nb_edt/2)
                
                %% PROBLEME ! Les enfants ne sont jamais mis dans la matrice (résolu)
               generation_edt = creer_deux_edt(indices_choisis(j), indices_choisis(j+1), generation_edt, indices_non_choisis(j), indices_non_choisis(j+1));
            end
        end
        iter = iter + 1;
    end 
    meilleur_enfant =  generation_edt(:,indices_choisis(1));
    
end