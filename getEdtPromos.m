function [ promo1, promo2 ] = getEdtPromos(X, p, c, t, d)

promo1 = zeros(t, d);
promo2 = promo1;

promo1(1, 1) = 9; % partiel le lundi matin
promo2(1, 1) = 9; % idem

for j=1:c
    for k=1:d*t
        for i=1:p
            if(X(i, j, k) == 1)
                    jour = floor(k / t);
                    heure = mod(k, t);
                    if heure == 0
                        heure = t;
                    end
                if c == 1
                    promo1(t,d) == i;
                else
                    promo2(t,d) == i;
                end
            end
        end
    end
end

return
end

