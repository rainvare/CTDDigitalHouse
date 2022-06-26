import java.time.Year;
import java.util.ArrayList;
import java.util.List;

public class Empleado extends Vendedor{
    private List<Afiliado> afiliados = new ArrayList<>();
    private Year anioIngreso;
//constructor

    public Empleado(String nombre, String categoria, Integer puntos, List<Afiliado> afiliados, Year anioIngreso) {
        super(nombre, categoria, puntos);
        this.afiliados = afiliados;
        this.anioIngreso = anioIngreso;
    }

    //métodos
    public void conseguirAfiliado(Afiliado afiliado) {
        System.out.println("el empleado" + nombre + " está consiguiendo un afiliado...");
        this.afiliados.add(afiliado);
        this.puntos += 10;
    }

    @Override
    public void vender() {
        System.out.println(nombre + " está vendiendo...");
        this.puntos += 5;
    }

    @Override
    public int calcularPuntos() {
        puntos += calcularAntiguedadEnAnios() * 5;
        return puntos;
    }

    private int calcularAntiguedadEnAnios() {
        return Year.now().getValue() - anioIngreso.getValue();
    }
}
