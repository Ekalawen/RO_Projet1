function[C] = getC()

m = 600; % Nombre de variables
C = [];

for i=1:m
    if (mod((i-1), 4) == 0 || mod((i-1), 4) == 3)
        C = [C ; 1];
    else
        C = [C ; 0];
    end
end

return;