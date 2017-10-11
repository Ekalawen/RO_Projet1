function [ premiere_gen ] = generation_init(nb_edt)

% Générer une matrice de nb_edt colonnes contenant uniquement des 0
% et des 1, qui représente nb_edt edt

premiere_gen = (rand(320, nb_edt));
premiere_gen(premiere_gen >= 35/320) = 0;
premiere_gen(premiere_gen < 35/320) = 1;
disp(premiere_gen);
size(premiere_gen);

end

