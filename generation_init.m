function [ premiere_gen ] = generation_init(nb_edt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Générer une matrice de nb_edt colonnes contenant uniquement des 0
% et des 1, qui représente nb_edt edt 

premiere_gen = (rand(320, nb_edt));
premiere_gen(premiere_gen < 0.8) = 0;
premiere_gen(premiere_gen >= 0.8) = 1;
disp(premiere_gen);
size(premiere_gen);
end

