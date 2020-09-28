%Comentario de una linea

/*Comentario de varias lineas
  Linea 2
  Linea 3
  Linea 4
*/

/* Caracteres basicos

Letras mañusculas : A,B,..,M,N,O,...,Z
Letras minusculas : a,b,..,m,n,o,...,z
Digitos : 0,1,...,9
Guion bajo : _
Caracteres especiales : + - * / < > = : . & ~
Espacio :  

Caracteres : Letras mañusculas, Letras minusculas, Digitos, Guion bajo, Caracteres especiales y Espacio

*/

% Una cadena es una secuencia sin romper(unbroken) de caracteres.

/* Atomos

Un atomo puede ser:
 1. Una cadena de caracteres hecha por letras mañusculas, minusculas, digitos
 y el guion bajo, que empieza por una letra minusula. Por ejemplo : butch, big_burger, hello2TheClass y im2Cool4thisPlannet

 2. Una secuencia arbitraria de caracteres enmedio de comillas simples. Por ejemplo 'Vincent', 'The thing', '#$%!%', 'Hello world2' y ' '
 la secuencia de caracteres enmedio de las comillas simples es llamada el Nombre del atomo

 3. Una cadena de caracteres especiales. Por ejemplo: @= y ====> y ; y :- son todos atomos.
 Como se puede ver, algunos de estos atomos, tal como ; y :- tienen un significado predefinido.
*/

/* Números

Los números reales no son necesariamente importantes en PROLOG, asi que apesar de que algunas implementaciones soporten números de
punto flotante, realmente no son muy usados.

Pero los enteros (...,-2,-1,0,1,2,...) son utiles para tareas como contar los elementos de una lista, entre otras cosas,
su sintaxis no es mas que la obvia: 23, 1001, 0, -365 y asi.

*/


/* Variables 

Una variable es una cadena de letras mañusculas, minusculas, digitos y el guion bajo que inicia ya sea con una
letra mañuscula o un guion bajo. Por ejemplo: X, Y, Variable, _tag, X_526, List, List24, _head, Tail, _input y Output.

La variable _ (solo eso, un guion bajo) es algo especial. Se llama la variable anonima.

*/

/* Terminos complejos

Los terminos complejos estan hechos de un funtor seguido por una secuencia de argumentos, los cuales son puestos entre parentesis
ordinarios, separados por comas, y puestos despues deñ funtor. Nota: El funtor tiene que tener directamente los parentesis sin espacios vacios enmedio.

*/

killer('Butch').

married('Mia','Marsellus').

dead('Zed').

tasty(apple).
tasty(popcorn).
nutritious(lettuce).
nutritious(tomatoe).

kill('Butch',X) :- footmassage(X,'Mia').

loves('Mia',X) :- gooddancer(X).

eat('Jules',X) :- nutritious(X).
eat('Jules',X) :- tasty(X).

% Compila programa: qsave_program(sal, [stand_alone(true), goal(main)])