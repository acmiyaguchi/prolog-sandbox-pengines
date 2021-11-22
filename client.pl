:- use_module(library(pengines)).

:-
    Data = "hello world",
    pengine_rpc(
        "http://server:3030",
        consistent_hash("hello world", Hash),
        [application(server)]
    ),
    format("Hash for ~w: ~d~n", [Data, Hash]).
