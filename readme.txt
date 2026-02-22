To run the test from CLI - mvn test "-Dkarate.options=--tags @smoke" "-Dkarate.env=dev"
mvn test "-Dkarate.options=tags ~@skipme" -> This will run all the features in the feature file except scenario with skime tags
@ignore - Ignore the scenario
Understand how to pass a query param ?????????????
To pass variable in the request body - "#(variableName)" if type is string
* def stringValue ="Sagar" And request "#(stringValue)"
* def numberValue = 8 And request #{numberValue)
* def profile = { age: 30, city: 'NY'  And request { "details": #(profile) }
* def events = [{name: "PAYMENT"}] And request { event_types: #(events) }
match always uses ==
match always uses '#string'
mvn test -Dtest=SmokeRunner#runAllInParallel (This will run the SmokerRunner java runner class and execute runAllInParallel method)
