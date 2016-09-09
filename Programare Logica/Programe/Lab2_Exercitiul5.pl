
*** ceq ter1 = ter2 if ter3 .

fmod DATA-CALENDARISTICA is

including NAT .
  
sort Data .
  
op _/_/_ : Nat Nat Nat -> Data .
  
op valid : Data -> Bool .
  
vars M : Data .
vars Zi Luna An : Nat . 
  
  
 ***Verificari de bun simt 
  
ceq valid( Zi / Luna / An )  = false if 
  Zi >= 32 or Luna > 12  .

ceq valid( Zi / Luna / An ) = false if
  ( Luna == 1 or Luna == 3 or Luna == 5 or
  Luna == 7 or Luna == 8 or Luna == 10 or
  Luna == 12 ) and  not (Zi == 31) .

ceq valid( Zi / Luna / An ) = false if
  ( Luna == 4 or Luna == 6 or Luna == 9 or
  Luna == 11 ) and not (Zi == 30) .

  
  *** Verificam daca suntem intr-un an bisect
  
ceq valid( Zi / Luna / An ) = false if
  not( 4 divides An ) and 
  Luna == 2 and not( Zi == 28 ) .
  
ceq valid( Zi / Luna / An ) = false if
  (4 divides An) and not( 100 divides An ) and
  (Luna == 2) and not( Zi == 29 ) .
  
ceq valid( Zi / Luna / An ) = false if
  4 divides An and not( 400 divides An ) and 100 divides An and
  Luna == 2 and not( Zi == 28 ) .
  
ceq valid( Zi / Luna / An ) = false if
  (4 divides An) and not( 100 divides An ) and
  not( 400 divides An ) and
  Luna == 2 and not( Zi == 29 ) .
  
  ***(
if (year is not divisible by 4) then (it is a common year)
else if (year is not divisible by 100) then (it is a leap year)
else if (year is not divisible by 400) then (it is a common year)
else (it is a leap year)  
  )***
eq valid( Zi / Luna / An ) = true .  
  
  
endfm

red valid( 29 / 2 / 2004 ).
  