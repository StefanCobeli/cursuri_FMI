append( [] , Element, [ Element ] ) .
append( [ Element1 | Lista1 ], Element, [ Element, Element1 | Lista2 ] ) :-
         append( Lista1, Element1, [ Element1 | Lista2 ]  ) .

sterge(X,[X|Tail],Tail).
    
sterge(X,[Y|Tail],[Y|Tail1]):-
        sterge(X,Tail,Tail1).


%comments
%sa se stearga prima aparitie a unui
%element din lista L delete(Elem, Lista, ListaRezultat)

%sterge_toate( X, )


permutare( [] , [] ) . 
permutare( [Head|Tail] , ResultList ) :- permutare( Tail, Result1 ),
                           sterge( Head, ResultList, Result1 ).



%list_perm( List, List_perm )


%% Minimul pentru o lista %%%minim( List, ElementMin ) dintr-o lista nevida
%%Apoi vrem elementul de pe o anumita pozitie.
%Apoi inserare pe o anumita pozitie
%Apoi interclasare
%imparte_lista( Lista, Prima_jumatate, Doua_jumatate) . Ne ajuta la mergeSort
%merge_sort( Lista, Result_List )


invers( [ ] , [ ] ).
invers( [ Head | Lista ], ListaRezultat ) :-
            invers( Lista ,  ListaRezultat1 ), 
            append( ListaRezultat1,[Head], ListaRezultat ) .


%%%%%%%%%%%%%%%%%%%%%%

minim( [H | []] , H ) . 
%%Merge si minim( [H] , H ) 
minim( [Head | Lista], Rezultat ) :- minim( Lista, Rezultat ),
                                    Head >= Rezultat .   
minim( [Head | Lista], Head ) :- minim( Lista, Rezultat ),
                                 Head < Rezultat.


%%%%%%%%%%%%%%%%%%%

element_pozitie( [ H | _ ], 1 , H ).
element_pozitie( [ _ | Lista ], Pozitie, Element ) :-
                              Pozitie >= 2, Next_Poz is Pozitie - 1,
                              element_pozitie( Lista, Next_Poz, Element ).

%%%%%%%%%%%%%%%%%%%%%


inserare_element( Lista, Element, 1, [ Element | Lista ] ).
inserare_element( [Head | Lista], Element, Pozitie, [Head | Lista_Rezultat] ) :-
   Pozitie >= 2, Pozitie_Urmatoare is Pozitie - 1,
   inserare_element( Lista, Element, Pozitie_Urmatoare,  Lista_Rezultat ).
         
         
         
         
         




%%De completat acasa. Daca nu ies, vorbim data viitoare

%divide(Lista, Element, Elemente_maimicidecatElement, Celelalteelemente)
%quicksort(Lista, Lista_Rezultat)
%insert(Element, ListatSortata, ListaRezultat)
%sortare_ins( Lista, ListaRezultat )
%sortare_prin_selectia_minimului( Lista, ListaRezultat )


divide( [], _, [], [] ) .

divide( [ First | Rest ] , Pivot, [ First | Smaller ], Larger ) :-
   First < Pivot, divide( Rest, Pivot, Smaller, Larger ) .
divide( [ First | Rest ] , Pivot, Smaller, [ First | Larger ] ) :-
   First >= Pivot, divide( Rest, Pivot, Smaller, Larger ) .

append( [ ], List, List ) .
append( [ H | List1 ], List2, [ H | List3 ] ) :- 
         append( List1, List2, List3 ) .
append( List1 , [ H | List2 ], [ H | List3 ] ) :-
         append( List1, List2, List3 ) .

         
   

quick_sort( [ First | List ], Ordered ) :-
      divide( List, First, Smaller, Larger ), 
      quick_sort( Smaller, Smaller1 ),
      quick_sort( Larger, Larger1 ),
      append( Smaller1, [ First | Larger1 ], Ordered ) .
quick_sort( [  ] , [ ] ) .
      
   
   %%%De ce nu merge???
%%%divide( [ First | Rest ], Pivot, Smaller, Larger) :-
   %%%First >= Pivot, push( Larger, First, Larger ).
%%%divide( [ First | Rest ], Pivot, Smaller, Larger) :-
   %%%First =< Pivot, push( Smaller, First, Smaller ) .

interclasare( [], [], [] ) .
interclasare( )                .
                              
                              
%inserare( Lista, Elment, Pozitie ) :- Pozitie >=
%interclasarea       
                     

swap( [ X ], [ X ] ) .
swap( [ First, Second | Rest ], [ First | Rest1 ] ) :-
         First =< Second, swap( [ Second | Rest ], Rest1 ) .
swap( [ First, Second | Rest ], [ Second, First | Rest ] ) :-
         First > Second .

%%%buble

bubblesort ( List, SortedList) :-
    swap ( List, List1 ), ! ,
    bubblesort ( List1, SortedList) .
bubblesort ( List, List).

                     
                              
                              
                              
                              
                              
                              
                              
                              