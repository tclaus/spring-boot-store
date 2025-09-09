package com.codewithmosh.store;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StoreApplication {

    @Value("${SPRING_DATASOURCE_URL}")
    private String databaseUrl;

    public static void main(String[] args) {
        SpringApplication.run(StoreApplication.class, args);
    }

    @PostConstruct
    public void init() {
        System.setProperty("spring.datasource.url: ", databaseUrl);
    }

}
