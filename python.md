# Plain python commands
* Importing another file, include this to the source file, basically checks if the file is being run as the main file or not, if not, then run nothing, but still have the function available for other files to use. (very useful)
```python
if __name__ == '__main__':
    main()
```

* String manipulation. If we have lines of different strings, we can easily add them with `()`
```python
a = ("Hello"
    "World"
    ", This"
    "is ve"
    "ry c00l")

print(a)
```

* Iterate through a dictionary
```python
python2 or python3
for key, value in d.items():
```
* Get list of keys of a dictionary
```python
python2
a = {"a":0,"b":1} 
list_of_keys = a.keys()
```
```python
python3
a = {"a":0,"b":1} 
*list_of_keys, = a
```

* Another way to interate through dict in python3
```python
python3
for key in a:
    print(key)
```

* Sort a dictionary base on its value
```python
python2
import operator
x = {1:2, 3:4, 4:3}
sorted_x = sorted(x.items(), key=operator.itemgetter(1))
```
```python3
python3
x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
sorted_x = sorted(x.items(), key=lambda kv: kv[1])
```

* Parse python command line arguments
```python
python2
import sys
print "Num of args: ", len(sys.argv)
print "Args List: ", str(sys.argv)
```

* Formating print messages
```python
python2
str = "random string"
str.zfill(100)     # Padd the string with 0 in the front
str.rjust(100,'0') # Same effect as above
```

## Base64 Endoing and Decoding, very cool!
```python
python2
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
python3
print(hex(int(str_to_bin("This is cool!"),2)))
```

```python3
python3
def str_to_hex(s):
    o = ''
    for i in s:
        o += '{0:02x}'.format(ord(i))
    return o
print(str_to_hex("This is cool!"))
```

* Print a binary string as ASCII
```python3
python3
binary_string = '01010100010010000100100101010011001000000100100101010011001000000100001101001111010011110100110000100001'
for i in range (0,len(binary_string), 8):
    print(chr(int(binary_string[i:i+8],2)),end='')
```

## Native hex string manipulation
* Decode hexstring to string
```python2
python2
# hex string without `0x` prefix
hex_string.decode('hex')
```

```python3
python3
bytes.fromhex(hex_string).decode('utf')
bytes.fromhex(hex(m)[2:]).decode('utf')
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

* Converting Unix Timestamp to local time
```python
import time
def unix_to_ascii (unix_timestamp):
    utc_time = time.gmtime(unix_timestamp)
    local_time = time.localtime(unix_timestamp)
    print(time.strftime("%Y-%m-%d %H:%M:%S", local_time)) 
    print(time.strftime("%Y-%m-%d %H:%M:%S+00:00 (UTC)", utc_time))  
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

* Parse string as sage
```python
str = "1.0e25"
sage_eval(str)
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
with open ("file.csv", "w") as f:
    col_1    = "col 1"
    col_2    = "col_2"
    combined = col_1 + "," + '\"' + col_2 + '\"\n'
    f.write(combined)
```

* Read a file line by line
```python
with open ("FILE", "r") as f:
    for line in f.readlines():
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

# Crypto Code
* hashpumpy lib 
```python
import hashpumpy
for key_len in range(100):
    new_hash, msg = hashpumpy.hashpump('HASH_DIGEST', 'DATA WE KNOW', 'DATA WE WANT TO APPEND', key_len)
    print key_len, new_hash, msg
```

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
python x.py SILENT=1
```

* To solve the problem of `[Errno 24] Too many open files` with `ulimit`. `ulimit` get and set user limit of open files, `-n` to `50000` instead of default value of `1024`.
```bash
ulimit -n 50000
```

# Multithreading
* Create a new thread
```python
t1 = threading.Thread(target=func_name)
```

* Starting a thread created above
```python
t1.start()
```

* `join`: The main thread literally wait for the target thread to finish before continuing to the next line in main program
```python
t1.join()
t2.join()
```
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


# Iterables vs. Generator
* Lists are iterable and have values stored at memory
* Generators are also iterable. Although they don't have vaule stored in memory, they will produce vaule one at a time when requested, thus saving space and higher performance.

* `yield` is a generator function, it has the same feature as `return`, however, the function will not be run until the vaule of that generator is being accessed.


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

## Socket programming

* Create a `TCP` socket
```python
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
```

* Server socket uses `bind` to bind an address and port, and uses `listen` to listen for incoming connection
```python
import socket
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('127.0.0.1',1337))
s.listen()
while True:
    s, addr = ss.accept()
    msg = s.recv(1024)
    if msg:
        print(msg)
ss.close()
```

* Read until an expected string
```python
def read_until(msg):
    out = ''
    while msg not in out:
        out += socket.recv(1000)
    return out
```

* Echo server with multi-thread
```
import socket
import threading
import sys

def echo(s):
    while True:
        msg = s.recv(1024).decode('utf-8')
        if msg:
            if msg != "quit\n":
                print("recv: ",msg)
                s.sendall(msg.encode())
            else:
                print("exiting...")
                break

threads = []
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
    try:
        server_socket.bind(('127.0.0.1', 1337))
        while True:
            server_socket.listen(10)
            client_socket, address = server_socket.accept()
            t = threading.Thread(target=echo, args=[client_socket])
            t.start()
            threads.append(t)
    except KeyboardInterrupt:
        print("\nShutting down server...")
for thread in threads:
    thread.join()
```

# request
* Sending a `POST` request using `request` module
```python
import request

base_url = "http://google.com"
page     = "/login.php"
username = "admin"
password = "password"
data     = {
        "username"   : username,
        "password"   : password,
        "loginsubmit": "Submit"
}

response    = request.post(url, data=data, allow_redirects=False)
status_code = repsonse.status_code
if status_code == 302: # Authenticated successfully
    print response.cookies
```

* `verify=False` skips `SSL` certificate validation
```
response    = request.post(url, data=data, allow_redirects=False, verify=False)
```
