/**
* Programming Languages Homework 4: Prolog Queries
* July 26 2015
* Alex Pine
*/

% 1: The users that follow @joe.
follows(X, @joe).

% 2: All tweets by @joe.
tweet(@joe, I, M).

% 3: The number of users that retweeted tweet 1.
% This question was dropped from the assignment by the professor.

% 4: A query that shows @joe's feed.
feed(@joe, M).

% 5: A query that searches for a keyword in the universe of tweets.
search(like, U, M).

% 6: Write a query showing the inbox of a particular user, displaying only authorized direct messages.
% This question was dropped from the assignment by the professor.

% 7: Write a query that shows if a particular tweet is viral between the sender and a specified receiver.
isviral(@joe, 7, @alex).

% 8: Write a query that shows if a particular tweet is viral between the sender and a specified receiver in no less than
% 3 levels of indirection.
isviral(@joe, 7, @alex, 3).
