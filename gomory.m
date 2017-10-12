%% Algorithme de résolution d'un problème linéaire en variables entières
%% Avec la méthode des coupes de Gomory

function [x,F] = gomory(OPT,c,A,b,nbIteration,nbVariables)

%% En entrée
% OPT : 1 si on cherche un maximum
%       -1 si on cherche un minimum
% c : vecteur colonnes des couts de chaque variables dans la fonction à
% optimiser
% A : matrice des contraintes standard (avec les variables d'écarts
% introduites)
% b : vecteur colonne contenant les valeurs attendues pour chaque
% contraintes
% nbIteration : numéro de l'it"ration de gomory en cours, permet de ne pas
% boucler
% nbVariables : nombre de variables effectivement recherchées (sans les
% variables d'écart)
%% En Sortie
% x : vecteur colonne contenant les variables recherchées et les variables
% d'écarts
% F : valeur de l'optimum recherché
%%

% On récupère les tailles de la matrice A
n=size(A,1); % Nombre de linges de GAMMA
m=size(A,2); % Nombre de colonnes de GAMMA

% Ajouter la contrainte x est à valeurs dans {0,1} uniquement à la première
% itération
if (nbIteration == 1)
    % Ajouter les contraintes à A
    lignes = [eye(nbVariables),zeros(nbVariables,m-nbVariables)];
    colonnes = [zeros(n,nbVariables); eye(nbVariables)];
    A = [[A;lignes],colonnes];
    
    % Ajouter les résultats des constraintes dans b
    b = [b;ones(nbVariables,1)];
    
    % Ajouter les poids nuls des nouvelles variables d'écarts dans c
    c = [c;zeros(nbVariables,1)];
end

% On récupère les nouvelles dimensions de A
n=size(A,1); % Nombre de linges de GAMMA
m=size(A,2); % Nombre de colonnes de GAMMA

% Appliquer le simplexe en variables continues
[x,F,GAMMA] = simplexe_gomory(OPT,c,A,b); 

if (nbIteration == 1000)
    disp('Impossible de trouver une solution entière')
    return
end

% On veut F et x entiers
if ~(F - floor(F)<10^-10 & x - floor(x)<10^-10)
    % déterminer le plus grande partie fractionnaire parmi les composantes
    % de B
    [~,ind] = max(GAMMA(:,m)-floor(GAMMA(:,m))); 

    % Ajouter la nouvelle contrainte
    L = zeros(1,m);
    L(1,:) = GAMMA(ind,1:m) - floor(GAMMA(ind,1:m));
    A = [A;L];
    
    % Modifier b, ajouter le résultat attendu de la nouvelle contraine
    b = [b;GAMMA(ind,m+1) - floor(GAMMA(ind,m+1))];
   
    % Ajouter une variable d'écart dans A (intriduire une nouvelle variable
    % d'écart
    C = zeros(n+1,1);
    C(n+1) = 1;
    A = [A,C];

    % Ajouter le poids de la nouvelle variables d'écart dans c
    c=[c;0];
    
    % Projetter la matrice A dans la base des variables différentes des
    % variables d'écarts (obtenir l'iedntité dans la partie droite de A
    for i = 1:n
        coeff = A(n+1,nbVariables+i);
        A(n+1,:) = A(n+1,:) - coeff*A(i,:);
    end

    % Résoudre le nouveau problème linéaire
    [x,F] = gomory(OPT,c,A,b,nbIteration+1,nbVariables);

else
    return
end
   
end