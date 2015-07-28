/**
* Programming Languages Homework 4: Prolog Rules
* July 26 2015
* Alex Pine
*/

% Question 1
user(@alex).
user(@betsy).
user(@ryan).
user(@jill).
user(@joe).

% Question 2
follows(@alex, @betsy).
follows(@alex, @ryan).
follows(@betsy, @jill).
follows(@ryan, @jill).
follows(@ryan, @joe).
follows(@jill, @joe).
follows(@joe, @ryan).

% Question 3
tweet(@alex, 1, [we, like, twitter]).
tweet(@alex, 2, [you, like, twitter]).
tweet(@betsy, 3, [not, into, twitter]).
tweet(@ryan, 4, [food, is, good]).
tweet(@jill, 5, [football, football]).
tweet(@jill, 6, [ack, ack, ack]).
tweet(@joe, 7, [i, like, cats]).
tweet(@joe, 8, [reddit, is, dumb]).
tweet(@joe, 9, [bro, ironically]).

% Question 4
retweet(@jill, 7).
retweet(@betsy, 7).
retweet(@alex, 7).

% Question 5
feedhelper(U, F, M, I) :- user(U), follows(U, F), (tweet(F, I, M); retweet(F, I)).
% Feed duplicate removal code
feed(U, M) :- uniquefeed(U, O),remove_ident(O, M).
uniquefeed(U, R) :- setof([I,F|M], feedhelper(U, F , M, I), R).
remove_ident([],[]).
remove_ident([[_|Y]|T1],[H2|T2]) :- Y=H2, remove_ident(T1,T2).

% Question 6
search(K,U,M) :- tweet(U, _, M), member(K, M).

% Question 7
isviral(S,I,R) :- (tweet(S, I, _);retweet(S, I)), follows(R, S).
isviral(S,I,R) :- (tweet(S, I, _);retweet(S, I)), follows(F, S), isviral(F, I, R).

% Question 8
isviral(S,I,R,M) :- M =< 1, (tweet(S, I, _);retweet(S, I)), follows(R, S).
isviral(S,I,R,M) :- (tweet(S, I, _);retweet(S, I)), follows(F, S), isviral(F, I, R, M-1).
