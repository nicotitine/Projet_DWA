package com.projet.dwa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DwaApplication {

	public static Boolean isInscriptionOpened = false;

	public static void main(String[] args) {
		
		SpringApplication.run(DwaApplication.class, args);

	}
	
}
