/* Terminos
Existen 3 tipos de terminos:
 
 1. Constantes. Estos pueden ser ya sea atomos (como vincent) or numeros (como 420)
 2. Variables. (Como X, Z3 y List)
 3. Terminos complejos. De la forma -> funtor(termino_1, termino_2, ..., termino_n)

*/

/* Unificacion
 
¿Qué es la unficación?

La unificación es un proceso que consiste en encontrar una asignación de variables que haga idénticas a las fórmulas que se desea unificar. Su resultado, el unificador, 
se expresa como un conjunto de pares sustitución/variable para cada una de las variables asignadas (este conjunto recibe también el nombre de substitución). 
El valor de sustitución para una variable puede ser cualquier término del lenguaje lógico utilizado (exceptuando términos con la misma variable). 
Por ejemplo, se pueden unificar las fórmulas

padre(X, hermano(Y))
padre(juan, Z)
utilizando el unificador { juan / X, hermano(Y) / Z }.


¿Cuándo ocurre la unificación?

En PROLOG, dos terminos se unifican si son el mismo termino o si contienen variables que puedan ser uniformemente instanciadas
de forma tal que los terminos resultantes sean iguales.

Ejemplos:
 ┌─────────────┬─────────────┬───────────────┐
 │ Termino 1   │ Termino 2   │ ¿Se unifican? │
 ├─────────────┼─────────────┼───────────────┤
 │    mia      │     mia     │       Si      │
 ├─────────────┼─────────────┼───────────────┤
 │    420      │     420     │       Si      │
 ├─────────────┼─────────────┼───────────────┤
 │ mujer(lola) │ mujer(lola) │       Si      │
 ├─────────────┼─────────────┼───────────────┤
 │ mujer(lola) │ mujer(pepe) │       No      │
 ├─────────────┼─────────────┼───────────────┤
 │    mia      │      X      │       Si      │
 ├─────────────┼─────────────┼───────────────┤
 │ mujer(lola) │  mujer(X)   │       Si      │
 ├─────────────┼─────────────┼───────────────┤
 │loves(pepe,X)│loves(X,lola)│       No      │
 └─────────────┴─────────────┴───────────────┘

¿Como hace la unificación PROLOG?

1. Si t1 y t2 son constantes, entonces t1 y t2 se unifican si y solo si son el mismo atomo, o el mismo número.

2. Si t1 es una variable y t2 es cualquier tipo de termino, entonces t1 y t2 se unifican, y t1 es instanciado a t2. Similarmente si t2
es una variable y t1 es cualquier tipo de termino, entonces t1 y t2 se unifican, y t2 es instanciado a t1. (Asi que si ambos son variables, ambos 
son instanciado el uno con el otro, y decimos que tienen valores compartidos)

3. Si t1 y t2 son terminos complejos, entonces se unifican si y solo si:
 3.1. Tienen el mismo funtor y aridad y 
 3.2. Todos sus argumentos correspondientes se unifican y
 3.3. Las instanciaciones de variables son compatibles(Por ejemplo, no es posible instanciar la variable X a mia cuando se unifica un par de argumentos, e instanciar X a vincent 
 cuando se unifica otro par de argumentos)

4. Dos términos se unifican si y solo si alguna de las 3 clausulas anteriores los unifica.

La ultima clausula quiere decir que para saber si dos terminos se unifican solo bastan las 3 primeras clausulas y nada mas, Por ejemplo: 
batman y color(rojo) no se unfican ya que ninguna de las 3 reglas dice como unificar una constante y un termino complejo.
*/

/* 

El predicado =/2 sirve para saber si dos terminos se unificarian, Por ejemplo:

=(maria,maria). ->Regresa TRUE

luis = luis. ->Regresa TRUE (notación infija)

'hola' = hola. ->Regresa TRUE

'2' = 2. ->Regresa FALSE

X = mia, X = vicent. ->Regresa FALSE 

k(s(g), t(k)) = k(X,t(Y)). ->Regresa TRUE y X = s(g), Y = k

!!!!!!!!!!!!!!!!!!!!!!INICIO DE NOTA IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!

Dado que prolog utiliza un algoritmo para la unificación que no es estandar, al ejecutar la siguiente query

fun(X) = X.   --->PROLOG se cicla ya que instancia X como fun(X) y ya que hay una X en el predicado fun(X) esa variable tambien se 
                  transforma en fun(X) lo que da como resultado que X se tenga que volver a instanciar pero ahora como fun(fun(X)), repitiendo 
                  el ciclo para siempre.

La mayoria de imprementaciones de PROLOG son optimistas(asumen que no estas menso como para programar eso), lo que contrasta con los algoritmos
estandar de unificación que son pesimistas(primero checan si ocurren errores y luego intentan unificar los terminos)

De todas formas existe : unify_with_occurs_check(father(X),X). --> El cual si regresa "NO" o FALSE

UPDATE: Esto no pasa en swiprolog.

!!!!!!!!!!!!!!!!!!!!!!FIN DE NOTA IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!
*/

%Esto sirve para hacer queries de unificacion y saber si 2 puntos hacen una linea vertical u horizontal
vertical(line(point(X,_),point(X,_))).  %La variable _ es anonima, se unifica con cualquier cosa sim problema y si aparece varias veces en el mismo termino podra referirse a valores distintos
horizontal(line(point(_,Y),point(_,Y))).


%Por ejemplo las sig queries daran los resultados:
/*
 vertical(line(point(1,2),point(1,8))). 
   TRUE

 horizontal(line(point(1,3),point(X,3))).
   TRUE

*/
