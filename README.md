# Grover
Grover happily serves source files that contain static constants for the terms in a given RDFS or OWL vocabulary.


Features
-
Currently, Grover converts RDFS or OWL vocabularies into the following languages/RDF frameworks:
* Java
** Jena


Installation & Running
-
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


Usage
-
Get Grover up and running. Then, use your favourite REST client and
```
GET /{targetLanguage}/{targetFramework}?uri={vocabURI} HTTP/1.1
```

Need an example?
```
curl http://localhost:8080/java/jena?uri=http://xmlns.com/foaf/spec/index.rdf
```


Contributing
-
Contributions are very welcome.


License
-
This source distribution is subject to the license terms in the LICENSE file found in the top-level directory of this distribution.
You may not use this file except in compliance with the License.


Third-party Contents
-
This source distribution includes the third-party items with respective licenses as listed in the THIRD-PARTY file found in the top-level directory of this distribution.
