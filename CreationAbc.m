%% Fonction qui permet de créer la matrice A, le vecteur b et le vecteur c
%  A étant la matrice des contraintes d'égalité et d'inégalités
%  b étant le vecteur associé à la matrice A dans Ax = b
%  C étant le vecteur associé à la fonction coût dans min (c'x)

function[A, b, C] = CreationAbc()

% Les variables p, c, d et t sont globales et définies dans le main

n = 300; % nombre de lignes de la matrice ie le nombre de contraintes total
m = 600;  % nombre de colonnes de la matrice ie le nombre de variables

A = zeros (n,m);
b = zeros (1,m);
c = zeros (1,m);

%% Création de A et b
%% Contrainte 1 - Le prof numéro 2 n'a pas cours le mercredi

for i=49:72
    A(1,i) = 1;
end

b(1) = 0;

%% Contraintes 2 - Le prof 4 n'a pas cours le lundi matin

A(2,121) = 1;
A(2,122) = 1;
A(2,141) = 1;
A(2,142) = 1;

b(2) = 0;

%% Contrainte 3 - Le prof 1 donne trois cours à la promo 1

for i=1:20
    A(3,i) = 1;
end

b(3) = 3;

%% Contrainte 3 bis - Le prof 1 donne trois cours à la promo 2

for i=21:40
    A(4,i) = 1;
end

b(4) = 3;

%% Contrainte 4 - Le prof 2 donne trois cours à la promo 1

for i=41:60
    A(5,i) = 1;
end

b(5) = 3;


%% Contrainte 4 bis - Le prof 2 donne 0 cours à la promo 2

for i=61:80
    A(6,i) = 1;
end

b(6) = 0;

%% Contrainte 5 - Le prof 3 donne 5 cours à la promo 1

for i=81:100
    A(7,i) = 1;
end

b(7) = 5;

%% Contrainte 5 bis - Le prof 3 donne 0 cours à la promo 2

for i=101:120
    A(8,i) = 1;
end

b(8) = 0;

%% Contrainte 6 - Le prof 4 donne 0 cours à la promo 1

for i=121:140
    A(9,i) = 1;
end

b(9) = 0;

%% Contrainte 6 bis - Le prof 4 donne 4 cours à la promo 2

for i=141:160
    A(10,i) = 1;
end

b(10) = 4;

%% Contrainte 7 - Le prof 5 donne 0 cours à la promo 1

for i=161:180
    A(11,i) = 1;
end

b(11) = 0;

%% Contrainte 7 bis - Le prof 5 donne 6 cours à la promo 2

for i=181:200
    A(12,i) = 1;
end

b(12) = 6;

%% Contrainte 8 - Le prof 6 donne 6 cours à la promo 1

for i=201:220
    A(13,i) = 1;
end

b(13) = 6;

%% Contrainte 8 bis - Le prof 6 donne 0 cours à la promo 2

for i=221:240
    A(14,i) = 1;
end

b(14) = 0;

%% Contrainte 9 - Le prof 7 donne 1 cours à la promo 1

A(15,255) = 1;

b(15) = 1;

%% Contrainte 9 bis - Le prof 7 donne 0 cours à la promo 2

for i=261:280
    A(16,i) = 1;
end

b(16) = 0;

%% Contrainte 10 - Le prof 8 donne 0 cours à la promo 1

for i=281:300
    A(17,i) = 1;
end

b(17) = 0;

%% Contrainte 10 bis - Le prof 8 donne 1 cours à la promo 2

A(18,315) = 1;

b(18) = 1;

%% Contrainte 11 - Les profs 7 et 8 n'ont aucun cours en dehors du créneau 15

for i=241:254
    A(19,i) = 1;
end

for i=256:274
    A(19,i) = 1;
end

for i=276:294
    A(19,i) = 1;
end

for i=296:314
    A(19,i) = 1;
end

for i=316:320
    A(19,i) = 1;
end

b(19) = 0;

%% Contrainte 12 - Aucune promo n'a cours en créneau 1

for i=0:15
    A(20,20*i + 1) = 1;
end

b(20) = 0;

%% Contrainte 13 - Une promo ne doit pas avoir deux fois le même cours dans la même journée sauf en informatique

for i=1:4
    for j=1:c
        for l=1:d
            for k=((l - 1) * t + 1):(l * t)
                A(20 + 10 * (i - 1) + 5 * (j - 1) + l, (40 * (i - 1) + 20 * (j - 1) + k)) = 1; 
                
                b(20 + 10 * (i - 1) + 5 * (j - 1) + l) = 1;
            end
        end
    end
end

for i=7:8
    for j=1:c
        for l=1:d
            for k=((l - 1) * t + 1):(l * t)
                A(20 + 10 * (i - 1) + 5 * (j - 1) + l, (40 * (i - 1) + 20 * (j - 1) + k)) = 1; 
                
                b(20 + 10 * (i - 1) + 5 * (j - 1) + l) = 1;
            end
        end
    end
end

%% Contrainte 13 bis - Une promo peut avoir jusqu'à deux fois un cours d'informatique dans la même journée

for i=5:6
    for j=1:c
        for l=1:d
            for k=((l - 1) * t + 1):(l * t)
                A(80 + 10 * (i - 1) + 5 * (j - 1) + l, (40 * (i - 1) + 20 * (j - 1) + k)) = 1; 
                
                b(80 + 10 * (i - 1) + 5 * (j - 1) + l) = 2;
            end
        end
    end
end

%% Contrainte 14 - Une promo ne peut suivre qu'un seul cours à la fois

for j = 1:c
    for k = 1:(d * t)
        for i = 1:8
            A(100 + 20 * (j - 1) + k, 40 * (i - 1) + 20 * (j - 1) + k) = 1;
            b(100 + 20 * (j - 1) + k) = 1;
        end
    end
end

%% Contrainte 15 - Un prof ne peut donner qu'un cours à la fois

for i = 1:8
    for k = 1:(d * t)
        for j = 1:c
            A(140 + 20 * (j - 1) + k, 40 * (i - 1) + 20 * (j - 1) + k) = 1;
            b(140 + 20 * (j - 1) + k) = 1;
        end
    end
end

%%% Rajout de la matrice identité en bas à droite ie ajouter les variables 
%%% d'écart.

A(21:n,321:m) = eye(280);

%% TODO -> Construire C


            



























