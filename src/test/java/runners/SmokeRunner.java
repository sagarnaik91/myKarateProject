package runners;

import com.intuit.karate.junit5.Karate;

class SmokeRunner {
    @Karate.Test
    Karate run() {
        return Karate.run("classpath:features/functional").relativeTo(getClass());
    }
}

