

***Lists of something. Lab4



***Pas1 Teoria

fmod LIST{X :: TRIV} is
 
  sort List{X} .
  subsort X$Elt < List{X} .
  op nil : -> List{X} .
  op _ _ : List{X} List{X} -> List{X} [assoc id: nil] .
  op reverse : List{ X } -> List{ X } .
  
  var List1 : List{ X } .
  var Elem1 : X$Elt .	

  
  eq reverse( nil ) = nil .
  eq reverse( Elem1 List1 )  = reverse( List1 ) Elem1 .

endfm

view IntView from TRIV to INT is
   sort Elt to Int . 
endv
  
fmod LIST-INT is
  protecting LIST{ Int } .
endfm
  
  red reverse( nil 1 3 nil nil nil 2 nil  2 ) .

********************************************************************
ana.turlea@my.fmi.unibuc.ro

1
fmod PAIR{X :: TRIV , Y :: TRIV} is
  sort Per {X , Y} .
  op (_,_) : X$Elt Y$Elt -> Per{X,Y} .
  op first : Per{X,Y} -> X$Elt .
  op second : Per{X,Y} -> Y$Elt .
  var A : X$Elt .
  var B : Y$Elt .
  eq first (A , B) = A .
  eq second (A , B) = B .
  endfm

view TrivToInt from TRIV to INT is 
  sort Elt to Int .
endv
  
fmod PerInt is
    protecting PAIR { TrivToInt , TrivToInt } .
endfm
  
red first( 5 , 6) .
     
fmod LIST{X :: TRIV} is

  sort List{X} .
  subsort X$Elt < List{X} .
  op nil : -> List{X} .
  op _ _ : List{X} List{X} -> List{X} [assoc id: nil] .

endfm
     
view TrivToPairInt from TRIV to PerInt is
  sort Elt to Per {TrivToInt , TrivToInt} .
endv

fmod ListPerInt is

  protecting LIST { TrivToPairInt } . 
   protecting LIST {TrivToInt } .
   op @first : List { TrivToPairInt} -> List {TrivToInt } . 
   op @second : List { TrivToPairInt} -> List { TrivToInt } . 
   var P : Per {TrivToInt, TrivToInt} .
   var L : List { TrivToPairInt } . 
   eq @first (P L) = first(P) @first(L) . 
   eq @first (nil) = nil .
   eq @second (P L) = second(P) @second(L) . 
   eq @second (nil) = nil .

endfm
  
red @first( (5,6) (4,3) (3,4)) .
       
  
view TrivToString from TRIV to STRING is
  sort Elt to String .
endv
  
fmod PerIntString is 
  protecting PAIR{ TrivToInt, TrivToString } .
endfm
  
view TrivToPerIntString from TRIV to PerIntString is 
  sort Elt to Per{ TrivToInt, TrivToString } .
endv
  
  
fmod LPIS is
  protecting LIST{ TrivToPerIntString } .
  protecting LIST{ TrivToInt } .
  protecting LIST{ TrivToString } .

  op @first_ : List{ TrivToPerIntString } ->
  		List{ TrivToInt } .
  op @second_ : List{ TrivToPerIntString } ->
		List{ TrivToString } .
  
  var P : Per { TrivToInt, TrivToString } .
  var L : List { TrivToPerIntString } . 
  
  
  eq @first ( P  L ) = first(P) @first(L) . 
   eq @first (nil) = nil .
   eq @second ( P L ) = second(P) @second(L) . 
   eq @second (nil) = nil .

endfm  
  
red @second( (1,"A") ( 2, "B" ) (1,"A") ( 2, "B" ) (1,"A") ( 2, "B" ) ) .

  
  
  
  
  
  
  
  
  
  
  
  
  
  

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   multiplica( [], _, _ ).
   multiplica( [Primul | Lista1], Numar, Lista2 ) :-
   repeta( Primul, Numar, Lista2 ) , 
   multiplica( Lista1, Numar, Lista2 ).
   
    
    
    
    
    
   