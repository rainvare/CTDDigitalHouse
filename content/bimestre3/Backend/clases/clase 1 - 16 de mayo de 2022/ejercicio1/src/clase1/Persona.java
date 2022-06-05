package clase1;

import java.time.LocalDate;
import java.time.Period;

public class Persona {
    private String nombre;
    private String apellido;
    private LocalDate edad;
    private String mail;

    public Persona(String nombre, String apellido) {
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getMail() {
        return mail;
    }

    public LocalDate getEdad() {
        return edad;
    }

    public void setEdad(LocalDate edad) {
this. edad = edad;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

 public String calcularNombreCompleto(){
        return this.nombre+", "+this.apellido;
    }

    public boolean esMayorDeEdad(){
        return Period.between(this.edad, LocalDate.of(2022, 5, 16)).getYears()>=18;
    }

}