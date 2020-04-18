# For loop in bash
```
for value in {1..5}
do
    echo $value
done
echo Will print 5 numbers starting from 1 to 5
```

* Remove last `N` characters form a string
```bash
new_str=${str%?} # N = 1
new_str=${str::-N}
```

## `findf`
* Find a file in current directory easily, no need to remember other flags, source it to `~/bin`
```bash
#!/bin/bash
name="$*"
if [[ -z $name ]]; then
    echo "name cannot be empty."
    exit 1
fi
find $(pwd) -iname "*$name*"
```

## `gen`
* Generate a template for writeups
```bash
function gen(){
    if [[ -z $1 ]]; then
        echo "writeup file name cannot be empty."
        exit 1
    fi
    echo -e "# $1\n## Author: **saccharide**\n\nTask\n\`\`\`\n\n\`\`\`\n\n## Approach\n\n## Flag\n\`\`" > "$1.md"
}
```

## `$` in bash
* `$1`,`$2`, are the positional parameters
* `$@` is the array of parameters
* `$*` is the expanded parameters with `IFS`
* `$#` is number of parameters

