function [  ] = creer_deux_edt(ind_maman, ind_papa, generation_edt, ind_fils, ind_fille)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i=1:size(generation_edt,2)
    choix_gene=randi(2);
    %papa
    if choix_gene=1
        generation_edt(i,ind_fils) = generation_edt(i,ind_papa);

end

