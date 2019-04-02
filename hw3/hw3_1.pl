divisible(X,Y):-0 is X mod Y.

divisible(X,Y):-X > Y+1, divisible(X,Y+1).

isPrime(2):-true.
isPrime(X):-X<2,false.
isPrime(X):-not(divisible(X,2)).

goldbach(4,[2,2]) .
goldbach(N,L) :- 0 is N mod 2, N > 4, goldbach(N,L,3).

goldbach(N,[P,Q],P) :- Q is N - P, isPrime(Q), !.
goldbach(N,L,P) :- P < N, next_prime(P,P1), goldbach(N,L,P1).

next_prime(P,P1) :- P1 is P + 2, isPrime(P1), !.
next_prime(P,P1) :- P2 is P + 2, next_prime(P2,P1).


main :- 
  nl,
	repeat, 
	write('input:'),
	readln([Ans|_]),
	goldbach(Ans,[C1,C2]),
	write('output:'),
	write(C1),write(' '),
	writeln(C2),
	fail.
