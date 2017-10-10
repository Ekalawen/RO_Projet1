%% Algorithme de résolution d'un problème linéaire en variables entières
%% Avec la méthode des coupes de Gomory

function [x,F] = gomory(OPT,c,A,b,nbIteration,nbVariables)

%[x,F,GAMMA] = simplexe_gomory(OPT,c,A,b); % min => OPT=-1

n=size(A,1); % Nombre de linges de GAMMA
m=size(A,2); % Nombre de colonnes de GAMMA

A1 = A(1:n-(m-nbVar),1:nbVar);
A2 = A(n-(m-nbVar):m,1:nbVar);

b1 = b(1:n-(m-nbVar));
b2 = b(m-(m-nbVar):m);
x = linprog(c,A2,b2,A1,b1);

n=size(A,1); % Nombre de linges de GAMMA
m=size(A,2); % Nombre de colonnes de GAMMA

if (nbIteration == 1000)
    disp('Impossible de trouver une solution entière')
    return
end

if ~(F - floor(F)<10^-10 & size(find((x-floor(x))<10^-6)) == 0)
    % déterminer le plus grande partie fractionnaire parmi les composantes
    % de B
    [~,ind] = max(GAMMA(:,m)-floor(GAMMA(:,m))); 

    % Ajouter la nouvelle contrainte
    L = zeros(1,m);
    L(1,:) = GAMMA(ind,1:m) - floor(GAMMA(ind,1:m));

    A = [A;L];
    
    % Modifier b, ajouter une linge
    b = [b;GAMMA(ind,m+1) - floor(GAMMA(ind,m+1))];
   
    % Ajouter la colonne de la nouvelle variables d'écart 
    C = zeros(n+1,1);
    C(n+1) = 1;
    A = [A,C];

    % Mise à jour de la fonction à maximiser / minimiser
    c=[c;0];
    
    % Projetter la matrice A dans la base des variables différentes des
    % variables d'écarts
    for i = 1:n
        coeff = A(n+1,nbVariables+i);
        A(n+1,:) = A(n+1,:) - coeff*A(i,:);
    end

    [x,F] = gomory(OPT,c,A,b,nbIteration+1,nbVariables);
    
end

return 

end