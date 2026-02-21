package utils;

import com.github.javafaker.Faker;
import com.intuit.karate.junit5.Karate;

public class DataGenerator {

    public static String getName() {
        Faker faker = new Faker();
        return faker.name().firstName();

    }
}
