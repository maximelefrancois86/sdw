# One-namespace proposal

This document lists the steps to put sosa and ssn under a single namespace, and the issues that were encountered.

From the `dependencies.png` image, I shall start with `sosa-core`.

## Endpoints serving a document where resource `ssn:Vocabulary` is defined

Code name `sosa-core`.

ISSUE: where is `sosa-core` ? ok I guess it's file `sosa.ttl`

ACTION: copy `sosa.ttl` to `one-namespace`

ACTION: choose a URI for this document: `ssn:Vocabulary`

ACTION: rename `sosa.ttl` with the localName of its URI: `ssn:Vocabulary`

ACTION: add server specification for serving `ssn:Vocabulary` in `specifications.md`

ISSUE: why does `sosa-core` imports http://schema.org/ in `dependencies.png` ? There is no OWL ontology at http://schema.org/. _Action: removed this line_

ISSUE: why in `sosa-core` is there a line with `imports: http://www.w3.org/2004/02/skos/core` ? This is not depicted in `dependencies.png`? _Action: remove this line_

ISSUE: why is there `#baseURI:`? _Action: remove in favour of a standard `@Base` line, and the recommended ontology annotation `vann:preferredNamespaceUri`.

ISSUE: remove `#prefix: sosa` in favour of the recommended ontology annotation, and the recommended ontology annotation `vann:preferredNamespacePrefix`

ISSUE: remove `#prefix: sosa` in favour of the recommended ontology annotation, and the recommended ontology annotation `vann:preferredNamespacePrefix`

ISSUE: prefix `meta` is registered at prefix.cc to http://www.openrdf.org/rdf/2009/metadata#. Is there an actual prefix for namespace http://meta.schema.org/ ? _Action: do not use prefix meta_

ISSUE: I would really like to remove any mention of meta.schema.org . sosa.ttl is the only turtle document registered by Google where a mention to meta.schema.org is used. https://www.google.fr/search?client=ubuntu&channel=fs&q=meta.schema.org+prefix+for&ie=utf-8&oe=utf-8&gfe_rd=cr&ei=bleUWMGHH5bFaI2fqfgB#channel=fs&q=filetype:ttl+%22meta.schema.org%22 . Maybe that should be considered as a bad practice ? _Action: none._

ISSUE: the registered prefix at prefix.cc for http://creativecommons.org/ns# is not `ns:`, but `cc:`.  _Action: change `ns:` into `cc:` everywhere_.

ISSUE: the `schema` prefix is not used. _Action: remove_

ISSUE: the http://purl.org/dc/elements/1.1/ terms should be dropped in favour of terms in http://purl.org/dc/terms/ [(see the Metadata Recommendations For Linked Open Data Vocabularies](http://lov.okfn.org/Recommendations_Vocabulary_Design.pdf) _Action: make the change_

ISSUE: there is also a "meta.schema.org/inverseOf". If we want to use this Google thing in SSN instead of standard RDFS and OWL axioms, why so we keep using `owl:inverseOf` ? _Action: none._

ISSUE: there is also a "meta.schema.org/inverseOf". If we want to use this Google thing in SSN instead of standard RDFS and OWL axioms, why so we keep using `owl:inverseOf` ? _Action: none._

ISSUE: the registered prefix at prefix.cc for http://purl.org/dc/terms/ is not `terms:`, but `dct:`, or `dcterms`.  _Action: change `terms:` into `dcterms:` everywhere_.

ISSUE: the `xhtm` prefix is not used. _Action: remove_

ACTION: make the list of term declaration more concise

ISSUE: The recommended annotation is not `dc:date` but `dcterms:modified` and `dcterms:issued`. _Action: remove declaration for `dc:date`, and add metadata `dcterms:modified` and `dcterms:issued`.


ISSUE: The title metadata for an Ontology should not be `rdfs:label` but `dcterms:title`. _Action: declare `dcterms:title` change_

ISSUE: The description metadata for an Ontology should not be `rdfs:comment` but `dcterms:description`. _Action: declare `dcterms:description` change_

ISSUE: `dcterms:creator` is declared but not used. _Action: add a blank node as creator (there is at least one creator)_

ISSUE: `dcterms:contributor` is not declared and not used. _Action: declare and add myself as a contributor_

ISSUE: `dcterms:identifier` is not used. _Action: remove_

ISSUE: `dcterms:source` is not used and not in the set of recommended metadata. _Action: remove_

ISSUE: `dcterms:created` is not used and not in the set of recommended metadata. _Action: remove_

ISSUE: `dcterms:date` is not used and not in the set of recommended metadata. _Action: remove_

ISSUE: `dcterms:modified` is not used but in the set of recommended metadata. _Action: add today_

ISSUE: `dcterms:issued` is not used but in the set of recommended metadata. _Action: add the latest WD date_

ISSUE: `dcterms:rights` is not used but in the set of recommended metadata. _Action: add blank node_

ISSUE: `cc:licence` is not used but in the set of recommended metadata. _Action: add blank node_

ISSUE: there is no `vann:preferredNamespacePrefix` metadata but it is in the set of recommended metadata. _Action: add_

ISSUE: add the `vann`, `voaf`, `vs` prefixes for recommended ontology and term metadata.

ACTION: change `skos:historyNote` into `owl:versionInfo`.

ISSUE: there is no `voaf` recommended metadata for the ontology, see  [(see the Metadata Recommendations For Linked Open Data Vocabularies](http://lov.okfn.org/Recommendations_Vocabulary_Design.pdf). _Action: add `a voaf:Vocabulary`_

ISSUE: terms under the `rdfs:` and `owl:` namespace do not need to be declared. _Action: delete_.

ISSUE: The title and description metadata for the Ontology and any term should have a language tag. _Action: add @en everywhere_.

ISSUE: `skos` should be used as a "soft import", i.e., just use the terms we need. _Action: remove import, and add term declarations when needed_.

ISSUE: The title and description metadata for the Ontology and any term should have a language tag. _Action: add @en tag_.

ACTION: Adding by default multiline capability for objects of `rdfs:comment`, `skos:definition`, `skos:note`, `skos:example` (i.e., with three double quotes)


ISSUE: The definition of observation and actuation should be parallel. _Action: none_.

QUESTION: domain of hasFeatureOfInterest cannot include ssn:Actuation ?

QUESTION: can there be a Sample that is not a FeatureOfInterest ?

ISSUE: the definition of the hasResult is strange to me. Should it be "Relation linking an Observation and a Result or an Actuator and a Result, which contains a value representing the value associated with the observed Property."

ISSUE: the hasValue relation is a datatype property. It might prevent users to assign a QUDT quantity value to a result. Could we add a different property that is an object property and serve the same purpose ?  

ISSUE: can hosts link something else than a platform to something else than a sensor or actuator (any example?)?

ISSUE: range of ssn:hasFeatureOfInterest includes  ssn:Sample. So domain of ssn:isFeatureOfInterestOf should also include ssn:Sample, and the definition should reflect this.

QUESTION: isn't a sample also a feature of interest by itself ? Can one make a sample of a sample ? Being a sample is some role, and not a class (like ... Would you create class Father, or would you define father as an object property ?). We could maybe just keep the properties here. _Proposal: remove the class Sample and replace references to it by references to ssn:FeatureOfInterest_.

QUESTION: can the object of ssn:madeObservation be something else than an observation ?

QUESTION: can the object of ssn:observedProperty be something else than a property ?

QUESTION: Please add an example where the ssn:phenomenonTime is different from the result time.

QUESTION: what should the range of phenomenonTime include ? maybe some time:TemporalEntity ?

ISSUE: why is phenomenonTime a object property whereas resultTime is a datatype property ? This is counter confusing because they both end with "time".

ISSUE: the label of ssn:usedProcedure is "used process". _Action: renamed "used procedure"_

ISSUE: where is the link between a property and its feature of interest ?

ISSUE: where is the link between a sensor/actuator and the procedure it implements ?

ISSUE: where is sensing and acting/actuating ?

PROPOSAL: could we define a super-class of Actuation and Observation named ProcedureExecution ?

PROPOSAL: could we define a super-class of Actuator and Sensor named ProcedureExecutor ?
