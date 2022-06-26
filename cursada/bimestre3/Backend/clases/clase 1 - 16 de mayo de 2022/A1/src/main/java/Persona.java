public class Persona {
    private String nombre;
    private String apellido;
    private Integer edad;
    private String email;

    //constructor
    public Persona(String nombre, String apellido, Integer edad, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.email = email;
    }
    //getter y setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // métodos
    public String obtenerNombreCompleto() {
        return getApellido() + ", " + getNombre()+".";
    }

    public boolean esMayor() {
        return this.edad >= 18;
    }
}
