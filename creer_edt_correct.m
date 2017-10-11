function [ edt_out ] = creer_edt_correct()

%lundi promo 1
edt_out = zeros(320,1);
edt_out(indX2indV(2,1,2)) = 1;
edt_out(indX2indV(1,1,3)) = 1;
edt_out(indX2indV(5,1,4)) = 1;

%mardi promo 1
edt_out(indX2indV(1,1,5)) = 1;
edt_out(indX2indV(2,1,6)) = 1;
edt_out(indX2indV(5,1,7)) = 1;
edt_out(indX2indV(6,1,8)) = 1;

%mercedi promo 1
edt_out(indX2indV(1,1,9)) = 1;
edt_out(indX2indV(5,1,11)) = 1;
edt_out(indX2indV(6,1,12)) = 1;

%jeudi promo 1
edt_out(indX2indV(6,1,13)) = 1;
edt_out(indX2indV(5,1,14)) = 1;
edt_out(indX2indV(7,1,15)) = 1;
edt_out(indX2indV(6,1,16)) = 1;

%vendredi promo 1
edt_out(indX2indV(5,1,17)) = 1;
edt_out(indX2indV(6,1,18)) = 1;
edt_out(indX2indV(6,1,19)) = 1;
edt_out(indX2indV(2,1,20)) = 1;

%lundi promo 2
edt_out(indX2indV(1,2,2)) = 1;
edt_out(indX2indV(4,2,3)) = 1;
edt_out(indX2indV(6,2,4)) = 1;

%mardi promo 2
edt_out(indX2indV(4,2,5)) = 1;
edt_out(indX2indV(1,2,6)) = 1;
edt_out(indX2indV(6,2,7)) = 1;
edt_out(indX2indV(2,2,8)) = 1;

%mercredi promo 2
edt_out(indX2indV(6,2,9)) = 1;
edt_out(indX2indV(4,2,10)) = 1;
edt_out(indX2indV(6,2,11)) = 1;
edt_out(indX2indV(1,2,12)) = 1;

%jeudi promo 2
edt_out(indX2indV(4,2,13)) = 1;
edt_out(indX2indV(6,2,14)) = 1;
edt_out(indX2indV(8,2,15)) = 1;
edt_out(indX2indV(2,2,16)) = 1;

%vendredi promo 2
edt_out(indX2indV(2,2,17)) = 1;
edt_out(indX2indV(6,2,20)) = 1;

edt_out
end

