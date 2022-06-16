package com.dh.paciente;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;

@SpringBootApplication
@RestController
public class PacienteApplication {

	public static void main(String[] args) {
		SpringApplication.run(PacienteApplication.class, args);
	}
	@GetMapping
	public String VamosConBackend() {
		Calendar now = Calendar.getInstance();
		System.out.println("Current Hour in 12 hour format is : " + now.get(Calendar.HOUR));
		System.out.println("Current Hour in 24 hour format is : " + now.get(Calendar.HOUR_OF_DAY));
		System.out.println("Current Minute is : " + now.get(Calendar.MINUTE));
		System.out.println("Current Second is : " + now.get(Calendar.SECOND));
		System.out.println("Current Millisecond is : " + now.get(Calendar.MILLISECOND));
		return "Hora: " + now.get(Calendar.HOUR) + " " + now.get(Calendar.MINUTE) + " " + now.get(Calendar.SECOND) + " " + now.get(Calendar.MILLISECOND);

			/* Usar Date format para que se vea el formato
			LocalDateTime ldt = LocalDateTime.now().plusDays(1);
DateTimeFormatter formmat1 = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
System.out.println(ldt);
			 */


	}
}
