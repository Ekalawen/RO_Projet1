function [ promo1, promo2 ] = getEdtPromos(X)

% X est la matrice de l'emploi du temps en 3D

% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

promo1 = zeros(t, d); % initialiser promo
promo2 = promo1;      % idem

promo1(1, 1) = 9; % partiel le lundi matin
promo2(1, 1) = 9; % idem

for j=1:c % pour toutes les promos
    for k=1:d*t % pour tous les créneaux
        for i=1:p % pour tous les profs
            if(X(i, j, k) == 1)
                jour = ceil(k / t) ; % jour du cours <=> colonne promo (ceil = partie entière sup) 
                heure = mod(k, t);   % créneau sur la journée du cours <=> ligne promo
                if heure == 0        % si heure == 0 <=> dernière ligne promo
                    heure = t;
                end
                if j == 1
                    promo1(heure,jour) = i;
                else
                    promo2(heure,jour) = i;
                end
            end
        end
    end
end

return
end

