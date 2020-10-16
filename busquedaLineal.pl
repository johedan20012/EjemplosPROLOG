%Algoritmo de busqueda lineal de un elemento dentro de una lista, esta hecho en forma recursiva con cola
%esto es para simular un ciclo iterativo (for)
fill([],_,_,0).
fill([H|T],RMin,RMax,N) :-
    random(RMin,RMax,H),
    fill(T,RMin,RMax,X),
    N is X+1.

accBusqueda(_,[],_,0) :- !.
accBusqueda(X,[X|_],ACC,ACC) :- !.
accBusqueda(X,[_|T],ACC,Res) :-
    ACC2 is ACC+1,
    accBusqueda(X,T,ACC2,Res).

busquedaLineal(Elemento,Lista,Posicion) :-
    accBusqueda(Elemento,Lista,1,Posicion).

 busquedaAlAzar(NumElementos,RMin,RMax) :-
    RMin =< RMax,
    random(RMin,RMax,Elemento),
    fill(Lista,RMin,RMax,NumElementos),
    busquedaLineal(Elemento,Lista,Res),
    write("El elemento "),write(Elemento),write(" esta en el indice "),writeln(Res).
    


