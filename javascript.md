* Getting an element within an iframe
```javascript
var iframe = doucment.getElementById('iframeid'):
var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
```
- Afterwards, you can then access the element of iframe by `innerDoc.getElementById`
