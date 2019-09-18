# TABS!
* Open file in a new tab!!!
```
:tabnew [FILENAME]
```

* Move split current split window into its own tab!
```
Ctrl + w, T
```

* Go to next tab
```
gt / gT
```

* Go to any tab
```
#gt
```

# Inside `NORMAL` mode

* Capitalize the whole word `a`: around, `i`: inner, `s`: sentence, `p`: paragraph
```
gUaw
```

* Merge next line with current line. (VERY USEFUL!)
```
J
```

* After selecting a word, a possible command, you can use `SHIFT + k` to look at the manual for it.
```
Shift + k
```
* Indent commands `=` (re-indent), `<`, `>`
* `>G` Indents until end of file
* `>}` Indents until next paragraph
* `>iB` Indents contents of current {  } block, `i`: inner, `B`: Block


* ANOTHER COOL WAY TO SAVE AND EXIT VIM equivalent to `:x`
```
ZZ
```

# Navigation
`_`   move to first non-blank character of the line
`g_`  move to last non-blank character of the line
`H`   move to top of screen
`M`   move to middle of screen
`L`   move to bottom of screen
`Ctrl + d`  move half-page down
`Ctrl + u`  move half-page up
`Ctrl + b`  page up
`Ctrl + f`  page down


# Register manipulations
* Copy to clipboard (`*` only works within vim, use `+` for system clipboard)
```
"+y
```

* Paste from clipboard
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

# Spelling
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

* Add a word to the internal word list.
```
zG
```

* Undo the adding of a new word to the internal word list
```
zuG
```

# Rotation
- `Ctrl + w  J/K` split vertical (`J` new screen on bottom)
- `Ctrl + w  H/L` split vertical (`H` new screen on right) 
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

* Paste current buffer 
```
Ctrl + a
```

* Delete left of the cursor till the beginning of the line
```
Ctrl + u
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

