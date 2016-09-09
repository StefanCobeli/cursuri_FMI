fmod LIST-INT2 is
  
  protecting INT .
  sorts NList List .
  subsort Int < NList < List .

  op nil : -> List .
  op _ _ : Int List -> NList [id: nil] .
  op length : List -> Int .
  op _in_ : Int NList -> Bool .
  op append : List List -> List .
  op rev : List -> List .
  op insertionSort : List -> List .
  op insert : Int List -> NList .
  
  op interclasare : List List -> List [ comm ] .
  
  
  var Empty1 Empty2 : List .
  var Number1 Number2 : Int .
  var NotEmpty1 NotEmpty2 : NList .
  
  
  
  
  *** Lungimea
  eq length( nil ) = 0 .
  eq length( Number1 Empty1 ) =
  		1 + length( Empty1 ) .  
  
  *** Apartenenta
  ceq Number1 in Number2 Empty1 = true
    if	Number2 == Number1 or
  		Number1 in Empty1 .
  eq Number1 in NotEmpty1 = false .
  
  *** Concatenarea
  eq append( nil, Empty1 ) = Empty1 .
  eq append( Number1 Empty1, Empty2 ) = 
    Number1 append( Empty1, Empty2 ) .
  
  ***Inversarea
    
  eq rev( Number1 Empty1 ) = append( rev( Empty1 ), Number1 ) .
  eq rev( nil ) = nil .
  
  ***Sortare Insertie
  
  eq insertionSort( Number1 ) = Number1 .
  eq insertionSort( Number1 Empty1 ) = 
  		insert( Number1, insertionSort( Empty1 ) ) .
  eq insert( Number1, nil ) = Number1 .
  
  ceq insert( Number1, Number2 Empty1 ) = Number2 insert( Number1, Empty1 ) 
  			if Number2 < Number1 .
  ceq insert( Number1, Number2 Empty1 ) = Number1 ( Number2 Empty1 ) 
  			if Number2 >= Number1 .
  
  
  ***Merge Sort
  
***  eq mergeSort( NotEmpty1, NotEmpty2 ) = interclasare( NotEmpty1, NotEmpty2 ) .
   
***ceq interclasare( Number1, Number2 ) = Number1 Number2 if Number1 < Number2 .

  *** Am ramas doar cu interclasarea.
  
  eq interclasare( nil, Empty1 ) =  Empty1 .
  
  ceq interclasare( Number1 Empty1, Number2 Empty2 ) = 
  		Number1 interclasare( Empty1, Number2 Empty2 ) if
  		Number1 < Number2 .
  ceq interclasare( Number1 Empty1, Number2 Empty2 ) = 
  		Number2 interclasare( Number1 Empty1, Empty2 ) if
  		Number1 >= Number2 .
  
  
endfm

***red length( 1 2 3 9 8 ) .
***red 2 in 1 2 3 .
***red append( nil, 2 3 ) .
***red rev( 1 2 ) .
red insertionSort( 2 3 10 9 8 10 1 ) .
red interclasare( 1 4 7, 2 3 8 ) .




