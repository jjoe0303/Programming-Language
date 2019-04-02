:-dynamic is_connect/2.
:-dynamic bi_connect/2.
%is_connect(1,2).
%is_connect(2,1).
%is_connect(2,3).
%is_connect(3,2).
%is_connect(3,1).
%is_connect(1,3).
%is_connect(4,5).
%is_connect(5,4).
%is_connect(5,6).
%is_connect(6,5).
%is_connect(6,1).
%is_connect(1,6).

%bi_connect(X,Y):- is_connect(X,Y).
%bi_connect(X,Y):- is_connect(Y,X).
is_reach(X,Y,visited) :- is_connect(X,Y).
is_reach(X,Y,V) :- 
		is_connect(X,X1),
		not(member(X1,V)),
		(
			Y=X1
			;
			is_reach(X1,Y,[X|V])
		).

link(X,Y):-
	(
	X==Y->writeln('Yes');
	is_reach(X,Y,[])->writeln('Yes');
	writeln('No')
	).

prolog_while(Nn) :-
	( Nn==0->
		true
		;
		%read(A),
		%read(C),
		readln([A|B]),
		B = [C|[]],
	%	write(A) , write(' '),
	%	writeln(C),
	%	writeln(Nn),
		assert(is_connect(A,C)),
		assert(is_connect(C,A)),
		Nn1 is Nn -1,
		prolog_while(Nn1)
	).

prolog_que(N,Num) :-
	( N==0->
		true
		;
		readln([A|B]),
		B=[C|_],
		link(A,C),
		N1 is N -1,
		prolog_que(N1,Num)
		
	).

main :- 
  nl,
	writeln("input:"),
	%read(Num),
	%read(Edge),
	readln([Num|Z]),
	Z = [Edge|[]],
%	write(Num),write(' '),writeln(Edge),
	prolog_while(Edge),
	writeln('query:'),
	readln([Q|_]),
	prolog_que(Q,Num),
	!.
					 
					 

