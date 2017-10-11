function[C] = getC(tailleMax)
%  C étant le vecteur associé à la fonction coût dans min (c'x)
% tailleMax est un paramètre facultatif qui permet de compléter le vecteur C
% avec des 0 si on veut la taille de C supérieure au nombre de variables (320)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

n = p * c * t *d;

% On veut un vecteur colonne de taille n qui alterne en boucle les valeurs
% 1001 1001 etc ... pour donner du poids uniquement aux créneaux en
% extrémité de journée
C = [];
for i=1:n
    if (mod((i-1), 4) == 0 || mod((i-1), 4) == 3)
        C = [C ; 1];
    else
        C = [C ; 0];
    end
end

% On complète avec des 0 pour les cases qui ont étés rajoutés !
if exist('tailleMax', 'var')
    for i=n+1:tailleMax
        C = [C ; 0];
    end
end

return;