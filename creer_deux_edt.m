
function [fils,fille ] = creer_deux_edt(ind_maman, ind_papa, generation_edt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

chance_mutation = 0.1; %chance qu'un edt mute de maniere aléatoire
fils = zeros(size(generation_edt,1),1);
fille = zeros(size(generation_edt,1),1);
for i=1:size(generation_edt,1)
    choix_gene1=randi(2);
    choix_gene2=randi(2);
    %papa donne au fils
    if choix_gene1 == 1
        fils(i) = generation_edt(i,ind_papa);
    else
    %maman donne au fils
        fils(i) = generation_edt(i,ind_maman);
    end 
    
    if choix_gene2 == 1
    %maman donne a la fille
        fille(i) = generation_edt(i,ind_maman);
    else
    %papa donne à la fille
        fille(i) = generation_edt(i,ind_papa);
    end
    
    %mutation
    proba = rand();
    if proba<=chance_mutation

        %choix du gene à muter

        %modifier cette valeur de l'edt fils (seul le fils mute)
        if fils(i) == 0
            fils(i) = 1;
        else
            fils(i) = 0;

        end
    end
    
%     disp('papa');
%     generation_edt(:,ind_papa)
%     disp('fils');
%     generation_edt(:,ind_fils)


end

