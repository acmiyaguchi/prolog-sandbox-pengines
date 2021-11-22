# declaring crypto module safe in pengines

While using pengines, I am running into issues declaring modules that interact
with the operating system as safe. This repository replicates the issues that I
am running into.

## quickstart

```bash
docker compose up
```

```bash
server_1  | ERROR: /app/hash.pl:8:
server_1  | ERROR:    No permission to declare safe_goal `crypto:sha_hash(_13574,_13576,_13578)'
server_1  | Hash for hello world: 1354612085418477232551576450202542006353716358698
server_1  | % Started server at http://localhost:3030/
client_1  | ERROR: No permission to call sandboxed `crypto:sha_hash(_10502,_10504,[])'
client_1  | Warning: Goal (directive) failed: user:(_440="hello world",pengine_rpc("http://server:3030",consistent_hash("hello world",_442),[application(server)]),format("Hash for ~w: ~d~n",[_440,_442]))
client_1  | Welcome to SWI-Prolog (threaded, 64 bits, version 8.3.29)
client_1  | SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
client_1  | Please run ?- license. for legal details.
client_1  |
client_1  | For online help and background, visit https://www.swi-prolog.org
client_1  | For built-in help, use ?- help(Topic). or ?- apropos(Word).
client_1  |
client_1  | % halt
client_1  |
prolog-sandbox-pengines_client_1 exited with code 0
server_1  | Welcome to SWI-Prolog (threaded, 64 bits, version 8.3.29)
server_1  | SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
server_1  | Please run ?- license. for legal details.
server_1  |
server_1  | For online help and background, visit https://www.swi-prolog.org
server_1  | For built-in help, use ?- help(Topic). or ?- apropos(Word).
server_1  |
server_1  | % halt
server_1  |
prolog-sandbox-pengines_server_1 exited with code 0
```
