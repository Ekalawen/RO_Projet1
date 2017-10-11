function [ scores13 ] = score_contrainte13( generation_edt )

%voir le rapport, contrainte 13
scores13 = zeros(size(generation_edt,2),1)';

for i=1: 20 : 301
    scores13 = scores13 + generation_edt(i,:);

end
scores13;
