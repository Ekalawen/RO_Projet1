function [ promo1, promo2 ] = getEdtPromos(X, p, c, t, d)

promo1 = zeros(t, d); % initialiser promo
promo2 = promo1;      % idem

promo1(1, 1) = 9; % partiel le lundi matin
promo2(1, 1) = 9; % idem

for j=1:c
    for k=1:d*t
        for i=1:p
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

