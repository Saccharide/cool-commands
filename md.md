## Italic
* Italic with *asterisks* or _underscores_
```md
*this is italic*
_this is also italic_
```

## Bold
* Bold with **asterisks** or __underscores__
```md
**bold**
__bold__
```

## Insert a picture
* Basically hidden link text!
```md
![Label](file.PNG)
```
* Change the image scale
```md
![Label](file.PNG =100x20)
![Label](file.PNG =100x)
```

## Links
* There are a couple of ways to create links in markdown
1. <https://google.com>
```md
<https://google.com>
```
2. [Link Text](https://google.com)
```md
[Link Text](https://google.com)
```
3. [Like a reference][1]

[1]: https://google.com

```md
[Like a reference][1]

[1]: https://google.com
```
4. This link is like a [variable].


[variable]: https://google.com

```md
This link is like a [variable].

[variable]: https://google.com
```

## Tables
| value | name   |
|:-----:|:------:|
| 0     | stdin  |
| 1     | stdout |
| 2     | stderr |
