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

* Fix spelling error in vim, place cursor on the misspelled word and:
```
z=
```

* Jump to next misspelled word. `]s` : next misspelled word; `[s` : previous misspelled word.
```
]s
[s
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

## Inside `INSERT` mode
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

* Copy the character from previous line
```
Ctrl + y
```

* Search for completion
```
Ctrl + n
```

