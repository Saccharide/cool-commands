# Collection of cool regular expression search

* Negative Look Ahead
```
(?!FOO)
```

* Matching everything enclosed
```
(?:FOO)
```

* Finding the string inside the cloest matching tags.
```
<p>(?:(?!<p>).)*<\/p>
```

