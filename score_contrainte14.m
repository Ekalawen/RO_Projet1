function [ scores14 ] = score_contrainte14( generation_edt )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

scores14 = zeros(size(generation_edt,2),1)';

%Pour chaque créneaux de chaque promo
for c=1:40
    %pour chaque professeur
    for p=0:7
        scores14 = scores14 + generation_edt((p+1)*c);
    end
end

%remplacer les créneaux où ,il y a un cours par un score nul
scores14(scores14<=1)=0;

end