package com.dh.entidad;

public class Odontologo {
    //atributos
    private Long id;
    private String apellido;
    private String nombre;
    private String matricula;
//constructor
    public Odontologo(String apellido, String nombre, String matricula) {
        this.apellido = apellido;
        this.nombre = nombre;
        this.matricula = matricula;
    }
    //métodos
    public Long getId() {
        return id;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMatricula() {
        return matricula;
    }

    public String setMatricula(String matricula) {
        this.matricula = matricula;
        return matricula;
    }
}
