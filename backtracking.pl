% TODO : traducir y copiar esta parte de la referencia http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse6

%El predicado \=\2 toma 2 terminos y es verdadero solo si ambos terminos se pueden unificar.

% TODO : esto tambien http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse8

f(a).
f(b).

g(a).
g(b).

h(b).

k(X) :- f(X), g(X), h(X).

word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(verb,eats).
word(verb,likes).

writeS(X) :- write(X), write(' ').

sentence(Word1,Word2,Word3,Word4,Word5):-
   word(determiner,Word1),
   word(noun,Word2),
   word(verb,Word3),
   word(determiner,Word4),
   word(noun,Word5),
   writeS(Word1),writeS(Word2),writeS(Word3),writeS(Word4),write(Word5).


