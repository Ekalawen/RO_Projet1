
function[x] = glpsol()

x = zeros(8,2,20);

x(1,1,4) = 1;
x(1,1,1) = 0;
x(1,1,8) = 1;
x(1,1,5) = 0;
x(1,1,12) = 0;
x(1,1,9) = 0;
x(1,1,16) = 0;
x(1,1,13) = 0;
x(1,1,20) = 0;
x(1,1,17) = 0;
x(1,2,4) = 0;
x(1,2,1) = 0;
x(1,2,8) = 0;
x(1,2,5) = 1;
x(1,2,12) = 0;
x(1,2,9) = 0;
x(1,2,16) = 0;
x(1,2,13) = 0;
x(1,2,20) = 0;
x(1,2,17) = 1;
x(2,1,4) = 0;
x(2,1,1) = 0;
x(2,1,8) = 0;
x(2,1,5) = 1;
x(2,1,12) = 0;
x(2,1,9) = 0;
x(2,1,16) = 1;
x(2,1,13) = 0;
x(2,1,20) = 0;
x(2,1,17) = 1;
x(2,2,4) = 1;
x(2,2,1) = 0;
x(2,2,8) = 1;
x(2,2,5) = 0;
x(2,2,12) = 0;
x(2,2,9) = 0;
x(2,2,16) = 0;
x(2,2,13) = 0;
x(2,2,20) = 0;
x(2,2,17) = 0;
x(3,1,4) = 0;
x(3,1,1) = 0;
x(3,1,8) = 0;
x(3,1,5) = 0;
x(3,1,12) = 1;
x(3,1,9) = 0;
x(3,1,16) = 0;
x(3,1,13) = 1;
x(3,1,20) = 0;
x(3,1,17) = 0;
x(3,2,4) = 0;
x(3,2,1) = 0;
x(3,2,8) = 0;
x(3,2,5) = 0;
x(3,2,12) = 0;
x(3,2,9) = 0;
x(3,2,16) = 0;
x(3,2,13) = 0;
x(3,2,20) = 0;
x(3,2,17) = 0;
x(4,1,4) = 0;
x(4,1,1) = 0;
x(4,1,8) = 0;
x(4,1,5) = 0;
x(4,1,12) = 0;
x(4,1,9) = 0;
x(4,1,16) = 0;
x(4,1,13) = 0;
x(4,1,20) = 0;
x(4,1,17) = 0;
x(4,2,4) = 0;
x(4,2,1) = 0;
x(4,2,8) = 0;
x(4,2,5) = 0;
x(4,2,12) = 0;
x(4,2,9) = 0;
x(4,2,16) = 1;
x(4,2,13) = 0;
x(4,2,20) = 0;
x(4,2,17) = 0;
x(5,1,4) = 0;
x(5,1,1) = 0;
x(5,1,8) = 0;
x(5,1,5) = 0;
x(5,1,12) = 0;
x(5,1,9) = 0;
x(5,1,16) = 0;
x(5,1,13) = 0;
x(5,1,20) = 0;
x(5,1,17) = 0;
x(5,2,4) = 0;
x(5,2,1) = 0;
x(5,2,8) = 0;
x(5,2,5) = 0;
x(5,2,12) = 0;
x(5,2,9) = 0;
x(5,2,16) = 0;
x(5,2,13) = 1;
x(5,2,20) = 1;
x(5,2,17) = 0;
x(6,1,4) = 0;
x(6,1,1) = 0;
x(6,1,8) = 0;
x(6,1,5) = 0;
x(6,1,12) = 0;
x(6,1,9) = 1;
x(6,1,16) = 0;
x(6,1,13) = 0;
x(6,1,20) = 0;
x(6,1,17) = 0;
x(6,2,4) = 0;
x(6,2,1) = 0;
x(6,2,8) = 0;
x(6,2,5) = 0;
x(6,2,12) = 0;
x(6,2,9) = 0;
x(6,2,16) = 0;
x(6,2,13) = 0;
x(6,2,20) = 0;
x(6,2,17) = 0;
x(7,1,4) = 0;
x(7,1,1) = 0;
x(7,1,8) = 0;
x(7,1,5) = 0;
x(7,1,12) = 0;
x(7,1,9) = 0;
x(7,1,16) = 0;
x(7,1,13) = 0;
x(7,1,20) = 0;
x(7,1,17) = 0;
x(7,2,4) = 0;
x(7,2,1) = 0;
x(7,2,8) = 0;
x(7,2,5) = 0;
x(7,2,12) = 0;
x(7,2,9) = 0;
x(7,2,16) = 0;
x(7,2,13) = 0;
x(7,2,20) = 0;
x(7,2,17) = 0;
x(8,1,4) = 0;
x(8,1,1) = 0;
x(8,1,8) = 0;
x(8,1,5) = 0;
x(8,1,12) = 0;
x(8,1,9) = 0;
x(8,1,16) = 0;
x(8,1,13) = 0;
x(8,1,20) = 0;
x(8,1,17) = 0;
x(8,2,4) = 0;
x(8,2,1) = 0;
x(8,2,8) = 0;
x(8,2,5) = 0;
x(8,2,12) = 0;
x(8,2,9) = 0;
x(8,2,16) = 0;
x(8,2,13) = 0;
x(8,2,20) = 0;
x(8,2,17) = 0;
x(2,1,10) = 0;
x(2,1,11) = 0;
x(2,2,10) = 0;
x(2,2,11) = 0;
x(4,1,2) = 0;
x(4,2,2) = 0;
x(1,1,2) = 0;
x(1,1,3) = 0;
x(1,1,6) = 0;
x(1,1,7) = 0;
x(1,1,10) = 0;
x(1,1,11) = 1;
x(1,1,14) = 0;
x(1,1,15) = 0;
x(1,1,18) = 0;
x(1,1,19) = 0;
x(1,2,2) = 0;
x(1,2,3) = 0;
x(1,2,6) = 0;
x(1,2,7) = 0;
x(1,2,10) = 1;
x(1,2,11) = 0;
x(1,2,14) = 0;
x(1,2,15) = 0;
x(1,2,18) = 0;
x(1,2,19) = 0;
x(2,1,2) = 0;
x(2,1,3) = 0;
x(2,1,6) = 0;
x(2,1,7) = 0;
x(2,1,14) = 0;
x(2,1,15) = 0;
x(2,1,18) = 0;
x(2,1,19) = 0;
x(2,2,2) = 0;
x(2,2,3) = 0;
x(2,2,6) = 0;
x(2,2,7) = 0;
x(2,2,14) = 1;
x(2,2,15) = 0;
x(2,2,18) = 0;
x(2,2,19) = 0;
x(3,1,2) = 1;
x(3,1,3) = 0;
x(3,1,6) = 1;
x(3,1,7) = 0;
x(3,1,10) = 0;
x(3,1,11) = 0;
x(3,1,14) = 0;
x(3,1,15) = 0;
x(3,1,18) = 1;
x(3,1,19) = 0;
x(3,2,2) = 0;
x(3,2,3) = 0;
x(3,2,6) = 0;
x(3,2,7) = 0;
x(3,2,10) = 0;
x(3,2,11) = 0;
x(3,2,14) = 0;
x(3,2,15) = 0;
x(3,2,18) = 0;
x(3,2,19) = 0;
x(4,1,3) = 0;
x(4,1,6) = 0;
x(4,1,7) = 0;
x(4,1,10) = 0;
x(4,1,11) = 0;
x(4,1,14) = 0;
x(4,1,15) = 0;
x(4,1,18) = 0;
x(4,1,19) = 0;
x(4,2,3) = 1;
x(4,2,6) = 0;
x(4,2,7) = 0;
x(4,2,10) = 0;
x(4,2,11) = 1;
x(4,2,14) = 0;
x(4,2,15) = 0;
x(4,2,18) = 1;
x(4,2,19) = 0;
x(5,1,2) = 0;
x(5,1,3) = 0;
x(5,1,6) = 0;
x(5,1,7) = 0;
x(5,1,10) = 0;
x(5,1,11) = 0;
x(5,1,14) = 0;
x(5,1,15) = 0;
x(5,1,18) = 0;
x(5,1,19) = 0;
x(5,2,2) = 1;
x(5,2,3) = 0;
x(5,2,6) = 1;
x(5,2,7) = 1;
x(5,2,10) = 0;
x(5,2,11) = 0;
x(5,2,14) = 0;
x(5,2,15) = 0;
x(5,2,18) = 0;
x(5,2,19) = 1;
x(6,1,2) = 0;
x(6,1,3) = 1;
x(6,1,6) = 0;
x(6,1,7) = 1;
x(6,1,10) = 1;
x(6,1,11) = 0;
x(6,1,14) = 1;
x(6,1,15) = 0;
x(6,1,18) = 0;
x(6,1,19) = 1;
x(6,2,2) = 0;
x(6,2,3) = 0;
x(6,2,6) = 0;
x(6,2,7) = 0;
x(6,2,10) = 0;
x(6,2,11) = 0;
x(6,2,14) = 0;
x(6,2,15) = 0;
x(6,2,18) = 0;
x(6,2,19) = 0;
x(7,1,15) = 1;
x(7,2,2) = 0;
x(7,2,3) = 0;
x(7,2,6) = 0;
x(7,2,7) = 0;
x(7,2,10) = 0;
x(7,2,11) = 0;
x(7,2,14) = 0;
x(7,2,15) = 0;
x(7,2,18) = 0;
x(7,2,19) = 0;
x(8,1,2) = 0;
x(8,1,3) = 0;
x(8,1,6) = 0;
x(8,1,7) = 0;
x(8,1,10) = 0;
x(8,1,11) = 0;
x(8,1,14) = 0;
x(8,1,15) = 0;
x(8,1,18) = 0;
x(8,1,19) = 0;
x(8,2,15) = 1;
x(7,1,2) = 0;
x(7,1,3) = 0;
x(7,1,6) = 0;
x(7,1,7) = 0;
x(7,1,10) = 0;
x(7,1,11) = 0;
x(7,1,14) = 0;
x(7,1,18) = 0;
x(7,1,19) = 0;
x(8,2,2) = 0;
x(8,2,3) = 0;
x(8,2,6) = 0;
x(8,2,7) = 0;
x(8,2,10) = 0;
x(8,2,11) = 0;
x(8,2,14) = 0;
x(8,2,18) = 0;
x(8,2,19) = 0;


return