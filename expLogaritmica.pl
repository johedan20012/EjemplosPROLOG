%Version recursiva del algoritmo para la exponensiación logaritmica de un número real con exponente natural
/* Ejemplos

    Entrada        Salida       Descripción
 ┌─────────────┬─────────────┬────────────────────┐
 │   2,2       │     4       │ 2^2 = 2*2 = 4      │
 ├─────────────┼─────────────┼────────────────────┤
 │   5,3       │    125      │ 5^3 = 5*5*5 = 125  │
 ├─────────────┼─────────────┼────────────────────┤
 │   3,4       │     81      │ 3^4 = 3*3*3*3 = 81 │
 ├─────────────┼─────────────┼────────────────────┤
 │   1,4       │     1       │ 1^4 = 1*1*1*1 = 1  │
 └─────────────┴─────────────┴────────────────────┘

------------------------------------INICIO NOTA IMPORTANTE----------------------------
Para exponentes mayores a 1,000,000 recomiendo modular la respuesta ya que puede tomar mucha memoria la multiplicacion
de numeros enormes.

Reemplazar las 2 lineas: 
    -1. Res is Base*Res1   -> Por la linea  -> Res is Mod(Base*Res1,100000009) 
    -2. Res is Res1*Res1   -> Por la linea  -> Res is mod(Res1*Res1,100000009).
------------------------------------FIN NOTA IMPORTANTE-------------------------------
*/
potencia(Base,1,Base).
potencia(Base,Exp,Res) :-
    1 is mod(Exp,2),
    NuevoExp is Exp-1,
    potencia(Base,NuevoExp,Res1),
    Res is Base*Res1.
potencia(Base,Exp,Res) :-
    0 is mod(Exp,2),
    NuevoExp is div(Exp,2),
    potencia(Base,NuevoExp,Res1),
    Res is Res1*Res1.