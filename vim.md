# Inside `NORMAL` mode

* Capitalize the whole word
```
gUaw
```

* Copy to clipboard (`*` only works within vim, use `+` for system clipbaord)
```
"+y
```

* Paste from clipbaord
```
"+p
```

* Access all register values
```
:reg
```

* Append to a register using a capitalized letter
```
"Zyy
```

* Paste over a word with a yanked one
```
viwp
```

* Copy / cut / change  inside quote / bracket / parenthesis
```
yi"
```

* Jump to next misspelled word. `]s` : next misspelled word; `[s` : previous misspelled word.
```
]s
[s
```

* Fix spelling error in vim, place cursor on the misspelled word and:
```
z=
```

* Previous modified location `Ctrl + o`  and next modified location `Ctrl + i`
```
Ctrl + o
Ctrl + i
```

* Increment a number `Ctrl + a`; Decrement a number `Ctrl + x`
```
Ctrl + a
Ctrl + x
```

* `Ctrl + s` enables terminal scroll lock, which will make vim "hang", `Ctrl + q` disables the lock.
```
Ctrl + s
Ctrl + q
```

* Merge next line with current line. (VERY USEFUL!)
```
J
```

* After selecting a word, a possible command, you can use `SHIFT + k` to look at the manual for it.
```
Shift + k
```

* ANOTHER COOL WAY TO SAVE AND EXIT VIM equivalent to `:x`
```
ZZ
```
# Rotation
- `Ctrl + w  J/K` split veritical (`J` new screen on bottom)
- `Ctrl + w  H/L` split veritical (`H` new screen on right) 
- `Ctrl + w  Ctrl + r` rotate screens  

# Inside `INSERT` mode
* Start a newline starting from cursor
```
Ctrl + j
```

* Backspace one character
```
Ctrl + h
```

* Backspace one word
```
Ctrl + w
```

* Indent / Tab the whole line
```
Ctrl + t
```
* Deindent / remove tab 
```
Ctrl + d
```

* Copy the character from previous line
```
Ctrl + y
```

* Search for completion
```
Ctrl + n
```

* Execute one command and return to Insert mode
```
Ctrl + o
```

# FOLDING
- `z` `o` opens a fold at cursor
- `z` `Shift + o` opens all folds at cursor
- `z` `c` closes a fold at cursor
- `z` `Shift + m` closes all folds at cursor

# SEARCHING FOR WORDS
* Inside `;%s/SEARCH/REPLACE/gc`
- `\<` beginning of a word
- `\>` end of a word
- `/`  forward search
- `?`  backwards search


# Vim LaTex
* Goes to next `<++>` and replace it (WARNING: this will break screen movement, need to use `<c-w>` instead
```
Ctrl + j
```

# VimIncr
* Use to generate a coloumn of increasing number by 1, first select the column
```
:I
```
Examples:
        :I
                    Use ctrl-V to
        Original    Select, :I
           8            8
           8            9
           8            10
           8            11
           8            12

        :I -1
                    Use ctrl-V to
        Original    Select, :I -1
           8            8
           8            7
           8            6
           8            5
           8            4

        :II
                    Use ctrl-V to
        Original    Select, :II
           8             8
           8             9
           8            10
           8            11
           8            12


        :ID
                  Use ctrl-V to
        Original  Select, :ID
          Sun       Sun
          Sun       Mon
          Sun       Tue
          Sun       Wed
          Sun       Thu


        :IA
                  Use ctrl-V to
        Original  Select, :IA
           a          a
           a          b
           a          c
           a          d
           a          e

