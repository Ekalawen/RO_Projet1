function [ scores12 ] = score_contrainte12( generation_edt )

%voir le rapport, contrainte 12
scores12 = zeros(size(generation_edt,2),1)';

for i=1: 20 : 301
    scores12 = scores12 + generation_edt(i,:);

end
scores12;
