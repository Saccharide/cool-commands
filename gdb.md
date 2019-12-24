* Change disassembler flavor
```
set disassembly-flavor intel
```

* Disassemble Main
```
disassemble main
```

* Set break point
```
break *0x
```

* Check current register values
```
info reg
```

* Change register values
```
set $eax=0
```

* Next instruction
```
ni
```

* Send an interrupt signal after 'run'
```
run
```

* Backtrace displays the call stack of the program before the program ended(VERY USEFUL)
```
bt
```

* Examine the memory
```
x
x/10i 0xAAAAAAA (dumps the 10 instructions after then memory address 0xAAAAAA)
x/1s  0xAAAAAAA prints the strings at location
```

* invoke shell in gdb
```
shell man scanf
```

* step into next instruction
```
stepi 
```

* temporary break, will delete the breakpoint whenever we hit the address
```
tbreak *0xAAAAAA
```

* dumps the mapping of the program
```
info mapping
info b
```

* `si`, executing the next instruction, then`finish` to finish the current function and goes back to the parent function

* Launch gdb with a list of gdb commands: `-x`
```bash
gdb -x breaklist
```

* Running any function in gdb with `print`, need to declare the return type
```
p (char *) generate()
```

* View a string
```
x/1s (char*) life
p (char*) life
```
