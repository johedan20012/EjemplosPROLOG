% todo: Ya te la sandwich http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse9

% Con el predicado trace. se inicia prolog en modo trace, donde se muestra cada consulta paso por paso

descendiente(X,Y) :- hijo(X,Y).

descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y).

hijo(kevin,jose).
hijo(jose,luis).
hijo(luis,delfino).
hijo(delfino,ulises).

numeral(0).
numeral(succ(X)) :- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)) :-
        add(X,Y,Z).

greater_than(succ(X),0):-
        numeral(X).
greater_than(succ(X),succ(Y)) :-
        greater_than(X,Y).

swap(leaf(X),leaf(X)).
swap(tree(X,Y),tree(W,Z)):-
        swap(X,Z),
        swap(Y,W).  

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,Y) :- connected(X,Y).
path(X,Y) :-
        connected(X,Z),
        path(Z,Y).
