# File IO
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

# Pip
* List of pip environments
```bash
pip freeze
```

* Install all pip environment recursively 
```bash
pip install -r requirements.txt
```

# Selenium

* Simulate keys user is typing.
```python
element.send_keys("KEY_STROKE")
```

* Simulate special keys. i.e., <ENTER>
```python
from selenium.webdriver.common.keys import Keys
element.send_keys(Keys.ENTER)
```

* Maximize window
```python
driver.maximize_window()
```

* Implicit wait time, in seconds
```python
driver.implicitly_wait(10)
```

* Take a screenshot
```python
driver.get_screenshot_as_file("screenshot.png")
```
