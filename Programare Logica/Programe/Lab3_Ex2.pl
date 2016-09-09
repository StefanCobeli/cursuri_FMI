fmod LIST-INT3 is
  
  protecting INT .
  sort List .
  subsort Int < List .
  
  op nil : -> List .
  op _ _ : List List -> List [assoc id: nil] .
  op length : List -> Int .
  op _in_ : Int List -> Bool .
 *** op split : List -> List List .
  op rev : List -> List .
  op insert : Int List -> List .
  op insertionSort : List -> List .
  op interclasare : List List -> List .
  op rotire : List Int -> List .
  
  var List1 List2 : List .
  var Number1 Number2 : Int .
  
  
  ***Lungimea
  ***eq length( nil ) = 0 .
  eq length( Number1 ) = 1 .
  eq length( List1 List2 ) = 
  	length( List1 ) + length( List2 ) .
  
  ***Apartenenta
  
  ceq Number1 in Number2 List1 = true 
  		if Number1 == Number2 
  		or Number1 in List1 .
  eq Number1 in List1 = false .
  
 *** eq Number1 in List1 List2 = Number1 in List1 or Number1 in List2 .
  
  ***Inversarea
  ***eq rev( nil ) = nil .
  eq rev( Number1 ) = Number1 .
  eq rev( Number1 Number2 ) = Number2 Number1 .
  eq rev( List1 List2 ) = rev( List2 ) rev( List1 ) .
  
  
  *** Insertion Sort
  
  eq insertionSort( nil ) = nil .
  eq insertionSort( Number1 List1 ) = 
  		insert( Number1, insertionSort( List1 ) ) .
  eq insert( Number1, nil ) = Number1 .
  ceq insert( Number1, Number2 List1 ) = Number1 ( Number2 List1 ) if
  		Number1 < Number2 .
  ceq insert( Number1, Number2 List1 ) = Number2 insert( Number1, List1 ) if
  		Number1 >= Number2 .
   
   
  ***interclasare
  
  ceq interclasare( Number1 List1, Number2 List2 ) = 
  			Number1 interclasare( List1, Number2 List2 ) if
  			Number1 < Number2 .
  eq interclasare( Number1 List1, Number2 List2 ) = 
  	  	Number2 interclasare( Number1 List1, List2 ) .
  eq interclasare( nil, List1 ) = List1 .
***  eq interclasare( List1, nil ) = List1 .

  *** 
  
  ***split_right elemente de pe pozitii pare
  
  
  ***swap doua pozitii
  ***Raman de implementat insertElementInListAtPosition si getFromPosition
  
  eq swap( List1, Pozitie1, Pozitie2 ) = 
  		insertElementInListAtPosition( 
  				getFromPosition( Pozitie2, List1 ),
  				insertElementInListAtPosition(
  						getFromPosition( Pozitie1, List1 ) ,
  						List1,
  						Pozitie2 ),
  				Pozitie1 ) .
  
  
  
  
  

endfm

red length( 1 2 6 ) .
red rev( 1 2 4 6 9 ) .
red 1 in 4 2 3 1 7 7 .
red insertionSort( 2 1 3 6 -1 -10 0  ) .