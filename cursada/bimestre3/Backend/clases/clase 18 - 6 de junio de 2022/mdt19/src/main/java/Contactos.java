import java.io.Serializable;

public class Contactos implements Serializable {
    private String nombre;
    private String mail;
    private String telefono;

    public Contactos(String nombre, String mail, String telefono) {
        this.nombre = nombre;
        this.mail = mail;
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public String getMail() {
        return mail;
    }

    public String getTelefono() {
        return telefono;
    }

    @Override
    public String toString() {
        return "Contactos: " +
                "\n\t-Nombre: " + nombre +
                "\n\t-Mail: " + mail +
                "\n\t-Telefono: " + telefono;
    }
}

