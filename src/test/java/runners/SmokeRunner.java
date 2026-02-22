package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

class SmokeRunner {
    @Karate.Test
    /*Karate testAll() {
        return Karate.run("classpath:features/functional").relativeTo(getClass());
    }*/

    /*@Karate.Test
    Karate testTags() {
        return Karate.run("classpath:features/functional").tags("@smoke");
        //mvn test -Dtest=SmokeRunner#testTags
        //mvn -X test -Dtest=SmokeRunner#testTags
        //mvn test "-Dkarate.options=--tags @debug"
    }*/

    @org.junit.jupiter.api.Test
    void runAllInParallel() {
        Results results = Runner.path("classpath:features/functional")
                .parallel(10);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}

