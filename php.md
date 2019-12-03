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
