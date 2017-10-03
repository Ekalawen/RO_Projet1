function [ ind_V ] = indX2indV(i, j, k)

% Les variables p, c, d et t sont globales et définies dans le main

ind_V = (d*t*c) * (i-1) + (d*t) * (j-1) + k;
return

end

