* Getting an element within an iframe
```javascript
var iframe = doucment.getElementById('iframeid'):
var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
```
- Afterwards, you can then access the element of iframe by `innerDoc.getElementById`

* Set the content of an entire page
```javascript
document.documentElement.innerHTML = "<body>Hello World!</body>"
```

* Check if a string contains a substring or a character
```javascript
if (your_string.indexOf('TARGET_STRING') > -1){
    alert('TARGET_STRING' found inside your string!);
}
```

* Submitting a form without reloading the page
```javascript
function submitForm(){
    var http = new XMLHttpRequest();
    http.open("POST", "http://example.org/index.php", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = ""
    http.send(params);
    http.onload = function(){
        alert(http.responseText);
    }
}
```
