

%%%inordine SRD 
%%%SDR pre
%%%RSD post
%%%tree(T) :- T = tree(f, tree(b, tree(a,void,void), tree(d,tree(c,void,void),tree(e,void,void))), tree(g, void, tree(i, tree(h,void,void),void))).

parcurgere_in( tree(void,X,void)) :- write(X), ! .
parcurgere_in( tree( S, R, D ) ) :- parcurgere_in( S ), write( R ), parcurgere_in( D ) .


parcurgere_pre( tree(void,X,void)) :- write(X), ! .
parcurgere_pre( tree( S, R, D ) ) :- parcurgere_pre( S ),  parcurgere_pre( D ), write( R ) .


parcurgere_pos( tree(void,X,void)) :- write(X), ! .
parcurgere_pos( tree( S, R, D ) ) :- write( R ), parcurgere_pos( S ), parcurgere_pos( D ) .

%%%%%%%%%cel mai mare numar

minim( tree( S, R, D ), Minim ) :- minim( S, Minim ) , minim( D, Minim ), R =< Minim . 

minim( tree( void, R, void ), R ) .

%%%%%%%%%%%%%%%%%%%terminale

append( [], [], [] ) .

append( [ Primul | Lista1 ], Lista2, [Primul | Lista3] ) :-
                  append( Lista1, Lista2, Lista3 ) .

append( [] , [ Primul | Lista2 ], [Primul | Lista3] ) :-
                  append( [], Lista2, Lista3 ) .


terminale( nil, [] ) .
terminale( t( X, nil, nil ), [ X ] ) .

terminale( t( R, S, D ), Lista ) :- 
            terminale( D, Lista2 ),
            terminale( S, Lista1 ),
            append( Lista1, Lista2, Lista ) .
        
extragereNeterminale(nil, []).
extragereNeterminale( t( nil, R, nil), [] ) .
extragereNeterminale( t(S, R, D), [R | Lista ] ) :- extragereNeterminale(S, L1) , extragereNeterminale(D, L2), unesteListe(L1,L2, Lista)         
%%%%%%%%%%%%%%%%%%%%%%inaltime

inaltime( nil, 0 ) .
inaltime( t( R, S, D ) , Inaltime ) :- inaltime( S, Inaltime1 ), Inaltime is Inaltime1 + 1 .

inaltime( t( R, S, D ) , Inaltime ) :-  inaltime( D, Inaltime1 ), Inaltime is Inaltime1 +1  .


%%%%%%%%%%%%%toate muchiile

familie( t( R, t( Rs, _, _) , D), [ R, Rs ] ) . 
familie( t( R, S , t( Rd, _, _ ) ), [ R, Rd ] ) .
familie( t( R, S, D ), Familie ) :- familie( S, Familie ); familie( D, Familie) .  
familie( t( R, nil, nil ), [] ) .

toate_muchiile( Arbore, Lista ) :-
            bagof( Familie, familie( Arbore, Familie ), Lista ).




%%%%%%%%%%%%%%%%%%%%%laboratorul6

lungime( [] , 0 ) .
lungime( [ Head | Tail ], Lungime  ) :- lungime( Tail, Lungime1) , Lungime is Lungime1 + 1 .

numar_de_frunze( Arbore, Numar ) :- terminale( Arbore, Frunze ), lungime(Frunze, Numar) .
numar_de_neterminale( Arbore, Numar ) :- neterminale( Arbore, Neterminale ),
                           lungime( Neterminale, Numar ) .

numar_total_de_noduri( Arbore, Numar ) :- numar_de_frunze( Arbore, Numar1 ),
                  numar_de_neterminale( Arbore, Numar2 ), Numar is Numar1 + Numar2 .

%%2 media ponderata

medie_ponderata( [], 0 ) .
medie_ponderata( [ Primul/Pondere | Restul], Medie ) :-
               Pondere > 0, Element is Pondere * Primul,
               medie_ponderata( Restul, Medie1 ),
               Medie is Medie1 + Element.

medie_ponderata( [ Primul/Pondere | Restul], Medie ) :-
               medie_ponderata( Restul, Medie ) .
               
%%%%3

multiplii_radacinii( nil, _, [] ) .

multiplii_radacinii( t( R, S, D ), Radacina, [ R | Lista ] ) :-
            R is R / Radacina * Radacina,
            multiplii_radacinii( D, Radacina, Lista2 ),
            multiplii_radacinii( S, Radacina, Lista1 ),
            append( Lista1, Lista2, Lista ) .

multiplii_radacinii( t( R, S, D ), Radacina, Lista ) :-
            multiplii_radacinii( D, Radacina, Lista2 ),
            multiplii_radacinii( S, Radacina, Lista1 ),
            append( Lista1, Lista2, Lista ) .


divizorii_radacinii( nil, _, [] ) .

divizorii_radacinii( t( R, S, D ), Radacina, [ R | Lista ] ) :-
            Radacina is Radacina / R * R,
            divizorii_radacinii( D, Radacina, Lista2 ),
            divizorii_radacinii( S, Radacina, Lista1 ),
            append( Lista1, Lista2, Lista ) .

divizorii_radacinii( t( R, S, D ), Radacina, Lista ) :-
            divizorii_radacinii( D, Radacina, Lista2 ),
            divizorii_radacinii( S, Radacina, Lista1 ),
            append( Lista1, Lista2, Lista ) .

            
predicat( t( Radacina, ArboreS, ArboreD ), MultipliiRadacinii, DivizoriiRadacinii ) :-
               multiplii_radacinii( t( Radacina, ArboreS, ArboreD ), MultipliiRadacinii, Radacina ),
               divizorii_radacinii( t( Radacina, ArboreS, ArboreD ), DivizoriiRadacinii, Radacina ) .


%%%%minimul in arbore

minim( X1, X2, X3, X1 ) :- X1 =< X2, X1 =< X3 .
minim( X1, X2, X3, X2 ) :- X2 < X1, X2 < X3 .
minim( X1, X2, X3, X3 ) .

minim_arbore( t( R, nil, nil ), R ) .
minim_arbore( t( R, S, D ), Minim ) :-
                     minim_arbore( S, Minim1 ),
                     minim_arbore( D, Minim2 ),
                     minim( Minim1, Minim2, R, X ),
                     X > Minim           .



                     
                     
                     
                     
                     
                     
                     











            



































  
