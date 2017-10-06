%% Fonction qui permet de créer la matrice A, le vecteur b et le vecteur c
%  A étant la matrice des contraintes d'égalité et d'inégalités
%  b étant le vecteur associé à la matrice A dans Ax = b
%  C étant le vecteur associé à la fonction coût dans min (c'x)


function[intcon, A, b ,Aeq, beq, lb, ub] = CreationParamIntlinprog()

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

n = 20;  % nombre de contraintes d'égalités
m = 280; % nombre de contraintes d'inégalités

%% intcon est le vecteur indiquant si les indices des x(i,j,k) sont entiers ;
% ici, ils le sont tous
for i = 1:p*d*c*t
    intcon(i) = i;
end


%% lb est un vecteur comprtant les bornes inférieurs des x(i,j,k) ; tel que pour tout i, V(i) >= lb(i) = 0
lb = zeros(1,p*d*c*t);


%% ub est un vecteur comprtant les bornes supérieurs des x(i,j,k) ; tel que pour tout i,  V(i) <= lb(i) = 1
ub = ones(1,p*d*c*t);


%% Création de Aeq et beq associés aux contraintes d'égalités (20 contraintes d'égalités)
Aeq = zeros(n,p*d*c*t);

%% Contrainte 1 - Le prof numéro 2 n'a pas cours le mercredi

Aeq(1, indX2indV(2,1,9) : indX2indV(2,1,12)) = 1;

Aeq(1, indX2indV(2,2,9) : indX2indV(2,2,12)) = 1;

beq(1) = 0;

%% Contraintes 2 - Le prof 4 n'a pas cours le lundi matin

Aeq(2, indX2indV(4,1,1) : indX2indV(4,1,2)) = 1;

Aeq(2, indX2indV(4,2,1) : indX2indV(4,2,2)) = 1;

beq(2) = 0;

%% Contrainte 3 - Le prof 1 donne trois cours à la promo 1

Aeq(3, indX2indV(1,1,1) : indX2indV(1,1,d * t)) = 1;

beq(3) = 3;

%% Contrainte 3 bis - Le prof 1 donne trois cours à la promo 2

Aeq(4, indX2indV(1,2,1) : indX2indV(1,2,d * t)) = 1;

beq(4) = 3;

%% Contrainte 4 - Le prof 2 donne trois cours à la promo 1

Aeq(5, indX2indV(2,1,1) : indX2indV(2,1,d * t)) = 1;

beq(5) = 3;


%% Contrainte 4 bis - Le prof 2 donne 3 cours à la promo 2

Aeq(6, indX2indV(2,2,1) : indX2indV(2,2,d * t)) = 1;

beq(6) = 3;

%% Contrainte 5 - Le prof 3 donne 5 cours à la promo 1

Aeq(7, indX2indV(3,1,1) : indX2indV(3,1,d * t)) = 1;

beq(7) = 5;

%% Contrainte 5 bis - Le prof 3 donne 0 cours à la promo 2

Aeq(8, indX2indV(3,2,1) : indX2indV(3,2,d * t)) = 1;

beq(8) = 0;

%% Contrainte 6 - Le prof 4 donne 0 cours à la promo 1

Aeq(9, indX2indV(4,1,1) : indX2indV(4,1,d * t)) = 1;

beq(9) = 0;

%% Contrainte 6 bis - Le prof 4 donne 4 cours à la promo 2

Aeq(10, indX2indV(4,2,1) : indX2indV(4,2,d * t)) = 1;

beq(10) = 4;

%% Contrainte 7 - Le prof 5 donne 0 cours à la promo 1

Aeq(11, indX2indV(5,1,1) : indX2indV(5,1,d * t)) = 1;

beq(11) = 0;

%% Contrainte 7 bis - Le prof 5 donne 6 cours à la promo 2

Aeq(12, indX2indV(5,2,1) : indX2indV(5,2,d * t)) = 1;

beq(12) = 6;

%% Contrainte 8 - Le prof 6 donne 6 cours à la promo 1

Aeq(13, indX2indV(6,1,1) : indX2indV(6,1,d * t)) = 1;

beq(13) = 6;

%% Contrainte 8 bis - Le prof 6 donne 0 cours à la promo 2

Aeq(14, indX2indV(6,2,1) : indX2indV(6,2,d * t)) = 1;

beq(14) = 0;

%% Contrainte 9 - Le prof 7 donne 1 cours à la promo 1 au créneau 15

Aeq(15,indX2indV(7,1,15)) = 1;

beq(15) = 1;

%% Contrainte 9 bis - Le prof 7 donne 0 cours à la promo 2 

Aeq(16, indX2indV(7,2,1) : indX2indV(7,2,d * t)) = 1;

beq(16) = 0;

%% Contrainte 10 - Le prof 8 donne 0 cours à la promo 1

Aeq(17, indX2indV(8,1,1) : indX2indV(8,1,d * t)) = 1;

beq(17) = 0;

%% Contrainte 10 bis - Le prof 8 donne 1 cours à la promo 2 au créneau 15

Aeq(18,indX2indV(8,2,15)) = 1;

beq(18) = 1;

%% Contrainte 11 - Les profs 7 et 8 n'ont aucun cours en dehors du créneau 15

for i=7:8
    for j=1:c
        for k=1:14
            Aeq(19,indX2indV(i,j,k)) = 1;
        end
        for k=16:(d * t)
            Aeq(19,indX2indV(i,j,k)) = 1;
        end
    end
end

beq(19) = 0;

%% Contrainte 12 - Aucune promo n'a cours en créneau 1

for i=1:p
    for j=1:c
        Aeq(20, indX2indV(i,j,1)) = 1;
    end
end

beq(20) = 0;


%% Création de A et b associés aux contraintes d'inégalités (280 contraintes d'inégalités)
A = zeros(m,p*d*c*t);

%% Contrainte 13 - Une promo ne doit pas avoir deux fois le même cours dans la même journée sauf en informatique

for i=1:4
    for j=1:c
        for l=1:d
            A(10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(10 * (i - 1) + 5 * (j - 1) + l) = 1; 
        end
    end
end

for i=7:8
    for j=1:c
        for l=1:d
            A(10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(10 * (i - 1) + 5 * (j - 1) + l) = 1; 
        end
    end
end

%% Contrainte 13 bis - Une promo peut avoir jusqu'à deux fois un cours d'informatique dans la même journée

for i=5:6
    for j=1:c
        for l=1:d
            A(10 * (i - 1) + 5 * (j - 1) + l,indX2indV(i,j,((l - 1) * t + 1)):indX2indV(i,j,(l * t))) = 1;
            b(10 * (i - 1) + 5 * (j - 1) + l) = 2; 
        end
    end
end

%% Contrainte 14 - Une promo ne peut suivre qu'un seul cours à la fois

for j = 1:c
    for k = 1:(d * t)
        for i = 1:p
            A(80 + 20 * (j - 1) + k,indX2indV(i,j,k)) = 1;
        end
        b(80 + 20 * (j - 1) + k) = 1;
    end
end

%% Contrainte 15 - Un prof ne peut donner qu'un cours à la fois

for i = 1:p
    for k = 1:(d * t)
        for j =1:c
            A(120 + 20 * (i - 1) + k,indX2indV(i,j,k)) = 1;
        end
        b(120 + 20 * (i - 1) + k) = 1;
    end
end

return

end







