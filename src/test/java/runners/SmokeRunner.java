package runners;

import com.intuit.karate.junit5.Karate;

class SmokeRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/functional").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:features/functional").tags("@smoke");
        //mvn test -Dtest=SmokeRunner#testTags
        //mvn -X test -Dtest=SmokeRunner#testTags
        //mvn test "-Dkarate.options=--tags @debug"
    }
}

