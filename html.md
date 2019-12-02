* Submitting a form without reloaading the page with iframe
```html
<iframe name="tmp" style="display:none;"></iframe>
<form action="http://example.com/index.php?key=value"  method="POST" targe="tmp">
</form>
```
