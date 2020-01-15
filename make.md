# Makefile notes

* Basic makefile example
```
hello:
    echo "Hello World"
```

* Basic Syntax of make file
```
target: prerequiste
<TAB> recipe
```

* Supressing echoing the recipe, we add `@` to it
```
hello:
    @echo "Hello World"
```

* Add this when using `bash` shell
```
SHELL := /bin/bash
```

* If not specified, only the first target is being run as default, to change this we can specify `.DEFAULT_GOAL := TARGET`

* We can use `all` to specify the targets to be run in sequence

* `:=` operator in makefile means simply expanded variables


