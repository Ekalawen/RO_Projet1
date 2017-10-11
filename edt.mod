#modele de l'emploi du temps

#on importe les données externes

param p; #nombre de profs

param c; #nombre de promos

param nbcreneaux; #nombre créneaux

param d; #nombre de jours

param t; #nombre de créneaux par jour


###################################################

#variable x = 1 ssi le prof i fait cours à la promo j durant le créneau k et 0 sinon

var x{i in 1..p, j in 1..c, k in 1..d*t} binary;

###################################################

#objectif

minimize f: sum {i in 1..p, j in 1..c, l in 0..(d-1)} (x[i,j,(l*t)+1] + x[i,j,(l*t)+t]) ;

###################################################

# contraintes

subject to

#1 Le prof 2 n'a pas cours le mercredi

profdeuxmercredi : sum {j in 1..c, k in 9..12} x[2,j,k] = 0;

#2 Le prof 4 n'a pas cours le lundi matin

profquatremercredi : sum {j in 1..c, k in 1..2} x[4,j,k] = 0;

#3 Le prof 1 donne 3 cous à la promo 1 et 3 cours à la promo 2

profuncoursun : sum {k in 1..(d*t)} x[1,1,k] = 3;
profuncoursdeux : sum {k in 1..(d*t)} x[1,2,k] = 3;

#4 Le prof 2 donne 3 cours à la promo 1 et 3 cours à la promo 2

profdeuxcoursun : sum {k in 1..(d*t)} x[2,1,k] = 3;
profdeuxcoursdeux : sum {k in 1..(d*t)} x[2,2,k] = 3;

#5 Le prof 3 donne 5 cours à la promo 1 et aucun à la promo 2

proftroiscoursun : sum {k in 1..(d*t)} x[3,1,k] = 5;
proftroiscoursdeux : sum {k in 1..(d*t)} x[3,2,k] = 0;

#6 Le prof 4 donne 0 cours à la promo 1 et 4 à la promo 2

profquatrecoursun : sum {k in 1..(d*t)} x[4,1,k] = 0;
profquatrecoursdeux : sum {k in 1..(d*t)} x[4,2,k] = 4;

#7 Le prof 5 donne 0 cours à la promo 1 et 6 cours à la promo 2

profcinqcoursun : sum {k in 1..(d*t)} x[5,1,k] = 0;
profcinqcoursdeux : sum {k in 1..(d*t)} x[5,2,k] = 6;

#8 Le prof 6 donne 6 cours à le promo1 et 0 à la promo 2

profsixcoursun : sum {k in 1..(d*t)} x[6,1,k] = 6;
prosixcoursdeux : sum {k in 1..(d*t)} x[6,2,k] = 0;

#9 Le prof 7 donne 1 cours à la promo 1 en 15 et 0 à la promo 2

profseptcoursun : x[7,1,15] = 1;
profseptcoursdeux : sum {k in 1..(d*t)} x[7,2,k] = 0;

#10 Le prof 8 donne 0 cours à la promo 1 et 1 à la promo 2 en 15

profhuitcoursun : sum {k in 1..(d*t)} x[8,1,k] = 0;
profhuitcoursdeux : x[8,2,15] = 1;

#11 Les profs 7 et 8 n'ont aucun cours en dehors du créneau 15

septpascoursavantquinze : sum{j in 1..c,k in 1..14} x[7,j,k] = 0;
septpascoursapresquinze : sum{j in 1..c,k in 16..(d*t)} x[7,j,k] = 0;

huitpascoursavantquinze : sum{j in 1..c,k in 1..14} x[8,j,k] = 0;
huitpascoursapresquinze : sum{j in 1..c,k in 16..(d*t)} x[8,j,k] = 0;

#12 Pas de cours au créneau 1

partiel : sum{i in 1..p,j in 1..c} x[i,j,1] = 0;

#13 Une promo ne doit pas avoir deux fois le mm cours dans la mm journée sauf en informatique, une promo peut avoir jusqu'à deux fois cours dans la mm journée

c13_1_1_1 : sum{k in 1..4} x[1,1,k] <= 1;
c13_1_1_2 : sum{k in 5..8} x[1,1,k] <= 1;
c13_1_1_3 : sum{k in 9..12} x[1,1,k] <= 1;
c13_1_1_4 : sum{k in 13..16} x[1,1,k] <= 1;
c13_1_1_5 : sum{k in 17..20} x[1,1,k] <= 1;
c13_1_2_1 : sum{k in 1..4} x[1,2,k] <= 1;
c13_1_2_2 : sum{k in 5..8} x[1,2,k] <= 1;
c13_1_2_3 : sum{k in 9..12} x[1,2,k] <= 1;
c13_1_2_4 : sum{k in 13..16} x[1,2,k] <= 1;
c13_1_2_5 : sum{k in 17..20} x[1,2,k] <= 1;
c13_2_1_1 : sum{k in 1..4} x[2,1,k] <= 1;
c13_2_1_2 : sum{k in 5..8} x[2,1,k] <= 1;
c13_2_1_3 : sum{k in 9..12} x[2,1,k] <= 1;
c13_2_1_4 : sum{k in 13..16} x[2,1,k] <= 1;
c13_2_1_5 : sum{k in 17..20} x[2,1,k] <= 1;
c13_2_2_1 : sum{k in 1..4} x[2,2,k] <= 1;
c13_2_2_2 : sum{k in 5..8} x[2,2,k] <= 1;
c13_2_2_3 : sum{k in 9..12} x[2,2,k] <= 1;
c13_2_2_4 : sum{k in 13..16} x[2,2,k] <= 1;
c13_2_2_5 : sum{k in 17..20} x[2,2,k] <= 1;
c13_3_1_1 : sum{k in 1..4} x[3,1,k] <= 1;
c13_3_1_2 : sum{k in 5..8} x[3,1,k] <= 1;
c13_3_1_3 : sum{k in 9..12} x[3,1,k] <= 1;
c13_3_1_4 : sum{k in 13..16} x[3,1,k] <= 1;
c13_3_1_5 : sum{k in 17..20} x[3,1,k] <= 1;
c13_3_2_1 : sum{k in 1..4} x[3,2,k] <= 1;
c13_3_2_2 : sum{k in 5..8} x[3,2,k] <= 1;
c13_3_2_3 : sum{k in 9..12} x[3,2,k] <= 1;
c13_3_2_4 : sum{k in 13..16} x[3,2,k] <= 1;
c13_3_2_5 : sum{k in 17..20} x[3,2,k] <= 1;
c13_4_1_1 : sum{k in 1..4} x[4,1,k] <= 1;
c13_4_1_2 : sum{k in 5..8} x[4,1,k] <= 1;
c13_4_1_3 : sum{k in 9..12} x[4,1,k] <= 1;
c13_4_1_4 : sum{k in 13..16} x[4,1,k] <= 1;
c13_4_1_5 : sum{k in 17..20} x[4,1,k] <= 1;
c13_4_2_1 : sum{k in 1..4} x[4,2,k] <= 1;
c13_4_2_2 : sum{k in 5..8} x[4,2,k] <= 1;
c13_4_2_3 : sum{k in 9..12} x[4,2,k] <= 1;
c13_4_2_4 : sum{k in 13..16} x[4,2,k] <= 1;
c13_4_2_5 : sum{k in 17..20} x[4,2,k] <= 1;
c13_5_1_1 : sum{k in 1..4} x[5,1,k] <= 2;
c13_5_1_2 : sum{k in 5..8} x[5,1,k] <= 2;
c13_5_1_3 : sum{k in 9..12} x[5,1,k] <= 2;
c13_5_1_4 : sum{k in 13..16} x[5,1,k] <= 2;
c13_5_1_5 : sum{k in 17..20} x[5,1,k] <= 2;
c13_5_2_1 : sum{k in 1..4} x[5,2,k] <= 2;
c13_5_2_2 : sum{k in 5..8} x[5,2,k] <= 2;
c13_5_2_3 : sum{k in 9..12} x[5,2,k] <= 2;
c13_5_2_4 : sum{k in 13..16} x[5,2,k] <= 2;
c13_5_2_5 : sum{k in 17..20} x[5,2,k] <= 2;
c13_6_1_1 : sum{k in 1..4} x[6,1,k] <= 2;
c13_6_1_2 : sum{k in 5..8} x[6,1,k] <= 2;
c13_6_1_3 : sum{k in 9..12} x[6,1,k] <= 2;
c13_6_1_4 : sum{k in 13..16} x[6,1,k] <= 2;
c13_6_1_5 : sum{k in 17..20} x[6,1,k] <= 2;
c13_6_2_1 : sum{k in 1..4} x[6,2,k] <= 2;
c13_6_2_2 : sum{k in 5..8} x[6,2,k] <= 2;
c13_6_2_3 : sum{k in 9..12} x[6,2,k] <= 2;
c13_6_2_4 : sum{k in 13..16} x[6,2,k] <= 2;
c13_6_2_5 : sum{k in 17..20} x[6,2,k] <= 2;
c13_7_1_1 : sum{k in 1..4} x[7,1,k] <= 1;
c13_7_1_2 : sum{k in 5..8} x[7,1,k] <= 1;
c13_7_1_3 : sum{k in 9..12} x[7,1,k] <= 1;
c13_7_1_4 : sum{k in 13..16} x[7,1,k] <= 1;
c13_7_1_5 : sum{k in 17..20} x[7,1,k] <= 1;
c13_7_2_1 : sum{k in 1..4} x[7,2,k] <= 1;
c13_7_2_2 : sum{k in 5..8} x[7,2,k] <= 1;
c13_7_2_3 : sum{k in 9..12} x[7,2,k] <= 1;
c13_7_2_4 : sum{k in 13..16} x[7,2,k] <= 1;
c13_7_2_5 : sum{k in 17..20} x[7,2,k] <= 1;
c13_8_1_1 : sum{k in 1..4} x[8,1,k] <= 1;
c13_8_1_2 : sum{k in 5..8} x[8,1,k] <= 1;
c13_8_1_3 : sum{k in 9..12} x[8,1,k] <= 1;
c13_8_1_4 : sum{k in 13..16} x[8,1,k] <= 1;
c13_8_1_5 : sum{k in 17..20} x[8,1,k] <= 1;
c13_8_2_1 : sum{k in 1..4} x[8,2,k] <= 1;
c13_8_2_2 : sum{k in 5..8} x[8,2,k] <= 1;
c13_8_2_3 : sum{k in 9..12} x[8,2,k] <= 1;
c13_8_2_4 : sum{k in 13..16} x[8,2,k] <= 1;
c13_8_2_5 : sum{k in 17..20} x[8,2,k] <= 1;

#14 Une promo ne peut suivre qu'un seul cours à la fois

c14_1_1 : sum{i in 1..p} x[i,1,1] <= 1;
c14_1_2 : sum{i in 1..p} x[i,1,2] <= 1;
c14_1_3 : sum{i in 1..p} x[i,1,3] <= 1;
c14_1_4 : sum{i in 1..p} x[i,1,4] <= 1;
c14_1_5 : sum{i in 1..p} x[i,1,5] <= 1;
c14_1_6 : sum{i in 1..p} x[i,1,6] <= 1;
c14_1_7 : sum{i in 1..p} x[i,1,7] <= 1;
c14_1_8 : sum{i in 1..p} x[i,1,8] <= 1;
c14_1_9 : sum{i in 1..p} x[i,1,9] <= 1;
c14_1_10 : sum{i in 1..p} x[i,1,10] <= 1;
c14_1_11 : sum{i in 1..p} x[i,1,11] <= 1;
c14_1_12 : sum{i in 1..p} x[i,1,12] <= 1;
c14_1_13 : sum{i in 1..p} x[i,1,13] <= 1;
c14_1_14 : sum{i in 1..p} x[i,1,14] <= 1;
c14_1_15 : sum{i in 1..p} x[i,1,15] <= 1;
c14_1_16 : sum{i in 1..p} x[i,1,16] <= 1;
c14_1_17 : sum{i in 1..p} x[i,1,17] <= 1;
c14_1_18 : sum{i in 1..p} x[i,1,18] <= 1;
c14_1_19 : sum{i in 1..p} x[i,1,19] <= 1;
c14_1_20 : sum{i in 1..p} x[i,1,20] <= 1;
c14_2_1 : sum{i in 1..p} x[i,2,1] <= 1;
c14_2_2 : sum{i in 1..p} x[i,2,2] <= 1;
c14_2_3 : sum{i in 1..p} x[i,2,3] <= 1;
c14_2_4 : sum{i in 1..p} x[i,2,4] <= 1;
c14_2_5 : sum{i in 1..p} x[i,2,5] <= 1;
c14_2_6 : sum{i in 1..p} x[i,2,6] <= 1;
c14_2_7 : sum{i in 1..p} x[i,2,7] <= 1;
c14_2_8 : sum{i in 1..p} x[i,2,8] <= 1;
c14_2_9 : sum{i in 1..p} x[i,2,9] <= 1;
c14_2_10 : sum{i in 1..p} x[i,2,10] <= 1;
c14_2_11 : sum{i in 1..p} x[i,2,11] <= 1;
c14_2_12 : sum{i in 1..p} x[i,2,12] <= 1;
c14_2_13 : sum{i in 1..p} x[i,2,13] <= 1;
c14_2_14 : sum{i in 1..p} x[i,2,14] <= 1;
c14_2_15 : sum{i in 1..p} x[i,2,15] <= 1;
c14_2_16 : sum{i in 1..p} x[i,2,16] <= 1;
c14_2_17 : sum{i in 1..p} x[i,2,17] <= 1;
c14_2_18 : sum{i in 1..p} x[i,2,18] <= 1;
c14_2_19 : sum{i in 1..p} x[i,2,19] <= 1;
c14_2_20 : sum{i in 1..p} x[i,2,20] <= 1;

#15 Un prof ne peut donner qu'un cours à la fois

c15_1_1 : sum{j in 1..c} x[1,j,1] <= 1;
c15_1_2 : sum{j in 1..c} x[1,j,2] <= 1;
c15_1_3 : sum{j in 1..c} x[1,j,3] <= 1;
c15_1_4 : sum{j in 1..c} x[1,j,4] <= 1;
c15_1_5 : sum{j in 1..c} x[1,j,5] <= 1;
c15_1_6 : sum{j in 1..c} x[1,j,6] <= 1;
c15_1_7 : sum{j in 1..c} x[1,j,7] <= 1;
c15_1_8 : sum{j in 1..c} x[1,j,8] <= 1;
c15_1_9 : sum{j in 1..c} x[1,j,9] <= 1;
c15_1_10 : sum{j in 1..c} x[1,j,10] <= 1;
c15_1_11 : sum{j in 1..c} x[1,j,11] <= 1;
c15_1_12 : sum{j in 1..c} x[1,j,12] <= 1;
c15_1_13 : sum{j in 1..c} x[1,j,13] <= 1;
c15_1_14 : sum{j in 1..c} x[1,j,14] <= 1;
c15_1_15 : sum{j in 1..c} x[1,j,15] <= 1;
c15_1_16 : sum{j in 1..c} x[1,j,16] <= 1;
c15_1_17 : sum{j in 1..c} x[1,j,17] <= 1;
c15_1_18 : sum{j in 1..c} x[1,j,18] <= 1;
c15_1_19 : sum{j in 1..c} x[1,j,19] <= 1;
c15_1_20 : sum{j in 1..c} x[1,j,20] <= 1;
c15_2_1 : sum{j in 1..c} x[2,j,1] <= 1;
c15_2_2 : sum{j in 1..c} x[2,j,2] <= 1;
c15_2_3 : sum{j in 1..c} x[2,j,3] <= 1;
c15_2_4 : sum{j in 1..c} x[2,j,4] <= 1;
c15_2_5 : sum{j in 1..c} x[2,j,5] <= 1;
c15_2_6 : sum{j in 1..c} x[2,j,6] <= 1;
c15_2_7 : sum{j in 1..c} x[2,j,7] <= 1;
c15_2_8 : sum{j in 1..c} x[2,j,8] <= 1;
c15_2_9 : sum{j in 1..c} x[2,j,9] <= 1;
c15_2_10 : sum{j in 1..c} x[2,j,10] <= 1;
c15_2_11 : sum{j in 1..c} x[2,j,11] <= 1;
c15_2_12 : sum{j in 1..c} x[2,j,12] <= 1;
c15_2_13 : sum{j in 1..c} x[2,j,13] <= 1;
c15_2_14 : sum{j in 1..c} x[2,j,14] <= 1;
c15_2_15 : sum{j in 1..c} x[2,j,15] <= 1;
c15_2_16 : sum{j in 1..c} x[2,j,16] <= 1;
c15_2_17 : sum{j in 1..c} x[2,j,17] <= 1;
c15_2_18 : sum{j in 1..c} x[2,j,18] <= 1;
c15_2_19 : sum{j in 1..c} x[2,j,19] <= 1;
c15_2_20 : sum{j in 1..c} x[2,j,20] <= 1;
c15_3_1 : sum{j in 1..c} x[3,j,1] <= 1;
c15_3_2 : sum{j in 1..c} x[3,j,2] <= 1;
c15_3_3 : sum{j in 1..c} x[3,j,3] <= 1;
c15_3_4 : sum{j in 1..c} x[3,j,4] <= 1;
c15_3_5 : sum{j in 1..c} x[3,j,5] <= 1;
c15_3_6 : sum{j in 1..c} x[3,j,6] <= 1;
c15_3_7 : sum{j in 1..c} x[3,j,7] <= 1;
c15_3_8 : sum{j in 1..c} x[3,j,8] <= 1;
c15_3_9 : sum{j in 1..c} x[3,j,9] <= 1;
c15_3_10 : sum{j in 1..c} x[3,j,10] <= 1;
c15_3_11 : sum{j in 1..c} x[3,j,11] <= 1;
c15_3_12 : sum{j in 1..c} x[3,j,12] <= 1;
c15_3_13 : sum{j in 1..c} x[3,j,13] <= 1;
c15_3_14 : sum{j in 1..c} x[3,j,14] <= 1;
c15_3_15 : sum{j in 1..c} x[3,j,15] <= 1;
c15_3_16 : sum{j in 1..c} x[3,j,16] <= 1;
c15_3_17 : sum{j in 1..c} x[3,j,17] <= 1;
c15_3_18 : sum{j in 1..c} x[3,j,18] <= 1;
c15_3_19 : sum{j in 1..c} x[3,j,19] <= 1;
c15_3_20 : sum{j in 1..c} x[3,j,20] <= 1;
c15_4_1 : sum{j in 1..c} x[4,j,1] <= 1;
c15_4_2 : sum{j in 1..c} x[4,j,2] <= 1;
c15_4_3 : sum{j in 1..c} x[4,j,3] <= 1;
c15_4_4 : sum{j in 1..c} x[4,j,4] <= 1;
c15_4_5 : sum{j in 1..c} x[4,j,5] <= 1;
c15_4_6 : sum{j in 1..c} x[4,j,6] <= 1;
c15_4_7 : sum{j in 1..c} x[4,j,7] <= 1;
c15_4_8 : sum{j in 1..c} x[4,j,8] <= 1;
c15_4_9 : sum{j in 1..c} x[4,j,9] <= 1;
c15_4_10 : sum{j in 1..c} x[4,j,10] <= 1;
c15_4_11 : sum{j in 1..c} x[4,j,11] <= 1;
c15_4_12 : sum{j in 1..c} x[4,j,12] <= 1;
c15_4_13 : sum{j in 1..c} x[4,j,13] <= 1;
c15_4_14 : sum{j in 1..c} x[4,j,14] <= 1;
c15_4_15 : sum{j in 1..c} x[4,j,15] <= 1;
c15_4_16 : sum{j in 1..c} x[4,j,16] <= 1;
c15_4_17 : sum{j in 1..c} x[4,j,17] <= 1;
c15_4_18 : sum{j in 1..c} x[4,j,18] <= 1;
c15_4_19 : sum{j in 1..c} x[4,j,19] <= 1;
c15_4_20 : sum{j in 1..c} x[4,j,20] <= 1;
c15_5_1 : sum{j in 1..c} x[5,j,1] <= 1;
c15_5_2 : sum{j in 1..c} x[5,j,2] <= 1;
c15_5_3 : sum{j in 1..c} x[5,j,3] <= 1;
c15_5_4 : sum{j in 1..c} x[5,j,4] <= 1;
c15_5_5 : sum{j in 1..c} x[5,j,5] <= 1;
c15_5_6 : sum{j in 1..c} x[5,j,6] <= 1;
c15_5_7 : sum{j in 1..c} x[5,j,7] <= 1;
c15_5_8 : sum{j in 1..c} x[5,j,8] <= 1;
c15_5_9 : sum{j in 1..c} x[5,j,9] <= 1;
c15_5_10 : sum{j in 1..c} x[5,j,10] <= 1;
c15_5_11 : sum{j in 1..c} x[5,j,11] <= 1;
c15_5_12 : sum{j in 1..c} x[5,j,12] <= 1;
c15_5_13 : sum{j in 1..c} x[5,j,13] <= 1;
c15_5_14 : sum{j in 1..c} x[5,j,14] <= 1;
c15_5_15 : sum{j in 1..c} x[5,j,15] <= 1;
c15_5_16 : sum{j in 1..c} x[5,j,16] <= 1;
c15_5_17 : sum{j in 1..c} x[5,j,17] <= 1;
c15_5_18 : sum{j in 1..c} x[5,j,18] <= 1;
c15_5_19 : sum{j in 1..c} x[5,j,19] <= 1;
c15_5_20 : sum{j in 1..c} x[5,j,20] <= 1;
c15_6_1 : sum{j in 1..c} x[6,j,1] <= 1;
c15_6_2 : sum{j in 1..c} x[6,j,2] <= 1;
c15_6_3 : sum{j in 1..c} x[6,j,3] <= 1;
c15_6_4 : sum{j in 1..c} x[6,j,4] <= 1;
c15_6_5 : sum{j in 1..c} x[6,j,5] <= 1;
c15_6_6 : sum{j in 1..c} x[6,j,6] <= 1;
c15_6_7 : sum{j in 1..c} x[6,j,7] <= 1;
c15_6_8 : sum{j in 1..c} x[6,j,8] <= 1;
c15_6_9 : sum{j in 1..c} x[6,j,9] <= 1;
c15_6_10 : sum{j in 1..c} x[6,j,10] <= 1;
c15_6_11 : sum{j in 1..c} x[6,j,11] <= 1;
c15_6_12 : sum{j in 1..c} x[6,j,12] <= 1;
c15_6_13 : sum{j in 1..c} x[6,j,13] <= 1;
c15_6_14 : sum{j in 1..c} x[6,j,14] <= 1;
c15_6_15 : sum{j in 1..c} x[6,j,15] <= 1;
c15_6_16 : sum{j in 1..c} x[6,j,16] <= 1;
c15_6_17 : sum{j in 1..c} x[6,j,17] <= 1;
c15_6_18 : sum{j in 1..c} x[6,j,18] <= 1;
c15_6_19 : sum{j in 1..c} x[6,j,19] <= 1;
c15_6_20 : sum{j in 1..c} x[6,j,20] <= 1;
c15_7_1 : sum{j in 1..c} x[7,j,1] <= 1;
c15_7_2 : sum{j in 1..c} x[7,j,2] <= 1;
c15_7_3 : sum{j in 1..c} x[7,j,3] <= 1;
c15_7_4 : sum{j in 1..c} x[7,j,4] <= 1;
c15_7_5 : sum{j in 1..c} x[7,j,5] <= 1;
c15_7_6 : sum{j in 1..c} x[7,j,6] <= 1;
c15_7_7 : sum{j in 1..c} x[7,j,7] <= 1;
c15_7_8 : sum{j in 1..c} x[7,j,8] <= 1;
c15_7_9 : sum{j in 1..c} x[7,j,9] <= 1;
c15_7_10 : sum{j in 1..c} x[7,j,10] <= 1;
c15_7_11 : sum{j in 1..c} x[7,j,11] <= 1;
c15_7_12 : sum{j in 1..c} x[7,j,12] <= 1;
c15_7_13 : sum{j in 1..c} x[7,j,13] <= 1;
c15_7_14 : sum{j in 1..c} x[7,j,14] <= 1;
c15_7_15 : sum{j in 1..c} x[7,j,15] <= 1;
c15_7_16 : sum{j in 1..c} x[7,j,16] <= 1;
c15_7_17 : sum{j in 1..c} x[7,j,17] <= 1;
c15_7_18 : sum{j in 1..c} x[7,j,18] <= 1;
c15_7_19 : sum{j in 1..c} x[7,j,19] <= 1;
c15_7_20 : sum{j in 1..c} x[7,j,20] <= 1;
c15_8_1 : sum{j in 1..c} x[8,j,1] <= 1;
c15_8_2 : sum{j in 1..c} x[8,j,2] <= 1;
c15_8_3 : sum{j in 1..c} x[8,j,3] <= 1;
c15_8_4 : sum{j in 1..c} x[8,j,4] <= 1;
c15_8_5 : sum{j in 1..c} x[8,j,5] <= 1;
c15_8_6 : sum{j in 1..c} x[8,j,6] <= 1;
c15_8_7 : sum{j in 1..c} x[8,j,7] <= 1;
c15_8_8 : sum{j in 1..c} x[8,j,8] <= 1;
c15_8_9 : sum{j in 1..c} x[8,j,9] <= 1;
c15_8_10 : sum{j in 1..c} x[8,j,10] <= 1;
c15_8_11 : sum{j in 1..c} x[8,j,11] <= 1;
c15_8_12 : sum{j in 1..c} x[8,j,12] <= 1;
c15_8_13 : sum{j in 1..c} x[8,j,13] <= 1;
c15_8_14 : sum{j in 1..c} x[8,j,14] <= 1;
c15_8_15 : sum{j in 1..c} x[8,j,15] <= 1;
c15_8_16 : sum{j in 1..c} x[8,j,16] <= 1;
c15_8_17 : sum{j in 1..c} x[8,j,17] <= 1;
c15_8_18 : sum{j in 1..c} x[8,j,18] <= 1;
c15_8_19 : sum{j in 1..c} x[8,j,19] <= 1;
c15_8_20 : sum{j in 1..c} x[8,j,20] <= 1;

####################################################

printf "---Debut de la resolution ---\n";

solve;

printf "---Fin de la resolution ---\n";

display x;

end;
