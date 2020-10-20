%Codigo del algoritmo de bubble sort 
/* PSEUDOCODIGO

    intercambio(Lista):
        si Lista esta vacia:
            regresa Lista
        si len(Lista) es 1:
            regresa Lista
        si Lista[1] <= Lista[0]:
            regresa Lista[1] u intercambio(Lista[0] u Lista[2 a len(Lista)-1])
        regresa Lista[0] u intercambio(Lista[1 a len(Lista)-1])
    
    bubbleSort(Lista,N,ACC) :
        si N <= 1:
            regresa ACC
        ACC1 = intercambio(ACC)
        regresa bubbleSort(Lista,N-1,ACC1)
*/

fill([],_,_,0).
fill([H|T],RMin,RMax,N) :-
    random(RMin,RMax,H),
    fill(T,RMin,RMax,X),
    N is X+1.

intercambio([],[]):- !.
intercambio([X],[X]):- !.
intercambio([H,H1|T],[H|T1]):-
    H =< H1,
    intercambio([H1|T],T1).
intercambio([H,H1|T],[H1|T1]):-
    H > H1,
    intercambio([H|T],T1).
accBubbleSort(_,N,ACC,ACC) :- N =< 1.
accBubbleSort(L,N,ACC,Res):-
    N1 is N-1,
    intercambio(ACC,ACC1),
    accBubbleSort(L,N1,ACC1,Res).
bubbleSort(L,N,Res):-
    accBubbleSort(L,N,L,Res).

ordenamientoAlAzar(NumElementos,RMin,RMax) :-
    RMin =< RMax,
    fill(Lista,RMin,RMax,NumElementos),
    write("La lista desordenada es"),writeln(Lista),
    bubbleSort(Lista,NumElementos,Res),
    write("La lista ordenada es "),writeln(Res).