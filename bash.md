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
find $(pwd) -iname "*$name*" 2>/dev/null
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

## Mount share folder VM ware
```bash
#!/bin/bash
vmware-hgfsclient | while read folder; do
  echo "[i] Mounting ${folder}   (/mnt/hgfs/${folder})"
  mkdir -p "/mnt/hgfs/${folder}"
  umount -f "/mnt/hgfs/${folder}" 2>/dev/null
  echo ".host:/${folder}"
  vmhgfs-fuse -o allow_other -o auto_unmount ".host:/${folder}" "/mnt/hgfs/${folder}"
done
```

## Restart VM tools, enable copy pasting from host to VM
```bash
#!/bin/bash
systemctl stop run-vmblock\\x2dfuse.mount
killall -q -w vmtoolsd

systemctl start run-vmblock\\x2dfuse.mount
systemctl enable run-vmblock\\x2dfuse.mount

vmware-user-suid-wrapper vmtoolsd -n vmusr 2>/dev/null
vmtoolsd -b /var/run/vmroot 2>/dev/null
```
## `$` in bash
* `$1`,`$2`, are the positional parameters
* `$@` is the array of parameters
* `$*` is the expanded parameters with `IFS`
* `$#` is number of parameters

