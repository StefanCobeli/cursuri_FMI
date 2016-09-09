parinte(ion,maria).
parinte(ana,maria).
parinte(ana,dan).
parinte(maria,elena).
parinte(maria,radu).
parinte(elena,nicu).
parinte(radu,gigi).
parinte(radu,dragos).

bunic( X , Y ) :- parinte( X , Z ) , parinte( Z , Y ) .
frate( X , Y ) :- parinte( Z , X ) , parinte( Z , Y ) , X \= Y  ,
 \+ ( frate( Y , X ) ) .
 
 
 functie( X, 0 ) :- X =< 3 .
 functie( X, 4 ) :- X > 6 .
 functie( X, 2 ) .