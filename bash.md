# For loop in bash
```
for value in {1..5}
do
    echo $value
done
echo Will print 5 numbers starting from 1 to 5
```
## `findir`, source it to `~/bin`
```bash
#!/bin/bash
dir_name="$*"
if [[ -z $dir_name ]]; then
    echo "dir name cannot be empty."
    exit 1
fi
find $(pwd) -iname "*$dir_name*"
```

## `$` in bash
* `$1`,`$2`, are the positional parameters
* `$@` is the array of parameters
* `$*` is the expanded parameters with `IFS`
* `$#` is number of parameters

