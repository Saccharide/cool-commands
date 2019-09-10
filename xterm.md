* Changing the font for Xterm
    1. Create a `.Xresources` file containing:
```
xterm*faceName: Monospace
xterm*faceSize: 16
```

    2. run `xrdb -merge ~/.Xresources`. This uses X resources database manager to link to a customized X resource file
