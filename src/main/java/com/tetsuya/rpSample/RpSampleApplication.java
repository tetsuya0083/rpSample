package com.tetsuya.rpSample;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RpSampleApplication {

	public static void main(String[] args) {

		for (int i = 0; i < 10; i++){
			System.out.println("test");
		}
		SpringApplication.run(RpSampleApplication.class, args);

	}

}
