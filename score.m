function [ scores ] = score( generation_edt )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
scores = zeros(size(generation_edt,2),1)';
disp('taille scores zero');
size(scores)

scores = scores + score_contrainte1(generation_edt);
scores = scores + score_contrainte2(generation_edt);
scores = scores + score_contrainte3(generation_edt);
scores = scores + score_contrainte4(generation_edt);
scores = scores + score_contrainte5(generation_edt);
scores = scores + score_contrainte6(generation_edt);
scores = scores + score_contrainte7(generation_edt);
scores = scores + score_contrainte8(generation_edt);
scores = scores + score_contrainte9(generation_edt);
scores = scores + score_contrainte10(generation_edt);
scores = scores + score_contrainte11(generation_edt);
scores = scores + score_contrainte12(generation_edt);
scores = scores + score_contrainte13(generation_edt);
scores = scores + score_contrainte14(generation_edt);
scores = scores + score_contrainte15(generation_edt);
scores = scores + score_contrainte16(generation_edt);
disp('score 1');
size(score_contrainte1(generation_edt))
disp('score 2');
size(score_contrainte2(generation_edt))
disp('score 3');
size(score_contrainte3(generation_edt))
disp('score 4');
size(score_contrainte4(generation_edt))
disp('score 5');
size(score_contrainte5(generation_edt))
disp('score 6');
size(score_contrainte6(generation_edt))
disp('score 7');
size(score_contrainte7(generation_edt))
disp('score 8');
size(score_contrainte8(generation_edt))
disp('score 9');
size(score_contrainte9(generation_edt))
disp('score 10');
size(score_contrainte10(generation_edt))
disp('score 11');
size(score_contrainte11(generation_edt))
disp('score 12');
size(score_contrainte12(generation_edt))
disp('score 13');
size(score_contrainte13(generation_edt))
disp('score 14');
size(score_contrainte14(generation_edt))
disp('score 15');
size(score_contrainte15(generation_edt))
disp('score 16');
size(score_contrainte16(generation_edt))
end

