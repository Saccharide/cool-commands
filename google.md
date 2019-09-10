# Chrome Extension 

* Background script runs on `_generated_background_page.html`

* With `content.js` included in the `content_scripts` list, it is loaded every time a page is visited.

* `XHR`, aka `XMLHttpRequest`, is an API in the form of an object whose methods transfer data between a web browser and a web server. The object is provided by the browser's JavaScript environment. Particularly, retrieval of data from XHR for the purpose of continually modifying a loaded web page is the underlying concept of Ajax design.

# Browser Related

* When google won't open in parrot, use this command to open. I think it is something wrong with signing in to google account
```bash
google-chrome-stable %U --password-store=basic
```
