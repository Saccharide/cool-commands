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
* Document Type Definition, defines the structure of an `XML` document. It is placed before the acutal `XML` content.


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
* Entities are like variables, we can declare it and use it later with `&` and `;` sysmbol before the entity name.
* Always reference the enetity begin with `&` and end with `;`

### Internal DTD Entity
```xml
<!ENTITY email "some@email.com">
<!ENTITY author "Alice &email;">
<author>&author;</author>
```

Result `XML` data:
```
<author>Alice some@email.com</author>
```

### External DTD Entity
```xml
<!ENTITY author SYSTEM "http://example.com/entities.dtd">
<author>&author;</author>
```
