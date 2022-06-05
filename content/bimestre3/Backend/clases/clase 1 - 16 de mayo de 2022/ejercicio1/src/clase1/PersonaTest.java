package clase1;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PersonaTest {
    Persona persona;
    Persona persona1;
    Persona persona2;

    @BeforeEach
    void doBefore(){
        persona = new Persona("Javier", "Test");
        persona.setEdad(LocalDate.of(2000, 4, 12));
        persona1 = new Persona("Vale", "Nov");
        persona1.setEdad(LocalDate.of(2003, 9, 20));
        persona2 = new Persona("Tito", "Perez");
        persona2.setEdad(LocalDate.of(2019, 12, 04));
}
    @Test
    void getNombreCompleto() {

        assertEquals("Javier, Test", persona.calcularNombreCompleto());
        assertEquals("Vale, Nov", persona1.calcularNombreCompleto());
        assertEquals("Tito, Perez", persona2.calcularNombreCompleto());
    }

    @Test
    void getEsMayorDe18() {
        assertEquals(persona.esMayorDeEdad(), true);
        assertEquals(persona1.esMayorDeEdad(), true);
        assertEquals(persona2.esMayorDeEdad(), false);
    }

}
