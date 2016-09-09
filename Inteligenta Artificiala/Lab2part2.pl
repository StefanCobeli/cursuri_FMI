culoare(rosu).
culoare(galben).
culoare(alb).
frunze(alterne).
frunze(mari).
frunze(nervuri_paralele).
petale(multepetale).
petale(petalegalbene).
petale(grupate_trompeta).
fl(trandafir, rosu, alterne, multepetale).
fl(floarea_soarelui, galben, mari, petalegalbene).
fl(crin, alb, nervuri_paralele, grupate_trompeta).
floare(A, X, Y, Z):-culoare(X), frunze(Y), petale(Z),
fl(A,X,Y,Z).


getX('X1').
getZ('Z1').
getX('X2').
getZ('Z2').
wr:-getX(X), getZ(Z), wrXZ(X, Z), fail.
wrXZ(X, Z):-write(X), write(' '), write(Z), write(' '), nl, fail .



/De implementat functia din laboratorul 2. Ultimul exercitiu.