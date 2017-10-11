

function [fils,fille ] = creer_deux_edt(ind_maman, ind_papa, generation_edt)
% generation_edt est l'ensemble des edt mis cote à cote en colonne
% ind_maman est l'indice de l'emploi du temps mère dans generation_edt
% ind_papa est l'indice de l'emploi du temps père dans generation_edt
% fils est le premier edt généré par le père et la mère
% fille est le deuxième

% On initialise la taille du fils et de la fille
fils = zeros(size(generation_edt,1),1);
fille = zeros(size(generation_edt,1),1);

% pour chaque gène d'un edt, on va choisir si les enfants héritent du père ou
% de la mère
for i=1:size(generation_edt,1)
    % on choisit si le gène vient du père ou de la mère
    choix_gene_fils = randi(2); % 1 est le père 2 la mère
    choix_gene_fille = randi(2); % idem
    
    %papa donne au fils
    if choix_gene_fils == 1
        fils(i) = generation_edt(i,ind_papa);
    else
    %maman donne au fils
        fils(i) = generation_edt(i,ind_maman);
    end 
    
    if choix_gene_fille == 1
    %maman donne a la fille
        fille(i) = generation_edt(i,ind_maman);
    else
    %papa donne à la fille
        fille(i) = generation_edt(i,ind_papa);
    end
end

