function [ ind_V ] = indX2indV(i, j, k)
% Les variables p, c, d et t sont globales et définies dans le main
global p;
global c;
global d;
global t;

if i<=p & j<=c & k<=d*t
    ind_V = (d*t*c) * (i-1) + (d*t) * (j-1) + k;
    return
else
    disp("prof (i), promo (j), créneau (k) inexistant dans indX2indV(i,j,k)");
end

end

