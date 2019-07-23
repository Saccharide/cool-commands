* Sizes
```
b = byte (8 bit)
s = short (16 bit integer) or single (32-bit floating point)
w = word (16 bit)
l = long (32 bit integer or 64-bit floating point)
q = quad (64 bit)
t = ten bytes (80-bit floating point)
```

```
scanf always add a \0 at the end of input, that's why we need to put number of buffer -1 when writing sth like %BUF_SIZE-1s
```
