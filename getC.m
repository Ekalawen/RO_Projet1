function[C] = getC(tailleMax)

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

n = p * c * t *d;

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