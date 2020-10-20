%Ejemplos de clausulas de Horn en forma logica y en PROLOG
/* Ejemplo 1

    Forma enunciado:
        Todo humano es mortal
    Forma lógica:
        humando(X) -> mortal(X)
    Forma PROLOG:
*/
humano(miguel).
humano(monica).

mortal(X):-
    humano(X).

/*  Ejemplo 2

    Forma enunciado:
        Si X es madre de Y y Z es hermano de X entonces Z es tio de Y
    Forma lógica:
        (madre(X,Y) & hermano(Z,X)) -> tio(Z,Y) 
    Forma PROLOG:      
*/
tio(Z,Y) :-
    madre(X,Y),
    hermano(Z,X).

madre(marisol,marco).
madre(marta,manuel).
hermano(mauricio,marta).
hermano(martin,marta).

/* Ejemplo 3

    Forma enunciado:
        A maria solo le gustan las personas que saben bailar. Una persona sabe bailar si toma clases de baile
    Forma logica:
        sabeBailar(X) -> leGusta(maria,X)
        tomaClases(X) -> sabeBailar(X)
    Forma PROLOG: 
*/
leGusta(maria,X) :- tomaClases(X).
tomaClases(marco).
/* Ejemplo 4

    Forma enunciado:
        La suma de dos números naturales X,Y es X si Y es cero, Y si X es cero o el número sucesivo de la suma X+(Y-1) 
    Forma logica:
        suma(0,Y,Y)
        suma(X,0,X)
        suma(X,Y,Z) -> suma(X,sucesivo(Y),sucesivo(Z))
    Forma PROLOG: 
*/

suma(0,Y,Y).
suma(X,0,X).
suma(X,sucesivo(Y),sucesivo(Z)):-
    suma(X,Y,Z).

/* Ejemplo 5

    Forma enunciado:
        En un grafo se dice que existe un camino entre 2 nodos(X,Y) si estan conectados directamente o existe un camino entre un nodo Z, que este 
        conectado directamente al nodo X, y el nodo Y.
    Forma logica:
        conectados(X,Y) -> camino(X,Y)
        conectados(X,Z) & camino(Z,Y) -> camino(X,Y)
    Forma PROLOG:
*/

conectados(1,2).
conectados(3,2).
conectados(3,4).
conectados(1,3).

camino(X,Y) :- conectados(X,Y).
camino(X,Y) :-
    conectados(X,Z),
    camino(Z,Y).

