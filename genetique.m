% Méthode génétique 

%Generation aléatoire de la population d'emplois du temps
nb_edt = 20;
premiere_gen = generation_init( nb_edt );
trouve = false;
NB_MAX_ITER = 100;
iter = 1;

while (~trouve &&  iter <= NB_MAX_ITER)
    
    %Calculer le score de chaque vecteur edt
    %Calculer le score de chaque contraintes edt
    scores = score(generation_edt * 100) + apply(generation_edt,2,fonction_cout_vect);
    
    %Selectionner les meilleurs vecteurs
    [scores_tries, ind_tri] = sort(scores);
    
    indices_choisis=ind_tri(1:nb_edt/2);
    indices_non_choisis=ind_tri((nb_edt/2)+1:nb_edt);
    %Melanger les indices pour créer des paires aléatoires parmis les
    %meilleurs edt
    indices_choisis(randperm(length(indices_choisis));
    
    %Créer nb_edt/4 paires d'edt
    for i=1:2:(nb_edt/4)
        creer_deux_edt(indices_choisis(i), indices_choisis(i+1), generation_edt, indices_non_choisis(i), indices_non_choisis(i+1));
        
    
    
end 