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

* Suppressing echoing the recipe, we add `@` to it
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

# Automatic variables in `Make`
* [reference](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables)
* `$@` is the file name of the target of the rule
* `$<` is the name of the first pre-requisite 
* `$^` is the name of all the pre-requisites
