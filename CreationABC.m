function [A, B, C] = CreationABC()

% On crée AB
[A, B] = CreationAB();

% Puis on crée C
C = getC();
return

end

