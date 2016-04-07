
mongo-repl-util
-------------
It can be used to build image of mongo-repl-util. By running the container, it initializes replica set on the targeting mongo server.

- build
```{r, engine='bash', build}
$ docker build -t mongo-repl-util .
```

- run (mongo needs to be started before this)
```{r, engine='bash', run}
$ docker run --link some-mongo:mongodb -d mongo-repl-util
```
or
```{r, engine='bash', run}
$ docker run -e MONGO_HOST="142.133.111.170" -e MONGO_PORT="27017" -d mongo-repl-util
```
> where
> - MONGO_HOST is the hostname or IP address of mongo server, and
> - MONGO_PORT is the port of mongo server.
