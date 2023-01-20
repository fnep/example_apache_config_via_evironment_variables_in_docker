# Set Apache configuration directives via environment variables

This is an example repository, to show how to run [Apache HTTP Server](https://httpd.apache.org/), defining configuration directives via environment variables. This is useful for running Apache in a container, where you want to be able to configure it without having to rebuild the image, or for automated test runs, where parts of the configuration need to be changed for by the runner.

In this case, we define the DocumentRoot via environment variables, and then run Apache. But you can define any configuration directive this way and also use it to switch sections of the configuration on and off.

The example is in a [Docker container](https://www.docker.com/), so you can run it with:

```shell
> docker compose up
```

and check the result with:

```shell
> curl http://localhost:8080/
This is a file that is shipped from a document root. …
```

… but it is more meant to be a documentation and one can install the same everywhere.
