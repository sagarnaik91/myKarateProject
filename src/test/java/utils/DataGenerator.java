package utils;

import com.github.javafaker.Faker;
import com.intuit.karate.junit5.Karate;
import net.minidev.json.JSONObject;

public class DataGenerator {

    public static String getName() {
        Faker faker = new Faker();
        return faker.name().firstName();

    }

    public static String getCity() {
        Faker faker = new Faker();
        return faker.address().city();
    }
}
