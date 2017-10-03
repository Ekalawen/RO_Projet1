function [ ind_V ] = indX2indV(i, j, k)

if i<=p & j<=c & k<=d*t
    ind_V = 40*(i-1) + 20*(j-1) + k;
    return
else
    disp("prof (i), promo (j), créneau (k) inexistant dans indX2indV(i,j,k)");
end
end

