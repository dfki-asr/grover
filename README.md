# Grover
Grover is a _polyglot schema generator_. It happily serves source files that contain static constants for the terms in a given RDFS or OWL vocabulary. This is very similar to Jena's schemagen CLI tool, but Grover comes as a REST service. We plan to extend Grover for catering more target languages and RDF frameworks.

## Features
Currently, Grover converts RDFS or OWL vocabularies into the following languages/RDF frameworks:
* Java
	* [Jena](https://jena.apache.org/)
	* [RDF4J](http://rdf4j.org/)
* C#
	* [dotNetRDF](http://dotnetrdf.org/)
	* [RDFSharp](https://rdfsharp.codeplex.com/)

## Installation & Running
Run Grover on your localhost by typing
```
mvn clean package tomcat7:run
```

You can modify Grover's listening port in the `pom.xml`
```
<build>
	...
	<plugins>
		...
		<plugin>
			<groupId>org.apache.tomcat.maven</groupId>
			<artifactId>tomcat7-maven-plugin</artifactId>
			<version>2.2</version>  	
            		<configuration>
				<server>Grover</server>
				<port>8080</port>
				<path>/</path>
			</configuration>
		</plugin>
		...
	</plugins>
</build>
```

## Usage
Get Grover up and running. Then, use your favourite REST client against one of our REST APIs.

### HTML UI
Point your good ol' browser to http://localhost:{YOUR_PORT} for some self-explanatory HTML UI.

### Form-style GET API
HTTP GET requests can be made against Grover's form-style GET API as follows
```
GET api/{targetLanguage}/{targetFramework}?uri={vocabURI} HTTP/1.1
```
Where _targetLanguage_ is your desired target programming language, _targetFramework_ is your desired RDF framework and _vocabURI_ is the HTTP resource to be processed.

Need some examples?
```
http://localhost:8080/api/java/jena?uri=http://xmlns.com/foaf/0.1/
http://localhost:8080/api/java/rdf4j?uri=https://www.w3.org/1999/02/22-rdf-syntax-ns#
http://localhost:8080/api/csharp/rdfSharp?uri=http://xmlns.com/foaf/0.1/
```

## Contributing
Contributions are very welcome.

## License
This source distribution is subject to the license terms in the LICENSE file found in the top-level directory of this distribution.
You may not use this file except in compliance with the License.

## Third-party Contents
This source distribution includes the third-party items with respective licenses as listed in the THIRD-PARTY file found in the top-level directory of this distribution.
