:- use_module(library(pengines)).
:- pengine_application(server).
:- use_module(server:hash).

:- use_module(hash).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

run :-
    Data = "hello world",
    consistent_hash("hello world", Hash),
    format("Hash for ~w: ~d~n", [Data, Hash]),
    % now serve up the endpoint for the client
    http_server(http_dispatch, [port(3030)]),
    format("server shutting down~n")
    sleep(5).

:- initialization run.