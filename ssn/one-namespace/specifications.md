# Server specifications

This document contains the proposed minimal requirements for the server that exposes SSN as a modular ontology.

## Redirection from the old namespace

First, a 301 Moved Permanently redirection is set from http://purl.oclc.org/NET/ssnx/ssn to http://www.w3.org/ns/ssn/ssnx

## The ontology with IRI http://www.w3.org/ns/ssn/ssnx


```
Req:
GET /ns/ssn/ssnx
Host: www.w3.org
Accept: text/turtle

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: text/turtle
Content-Disposition: filename= ssnx.ttl;
Content-Location: http://www.w3.org/ns/ssn/ssnx.ttl

Payload: content of ssnx.ttl
```

```
Req:
GET /ns/ssn/ssnx
Host: www.w3.org
Accept: application/rdf+xml

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: application/rdf+xml
Content-Disposition: filename= ssnx.rdf;
Content-Location: http://www.w3.org/ns/ssn/ssnx.rdf

Payload: RDF/XML equivalent for ssnx.ttl
```

```
Req:
GET /ns/ssn/ssnx
Host: www.w3.org
Accept: text/html

Res:
some documentation, or redirection to a global documentation ?
```

## The ontology with IRI http://www.w3.org/ns/sosa/

```
Req:
GET /ns/sosa/
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: text/turtle
Content-Disposition: filename= sosa.ttl;

Payload: content of sosa.ttl
```

```
Req:
GET /ns/sosa/
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: application/rdf+xml
Content-Disposition: filename= sosa.rdf;

Payload: content of sosa.rdf
```

```
Req:
GET /ns/sosa/
Host: www.w3.org
Accept: text/html

Res:
some documentation, or redirection to a global documentation ?
```

A GET to any of the following IRIs should be answered as follows:

```
303 See Also
Location: http://www.w3.org/ns/sosa/
```

```
http://www.w3.org/ns/ssn/FeatureOfInterest
http://www.w3.org/ns/ssn/Sensor
http://www.w3.org/ns/ssn/Actuator
http://www.w3.org/ns/ssn/Observation
http://www.w3.org/ns/ssn/Actuation
http://www.w3.org/ns/ssn/Sample
http://www.w3.org/ns/ssn/isSampleOf
...

```

## The ontology with IRI http://www.w3.org/ns/ssn/

```
Req:
GET /ns/ssn/
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: text/turtle
Content-Disposition: filename= ssn.ttl;

Payload: content of ssn.ttl
```

```
Req:
GET /ns/ssn/
Host: www.w3.org

Res:
200 OK (potentially 406 Not Acceptable depending on the Accept request header)
Content-Type: application/rdf+xml
Content-Disposition: filename= ssn.rdf;

Payload: content of ssn.rdf
```

```
Req:
GET /ns/ssn/
Host: www.w3.org
Accept: text/html

Res:
some documentation, or redirection to a global documentation ?
```

A GET to any of the following IRIs should be answered as follows:

```
303 See Also
Location: http://www.w3.org/ns/ssn/
```

```
http://www.w3.org/ns/ssn/hasInput
http://www.w3.org/ns/ssn/hasOutput
http://www.w3.org/ns/ssn/measurementProperty
...

```
