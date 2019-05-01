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

* Saving data as a pickle file
```python
from sklearn.external import joblib
output_file = "output.pkl"
joblib.dump(clf_pipeline, output_file)
```

* Loading model from a pickle file
```python
from sklearn.external import joblib
with open(r"saved_model.pickle","rb") as input_file:
    loaded_model = pickle.load(input_file)
```

# Plain python commands
* Iterate through a dictionary
```python
for key, value in d.items()
```
* Sort a dictionary base on its value
```python2
import operator
x = {1:2, 3:4, 4:3}
sorted_x = sorted(x.items(), key=operator.itemgetter(1))
```
```python3
x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
sorted_x = sorted(x.items(), key=lambda kv: kv[1])
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

* Take an awesome screenshot (more than just the current window)
```python
element = driver.find_element_by_id('readme')
element_png = element.screenshot_as_png
with open("test2.png", "wb") as file:
    file.write(element_png)                  

```
* Login to a website
```python
driver.find_element_by_id('email').send_keys('sample@email.com')
driver.find_element_by_id('pass').send_keys('password')
driver.find_element_by_id('login_button').click()
```
