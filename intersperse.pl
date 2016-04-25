/*Yi Cai 
  intersperse function takes a value and a list, and with an intersperse list L
  in which the value is "interspersed" into the given list. */


intersperse(X, [], []).
intersperse(X, [Y|[]], [Y]).
intersperse(X, [Y|L], [Y,X|L1]):-intersperse(X,L,L1).


/*start up a Prolog session simply by typing the command prolog.*/
