%% Fonction qui permet de créer la matrice A, le vecteur b et le vecteur c
%  A étant la matrice des contraintes d'égalité et d'inégalités
%  b étant le vecteur associé à la matrice A dans Ax = b
%  C étant le vecteur associé à la fonction coût dans min (c'x)


function[A, b] = CreationAB()
% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

n = 300; % nombre de lignes de la matrice ie le nombre de contraintes total
m = 600;  % nombre de colonnes de la matrice ie le nombre de variables
[~, Ailp, bilp ,Aeq, beq, ~, ~] = CreationParamIntlinprog();

A = [[Aeq,zeros(20,600-p*d*t*c)];[Ailp,eye(600-p*d*t*c)]];
b = [beq,bilp];