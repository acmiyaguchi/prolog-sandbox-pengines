:- module(hash, [consistent_hash/2]).
:- use_module(library(crypto)).
:- use_module(library(clpfd)).

% attempt to sandbox
:- use_module(library(sandbox)).
:- multifile sandbox:safe_primitive/1.
sandbox:safe_primitive(crypto:sha_hash(_,_,_)).

% https://www.swi-prolog.org/pldoc/man?predicate=crypto_n_random_bytes/2
bytes_integer(Bs, N) :-
    foldl(pow, Bs, 0-0, N-_).

pow(B, N0-I0, N-I) :-
    B in 0..255,
    N #= N0 + B*256^I0,
    I #= I0 + 1.

consistent_hash(Data, Id) :-
    % this call is marked unsafe
    crypto:sha_hash(Data, Hash, []),
    bytes_integer(Hash, Id).
