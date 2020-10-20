%Algoritmo recursivo del insertion sort en PROLOG
/* Pseudocodigo
    insertar(X, Lista) :
        si Lista esta vacia :
            regresar [X]
        si X es menor o igual a Lista[0] :
            regresar [X] u Lista
        regresar insertar(X,Lista[1 a len(Lista)-1])

    insertionSort(Lista) :
        si Lista esta vacia :
            regresar Lista
        Lista2 = insertionSort(Lista[1 a len(Lista)-1])
        regresar insertar(Lista[0],Lista2).
*/
fill([],_,_,0).
fill([H|T],RMin,RMax,N) :-
    random(RMin,RMax,H),
    fill(T,RMin,RMax,X),
    N is X+1.

insertar(X, [], [X]):- !.
insertar(X, [X1|L1], [X, X1|L1]):- X=<X1, !.
insertar(X, [X1|L1], [X1|L]):- insertar(X, L1, L).

insertionSort([], []):- !.
insertionSort([X|L], S):- insertionSort(L, S1), insertar(X, S1, S).

ordenamientoAlAzar(NumElementos,RMin,RMax) :-
    RMin =< RMax,
    fill(Lista,RMin,RMax,NumElementos),
    write("La lista desordenada es"),writeln(Lista),
    insertionSort(Lista,Res),
    write("La lista ordenada es "),writeln(Res).

