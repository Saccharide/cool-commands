* Read in files from a directory recursively
```python
import glob
files = glob.glob("./"+ '/**/*.txt', recursive=True)
for file in files:
    with open (file, "r") as f:
        for line in f:
            print(line)
```

* Write to a CSV
```python
with open ("csv_file.csv", "w") as csv_file:
    col_1    = "col 1"
    col_2    = "col_2"
    combined = col_1 + "," + '\"' + col_2 + '\"\n'
    csv_file.write(combined)
```
