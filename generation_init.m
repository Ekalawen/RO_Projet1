function [ premiere_gen ] = generation_init( nb_edt )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Générer une matrice de nb_edt colonnes contenant uniquement des 0
% et des 1, qui représente nb_edt edt 

premiere_gen = (randi(2, 320, nb_edt)) - 1;
end

