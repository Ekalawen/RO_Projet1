function [ generation_mutee ] = mutation_generation( generation_non_mutee, indices )

proba_mutation = 0.025; %chances de muter d'un edt;
nombre_max_genes_mutants = 10; %nombre max de genes mutants 

generation_mutee = generation_non_mutee;
for i=1:size(indices)
   p = rand();
   
   %l'edt i va muter
   if p <= proba_mutation
       nb_genes_mutants = randi(nombre_max_genes_mutants+1); %nombre de genes qui vont muter
       %choix des genes qui vont muter
       genes_mutants=randi(320+1,1,nb_genes_mutants);
       
       %changer chaquue gene selectionné pour l'edt i
       for g=1:size(genes_mutants)
           if generation_mutee(genes_mutants(g),indices(i)) == 0
               generation_mutee(genes_mutants(g),indices(i)) = 1;
           else
               generation_mutee(genes_mutants(g),indices(i)) = 0;
           end

       end
   end
   
end

end

