package com.dh.clinica.model;

/*Creo mi clase Odontologo*/
public class Odontologo {
    private Integer ID;
    private String nombre;
    private String apellido;
    private Integer matricula;

    /* Constructor (sin ID) */

    public Odontologo(String nombre, String apellido, Integer matricula) {

        this.nombre = nombre;
        this.apellido = apellido;
        this.matricula = matricula;
    }

    /* Getters y Setters de la clase */

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

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

    public Integer getMatricula() {
        return matricula;
    }

    public void setMatricula(Integer matricula) {
        this.matricula = matricula;
    }



    /* Métodos */

    @Override
    public String toString() {
        return  "Odontologo{ " +
                "ID= " + ID +
                ", matricula= '" + matricula + '\'' +
                ", nombre= '" + nombre + '\'' +
                ", apellido= '" + apellido + '\'' +
                '}';
    }


}
