import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class PersonaTest {

    Persona persona1 = new Persona("Gabriel","Rodriguez",33, "grodriguez@digitalhouse.com");


    @Test
    void obtenerNombreCompleto() {
        assertEquals(persona1.obtenerNombreCompleto(),  "Rodriguez, Gabriel.");
    }

    @Test
    void esMayor() {
        assertTrue(persona1.esMayor());
    }

}