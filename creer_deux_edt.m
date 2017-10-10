function [ nouvelle_generation_edt] = creer_deux_edt(ind_maman, ind_papa, generation_edt, ind_fils, ind_fille)

for i=1:size(generation_edt,1)
    choix_gene1=randi(2);
    choix_gene2=randi(2);
    %papa donne au fils
    if choix_gene1 == 1
        generation_edt(i,ind_fils) = generation_edt(i,ind_papa);
    else
    %maman donne au fils
        generation_edt(i,ind_fils) = generation_edt(i,ind_maman);
    end 
    
    if choix_gene2 == 1
    %maman donne a la fille
        generation_edt(i,ind_fille) = generation_edt(i,ind_maman);
    else
    %papa donne à la fille
        generation_edt(i,ind_fille) = generation_edt(i,ind_papa);
    end

    
%     disp('papa');
%     generation_edt(:,ind_papa)
%     disp('fils');
%     generation_edt(:,ind_fils)

    nouvelle_generation_edt = generation_edt;

end

