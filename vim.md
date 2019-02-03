* Capitalize the whole word
```
gUaw
```
* Copy to clipboard (* only works within vim, use + for system clipbaord)
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

* Jump to next misspelled word. ]s = next misspelled word; [s = previous misspelled word.
```
]s
[s
```

* Increment a number Ctrl + A; Decrement a number Ctrl + X
```
Ctrl + A
Ctrl + X
```

* Ctrl + S enables terminal scroll lock, which will make vim "hang", Ctrl + Q disables the lock.
```
Ctrl + S
Ctrl + Q
```

