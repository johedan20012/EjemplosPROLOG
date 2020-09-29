%Algoritmo recursivo de MergeSort en forma normal y con el uso de recursión de cola

unirListas([],L,L).
unirListas([H|T],L2,[H|L3]) :- 
    unirListas(T,L2,L3).

len([],0).
len([_|T],N) :-
    len(T,X),
    N is X+1.

mezclarListas(Lista,[],Lista).
mezclarListas([],Lista,Lista).
mezclarListas([H|T],[H1|T1],[H|Res1]) :-
    H1 > H,
    mezclarListas(T,[H1|T1],Res1).
mezclarListas([H|T],[H1|T1],[H1|Res1]) :-
    H1 =< H,
    mezclarListas([H|T],T1,Res1).

mergeSort([],[]).
mergeSort([X], [X|[]]).
mergeSort(L,Res) :-
    len(L,N),
    N > 1,
    N1 is div(N,2),
    N2 is N-N1,
    len(Izquierda,N1),
    len(Derecha,N2),
    append(Izquierda,Derecha,L),
    mergeSort(Izquierda, ResIz),
    mergeSort(Derecha, ResDer),
    mezclarListas(ResIz,ResDer,Res).