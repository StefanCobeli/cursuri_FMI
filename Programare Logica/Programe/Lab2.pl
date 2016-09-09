show module BOOL-OPS .
show module NAT .

fmod MYNAT is

sorts Zero NzNat Nat .

including BOOL . 
  

subsort Zero NzNat < Nat .

op 0 : -> Zero .
op s_ : Nat -> NzNat .
op _+_ : Nat Nat -> Nat [assoc comm prec 33] .
op _*_ : Nat Nat -> Nat [assoc comm prec 31] .

op _>_ : Nat Nat -> Bool . 
op _<_ : Nat Nat -> Bool .
op _<=_ : Nat Nat -> Bool .
op _>=_ : Nat Nat -> Bool .
  
  
  
  
vars N M : Nat .

eq 0 + M = M .
eq s(N) + M = s(N + M) .

eq 0 * M = 0 .
eq s(N) * M = (N * M) + M .

eq s N > s M = N > M .  
eq s M > 0 = true .
eq 0 > M = false .  
  
eq N <= M = not( N > M ) .
  
eq N < M = (N <= M)   
  
endfm

red s 0 <= s s s s s 0 .