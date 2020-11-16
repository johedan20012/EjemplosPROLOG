:- use_module('fiboRecursivo.pl'),use_module('fiboExpLog.pl',[]).

fibonacci(N):-
    write('Fibo de '),write(N),write(' es:\n'),
    write('Forma recursiva: '),
    fiboRecu:fibo(N,Res), write(Res), write('\n'),
    write('Forma explicita con exponenciacion logaritmica : '),
    fiboExpLog:fibo(N,Res1), write(Res1), write('\n').
    
    

    
