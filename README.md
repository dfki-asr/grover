# Grover
Grover happily serves source files that contain static constants for the terms in a given RDFS or OWL vocabulary.

Installation & Usage
-
Run Grover on your localhost by typing
```
`mvn clean package tomcat7:run
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
