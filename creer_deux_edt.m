function [  ] = creer_deux_edt(ind_maman, ind_papa, generation_edt, ind_fils, ind_fille)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

chance_mutation = 0.1; %chance qu'un edt mute de maniere aléatoire

for i=1:size(generation_edt,2)
    choix_gene=randi(2);
    %papa donne au fils, maman à la fille
    if choix_gene == 1
        generation_edt(i,ind_fils) = generation_edt(i,ind_papa);
        generation_edt(i,ind_fille) = generation_edt(i,ind_maman);
    %maman donne au fils, papa à la fille
    else
        generation_edt(i,ind_fils) = generation_edt(i,ind_maman);
        generation_edt(i,ind_fille) = generation_edt(i,ind_papa);
    end
    
    %mutation
    proba = rand();
    if proba<=chance_mutation
        %choix du gene à muter
        gene_mute = randi(size(generation_edt(1)));
        %modifier cette valeur de l'edt fils (seul le fils mute)
        if generation_edt(gene_mute,ind_fils) == 0
            generation_edt(gene_mute,ind_fils) = 1;
        else
            generation_edt(i,ind_fils) = 0;
        end
    end

end

