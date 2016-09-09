%% Exercitiul 1 lab 4
prefix( [], _ ) .
prefix( [ Head | Rest ], [ Head | OtherRest] ) :- prefix( Rest, OtherRest ) . 

remove_prefix( [], List, List ).
remove_prefix( [ Head | Rest ], [ Head | OtherRest ], Result ) :-
         remove_prefix( Rest, OtherRest, Result ).


multiple_concat( List, 1, List ) .
multiple_concat( List, Number, Result) :- Number1 is Number - 1, 
         multiple_concat( List, Number1, Result1 ),  
         remove_prefix( List, Result, Result1 ) .
         
         
         
         
         
%%%%%%%%Toate perechile de elemente din Lista


apartine( E, [ E | T ] ) .
apartine( Element, [ Cap | Lista ] ) :- apartine( Element, Lista ) . 


numar_de_aparitii( Element, [], 0 ) .
numar_de_aparitii( Element, [ Element | Lista ], Numar ) :- 
            numar_de_aparitii( Element, Lista, Numar1 ), Numar is Numar1 + 1 .



numar_de_aparitii( Element, [ Primul | Lista ], Numar ) :- 
                     numar_de_aparitii( Element, Lista, Numar ) .
                     
                     
extrageElement(Element, [], []) .
extrageElement(Element, [Element| Lista], Lista1) :- extrageElement(Element, Lista, Lista1) .
extrageElement(Element, [Primul | Lista], [Primul | Lista1] ) :- extrageElement(Element, Lista, Lista1) .                     


                                    
aparitii( [ Primul | Lista ], ListaAparitii ) :-  
            numar_de_aparitii( Primul, [ Primul | Lista ], Numar ), !,
            apartine( [ Primul , Numar ], ListaAparitii ),
            extrageElement( Primul,  Lista, ListaFaraPrimul ),
            extrageElement( [ Primul, Numar ], ListaAparitii, ListaAparitii2 ),
            aparitii( ListaFaraPrimul, ListaAparitii2 )  .
aparitii( [], _ ) .
%%%%%%%%% De cate ori apare fiecare element ex3 lab 4

count_occurrences(List, Occ):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ).










numar_de_aparitii( Element, [], 0 ) .
numar_de_aparitii( Element, [ Element | Lista ], Numar ) :- 
                     numar_de_aparitii( Element, Lista, Numar1 ),
                     Numar is Numar1 + 1 .
numar_de_aparitii( Element, [ Primul | Lista ], Numar ) :- 
                     numar_de_aparitii( Element, Lista, Numar ) .

                     
pereche_apartine2(  )
                     
aparitii( [ Primul | Lista1 ], ListaAparitii ) :-  
            numar_de_aparitii( Primul, Lista1, Numar ),
            apartine( [ Primul , Numar ], ListaAparitii ).
            


%%%aparitii( Lista, Aparitii )



%%%%%% Verifica daca lista de paranteze este ok

contor( [ '[' | Lista ], ContorVechi ) :- ContorNou is ContorVechi + 1,
                           
                           contor( Lista, ContorNou ),
                           ContorNou >= 0.

contor( [ ']' | Lista ], ContorVechi ) :- ContorNou is ContorVechi - 1,
                           
                           contor( Lista, ContorNou ),
                           ContorNou >= 0.

contor( [ ], 0 ) .

inchise_corect(Lista) :- contor( Lista, 0 ) .

%%%%%%%%%%%%%%%%%%%%%%



linie_buna( [ ] ) .

linie_buna( [ Head | Current_row ] ) :- 
                     nu_apare( Head, Current_row ),
                     linie_buna( Current_row ) .

                     
nu_apare( _, [ ] ) .
nu_apare( Element, [ Head | Rest ] ) :- Element \= Head,
                        nu_apare( Element, Rest ) .

transpusa([], []).
transpusa([F|Fs], Ts) :-
    transpusa(F, [F|Fs], Ts).

transpusa([], _, []).
transpusa([_|Rs], Ms, [Ts|Tss]) :-
        lists_firsts_rests(Ms, Ts, Ms1),
        transpusa(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        lists_firsts_rests(Rest, Fs, Oss).
                        
sudoku_validator( [ Current_row | Rows ] ) :- linie_buna( Current_row ),
                                 sudoku_validator( Rows ), 
                                 sudoku_validator( transpusa( [ Current_row | Rows ] ) ) .








