function [ x ] = CreationX(V, p, c, t, d)
% Cette fonction transforme le vecteur V sous forme de matrice 3D x
for i=1:p
    for j=1:c
        for k =1:d*t
            x(i,j,k) = V(indX2indV(i,j,k));
        end
    end
end