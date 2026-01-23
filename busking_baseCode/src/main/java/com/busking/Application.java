package com.busking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
// JPA Repository 스캔 경로 명시
@EnableJpaRepositories(basePackages = "com.busking.repository")
//JPA Repository 스캔 경로 명시
@ComponentScan(basePackages = {"com.busking.controller",
		"com.busking.service"})
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
