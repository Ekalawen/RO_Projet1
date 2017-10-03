%% Fonction qui permet de créer la matrice A, le vecteur b et le vecteur c
%  A étant la matrice des contraintes d'égalité et d'inégalités
%  b étant le vecteur associé à la matrice A dans Ax = b
%  C étant le vecteur associé à la fonction coût dans min (c'x)

function[A, b] = CreationAB()

% d est le nombre de jours
d = 5;
% c est le nombre de promo
c = 2;
% t est le nombre de créneaux par jours
t = 4;
% p est le nombre de profs
p = 8;

n = 300; % nombre de lignes de la matrice ie le nombre de contraintes total
m = 600;  % nombre de colonnes de la matrice ie le nombre de variables

A = zeros (n,m);
b = zeros (1,m);

%% Création de A et b
%% Contrainte 1 - Le prof numéro 2 n'a pas cours le mercredi

A(1, indX2indV(2,1,9) : indX2indV(2,1,12)) = 1;

A(1, indX2indV(2,2,9) : indX2indV(2,2,12)) = 1;

b(1) = 0;

%% Contraintes 2 - Le prof 4 n'a pas cours le lundi matin

A(2, indX2indV(4,1,1) : indX2indV(4,1,2)) = 1;

A(2, indX2indV(4,2,1) : indX2indV(4,2,2)) = 1;

b(2) = 0;

%% Contrainte 3 - Le prof 1 donne trois cours à la promo 1

A(3, indX2indV(1,1,1) : indX2indV(1,1,d * t)) = 1;

b(3) = 3;

%% Contrainte 3 bis - Le prof 1 donne trois cours à la promo 2

A(4, indX2indV(1,2,1) : indX2indV(1,2,d * t)) = 1;

b(4) = 3;

%% Contrainte 4 - Le prof 2 donne trois cours à la promo 1

A(5, indX2indV(2,1,1) : indX2indV(2,1,d * t)) = 1;

b(5) = 3;


%% Contrainte 4 bis - Le prof 2 donne 0 cours à la promo 2

A(6, indX2indV(2,2,1) : indX2indV(2,2,d * t)) = 1;

b(6) = 0;

%% Contrainte 5 - Le prof 3 donne 5 cours à la promo 1

A(7, indX2indV(3,1,1) : indX2indV(3,1,d * t)) = 1;

b(7) = 5;

%% Contrainte 5 bis - Le prof 3 donne 0 cours à la promo 2

A(8, indX2indV(3,2,1) : indX2indV(3,2,d * t)) = 1;

b(8) = 0;

%% Contrainte 6 - Le prof 4 donne 0 cours à la promo 1

A(9, indX2indV(4,1,1) : indX2indV(4,1,d * t)) = 1;

b(9) = 0;

%% Contrainte 6 bis - Le prof 4 donne 4 cours à la promo 2

A(10, indX2indV(4,2,1) : indX2indV(4,2,d * t)) = 1;

b(10) = 4;

%% Contrainte 7 - Le prof 5 donne 0 cours à la promo 1

A(11, indX2indV(5,1,1) : indX2indV(5,1,d * t)) = 1;

b(11) = 0;

%% Contrainte 7 bis - Le prof 5 donne 6 cours à la promo 2

A(12, indX2indV(5,2,1) : indX2indV(5,2,d * t)) = 1;

b(12) = 6;

%% Contrainte 8 - Le prof 6 donne 6 cours à la promo 1

A(13, indX2indV(6,1,1) : indX2indV(6,1,d * t)) = 1;

b(13) = 6;

%% Contrainte 8 bis - Le prof 6 donne 0 cours à la promo 2

A(14, indX2indV(6,2,1) : indX2indV(6,2,d * t)) = 1;

b(14) = 0;

%% Contrainte 9 - Le prof 7 donne 1 cours à la promo 1 au créneau 15

A(15,indX2indV(7,1,15)) = 1;

b(15) = 1;

%% Contrainte 9 bis - Le prof 7 donne 0 cours à la promo 2 

A(16, indX2indV(7,2,1) : indX2indV(7,2,d * t)) = 1;

b(16) = 0;

%% Contrainte 10 - Le prof 8 donne 0 cours à la promo 1

A(17, indX2indV(8,1,1) : indX2indV(8,1,d * t)) = 1;

b(17) = 0;

%% Contrainte 10 bis - Le prof 8 donne 1 cours à la promo 2 au créneau 15

A(18,indX2indV(8,2,15)) = 1;

b(18) = 1;

%% Contrainte 11 - Les profs 7 et 8 n'ont aucun cours en dehors du créneau 15

for i=7:8
    for j=1:c
        for k=1:14
            A(19,indX2indV(i,j,k)) = 1;
        end
        for k=16:(d * t)
            A(19,indX2indV(i,j,k)) = 1;
        end
    end
end

b(19) = 0;

%% Contrainte 12 - Aucune promo n'a cours en créneau 1

for i=1:p
    for j=1:c
        A(20, indX2indV(i,j,1)) = 1;
    end
end

b(20) = 0;

%% Contrainte 13 - Une promo ne doit pas avoir deux fois le même cours dans la même journée sauf en informatique

for i=1:4
    for j=1:c
        for l=1:d
            A(20 + 10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(20 + 10 * (i - 1) + 5 * (j - 1) + l) = 1; 
        end
    end
end

for i=7:8
    for j=1:c
        for l=1:d
            A(60 + 10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(60 + 10 * (i - 1) + 5 * (j - 1) + l) = 1; 
        end
    end
end

%% Contrainte 13 bis - Une promo peut avoir jusqu'à deux fois un cours d'informatique dans la même journée

for i=5:6
    for j=1:c
        for l=1:d
            A(80 + 10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(80 + 10 * (i - 1) + 5 * (j - 1) + l) = 2; 
        end
    end
end

%% Contrainte 14 - Une promo ne peut suivre qu'un seul cours à la fois

for j = 1:c
    for k = 1:(d * t)
        A(100 + 20 * (j - 1) + k,indX2indV(1,j,k):indX2indV(p,j,k)) = 1;
        b(100 + 20 * (j - 1) + k) = 1;
    end
end

%% Contrainte 15 - Un prof ne peut donner qu'un cours à la fois

for i = 1:p
    for k = 1:(d * t)
        A(140 + 20 * (j - 1) + k,indX2indV(i,1,k):indX2indV(i,c,k)) = 1;
        b(140 + 20 * (j - 1) + k) = 1;
    end
end

%%% Rajout de la matrice identité en bas à droite ie ajouter les variables 
%%% d'écart.

A(21:n,321:m) = eye(280);

return

end


            



























