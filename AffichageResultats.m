function [] = AffichageResultats(Promo1, Promo2 )
% Cette fonction permet d'afficher les emplois du temps des 2 promos

% On affiche la première promo
Promo = Promo1;
AffichagePromo();

% On affiche la première promo
Promo = Promo2;
figure;
AffichagePromo();

end

