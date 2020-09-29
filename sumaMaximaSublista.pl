%Esta es la forma recursiva del algoritmo de kadane para encontrar el valor de la suma maxima de un sub arreglo
/* Ejemplos

    Entrada        Salida       Descripción
 ┌─────────────┬─────────────┬─────────────────────────────────┐
 │3,-1,4,-1,-10│     6       │ Se suma el sub arreglo [3,-1,4] │
 ├─────────────┼─────────────┼─────────────────────────────────┤
 │ -1,1,2,3,-4 │     6       │ Se suma el sub arreglo [1,2,3]  │
 └─────────────┴─────────────┴─────────────────────────────────┘
*/

accMaximo([],ACC,ACC).
accMaximo([H|T],ACC,RES) :-
    H > ACC,
    accMaximo(T,H,RES).
accMaximo([H|T],ACC,RES) :-
    H =< ACC,
    accMaximo(T,ACC,RES).
maximo([H|T],RES):-          
    accMaximo([H|T],H,RES). %Este predicado se sostiene si RES es el numero maximo de la lista [H|T]

%El predicado max se sostiene si el tercer parametro es el numero más grande de los otros 2
max(A,B,A) :- A > B.
max(A,B,B) :- A =< B.

kadane([],_,MaxGlobal,MaxGlobal).
kadane([H|T],MaxLocal,MaxGlobal,RES) :-
    Aux is H + MaxLocal,
    max(H,Aux,NuevoMaxLocal),
    max(NuevoMaxLocal,MaxGlobal,NuevoMaxGlobal),
    kadane(T,NuevoMaxLocal,NuevoMaxGlobal,RES).

sumaMaxima(Lista,Res) :-
    maximo(Lista,MaxGlobal),
    kadane(Lista,0,MaxGlobal,Res).