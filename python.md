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

* Formating print messages
```python2
str = "random string"
str.zfill(100)     # Padd the string with 0 in the front
str.rjust(100,'0') # Same effect as above
```

* Base64 Endoing and Decoding, very cool!
```python2
original = "This is cool!"
encoded = base64.b64encode(original)
print "Base 64 encoded = ", encoded
data = base64.b64decode(encoded)
print "Base 64 Decoded = ", data
```

* Print a string as binary
```python3
def str_to_bin(s):
    o = ''
    for i in s:
        o += '{0:08b}'.format(ord(i)) # since a printable ASCII has a size of 127 bit
    return o
```

* Print a string as HEX, first converts it to binary, then to hex
```python3
print(hex(int(str_to_bin("This is cool!"),2)))
```

```python3
def str_to_hex(s):
    o = ''
    for i in s:
        o += '{0:02x}'.format(ord(i))
    return o
print(str_to_hex("This is cool!"))
```

* Print out a HEX string as ASCII
```python2
hex_string.decode('hex')
```

```python3
bytes.fromhex(hex_string).decode('ascii')
bytes.fromhex(hex(m)[2:]).decode('ascii')
```
* Converting from bytes to int
```python3
key = int.from_bytes(urandom(6),'big')
```

* Converting from int to bytes, use `bit_length` if not base 10 or 2
```python3
print("Key = ", key.to_bytes((key.bit_length() + 7) // 8, 'big'))
```


* Print binary string as string
```python
def bin_to_str(b):
    l = [b[i:i+8] for i in xrange(0,len(b),8)]
    o = ''
    for i in l:
        o+=chr(int(i,2))
    return o
```

* Regex! `findall` finds all occurances of regular expression in the given string, outputs a list.
```python
import re
r = "<!-- failed after 2 rounds-->"
num_rounds = re.findall("failed after (\d*?) rounds", r)[0]
```

* Textwrap!
```python
from textwrap import wrap
s = '1234567890'
wrap(s, 2) # ['12', '34', '56', '78', '90']
```

* Sage Math!
```python
from sage.all_cmdline import *
```

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
* Find a list of files with the same extension type
```python
import os
import glob
path = "C:\\Users\\%username%\\Desktop"
extension = 'csv'
os.chdir(path)
result = glob.glob('*.{}'.format(extension))
```

* Write to a CSV, no need to import os
```python
with open ("csv_file.csv", "w") as csv_file:
    col_1    = "col 1"
    col_2    = "col_2"
    combined = col_1 + "," + '\"' + col_2 + '\"\n'
    csv_file.write(combined)
```

* Read a file line by line
```python
with open ("csv_file.csv", "r") as csv_file:
    for line in csv_file.readlines():
        print(line)
```

* Saving data as a pickle file, cool but very insecure!
```python
from sklearn.external import joblib
output_file = "output.pkl"
joblib.dump(clf_pipeline, output_file)
```

* Loading model from a pickle file, cool but very insecure!
```python3
import pickle
with open(r"saved_model.pickle","rb") as input_file:
    loaded_model = pickle.load(input_file)
```
* Cool pickle commands for sending pickled web request
```python3
import pickle
import base64

pack = lambda x : base64.b64encode(pickle.dumps(x))
unpack = lambda x : pickle.loads(base64.b64decode(x))
```
# Numpy commands
* remove the first row of a numpy array
```
data = np.delete(data, (0), axis=0)
```

# Image IO
* Write a numpy array to an image
```
import imageio
imageio.imwrte(file_name, data[:, :])
```

# Python in Terminal
* Using data in stdin as the input for python code
```bash
cat FILE | grep TEXT | python2 -c "import sys; print ''.join(sys.stdin.readlines())"
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

* Read until an expected string
```python
def read_until(msg):
    out = ''
    while msg not in out:
        out += socket.recv(1000)
    return out
```

* hashpumpy lib 
```python
import hashpumpy
for key_len in range(100):
    new_hash, msg = hashpumpy.hashpump('HASH_DIGEST', 'DATA WE KNOW', 'DATA WE WANT TO APPEND', key_len)
    print key_len, new_hash, msg
```

* Crypto code
```python
def egcd(a, b): # can be used to test if numbers are co-primes
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    #returns multiplicative modular inverse of a in mod m
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m
```

* Encryption with Pad
```python
def enc_pad(m,p):
    # encrypt message m with pad p, return binary string
    o = ''
    for i in range(len(m)):
        o += str(int(m[i]) ^ int(pad[i]))
    return o
```

* To silent connection infomation in pwntool connection, we can run the file with `SILENT=1`
```bash
python foo.py SILENT=1
```

* To solve the problem of `[Errno 24] Too many open files` with `ulimit`. `ulimit` get and set user limit of open files, `-n` to `50000` instead of default value of `1024`.
```bash
ulimit -n 50000
```

### Multithreading
* Using `threading` module
```python
import threading
def runme(start,dummy):
    print "running: ", start

try:
    t = threading.Thread(target=runme, args=(x,x))
    t.start()

except:
    print "Unable to spawn threads"
```



