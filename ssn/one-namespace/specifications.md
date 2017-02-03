# Server specifications

This document contains the proposed minimal requirements for the server that exposes SSN as a modular ontology.

## Endpoints serving a document where resource `ssn:Vocabulary` is defined

Code name `sosa-core`

### Endpoint http://www.w3.org/ns/ssn/Vocabulary

```
Req:
GET /ns/ssn/Vocabulary
Host: www.w3.org
Accept: text/turtle

Res:
200 OK
Content-Type: text/turtle
Content-Disposition: filename= SSN-vocabulary.ttl;
Content-Location: http://www.w3.org/ns/ssn/Vocabulary.ttl

Payload: content of Vocabulary.ttl
```

```
Req:
GET /ns/ssn/Vocabulary
Host: www.w3.org
Accept: application/rdf+xml

Res:
200 OK
Content-Type: application/rdf+xml
Content-Disposition: filename= SSN-vocabulary.rdf;
Content-Location: http://www.w3.org/ns/ssn/Vocabulary.rdf

Payload: content of Vocabulary.rdf
```

```
Req:
GET /ns/ssn/Vocabulary
Host: www.w3.org
Accept: text/html

Res:
200 OK or redirection to a global documentation ?
```

### Endpoint http://www.w3.org/ns/ssn/Vocabulary.ttl

```
Req:
GET /ns/ssn/Vocabulary.ttl
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: text/turtle
Content-Disposition: filename= SSN-vocabulary.ttl;

Payload: content of Vocabulary.ttl
```

```
Req:
GET /ns/ssn/Vocabulary.ttl
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: application/rdf+xml
Content-Disposition: filename= SSN-vocabulary.rdf;

Payload: content of Vocabulary.rdf
```

### Endpoint http://www.w3.org/ns/ssn/Vocabulary.rdf

Same as http://www.w3.org/ns/ssn/Vocabulary.ttl, but:

- replace ".ttl" with ".rdf"
- replace `text/turtle` with `application/rdf+xml`


### Endpoint http://www.w3.org/ns/ssn/Vocabulary.html

Exists only if every module has its own documentation.



### Redirections for terms

A GET to any of the following URIs should be answered as follows:

```
303 See Also
Location: http://www.w3.org/ns/ssn/Vocabulary
```


```
http://www.w3.org/ns/ssn/FeatureOfInterest
http://www.w3.org/ns/ssn/ObservableProperty
http://www.w3.org/ns/ssn/Sensor
http://www.w3.org/ns/ssn/Actuator
http://www.w3.org/ns/ssn/Observation
http://www.w3.org/ns/ssn/Actuation
http://www.w3.org/ns/ssn/Sample
http://www.w3.org/ns/ssn/isSampleOf
...

```
