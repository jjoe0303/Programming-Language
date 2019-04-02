:-dynamic is_parent/2.
is_ancestor(X,Y) :- is_parent(X,Y).
is_ancestor(X,Y) :- is_parent(X,X1),is_ancestor(X1,Y).

lca(X,Y):-
	X==Y->writeln(X);
	is_ancestor(X,Y)->writeln(X);
	is_parent(X1,X),lca(X1,Y).


init(N) :-
	( N==0->
		true
		;
		is_parent(N,N),
		N1 is N -1,
		init(N1)
		
	).

prolog_while(Nn) :-
	( Nn==0->
		true
		;
		
		readln([A|B]),
		B = [C|[]],
	%	write(A) , write(' '),
	%	writeln(C),
	%	writeln(Nn),
		assert(is_parent(A,C)),
		Nn1 is Nn -1,
		prolog_while(Nn1)
		
	).
prolog_que(N) :-
	( N==0->
		true
		;
		readln([A|B]),
		B = [C|[]],
	%	write(A) , write(' '),
	%	writeln(C),
		lca(A,C),
		N1 is N -1,
		prolog_que(N1)
		
	).

main :- 
  nl,
	writeln("input n:"),
	readln([Num|_]),
	%write('num='),writeln(Num),
	Num1 is Num-1,
	prolog_while(Num1),
	writeln('query:'),
	readln([Q|_]),
	prolog_que(Q),
	!.
					 
					 

