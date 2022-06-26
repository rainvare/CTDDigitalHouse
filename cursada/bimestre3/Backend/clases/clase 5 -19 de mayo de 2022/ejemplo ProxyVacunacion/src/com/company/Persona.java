package com.company;

import java.util.Date;

public class Persona {
    private String nombre;
    private String apellido;
    private String DNI;
    private String nombreVacuna;
    private Date fecha;

    public Persona(String nombre, String apellido, String DNI, String nombreVacuna, Date fecha) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
        this.nombreVacuna = nombreVacuna;
        this.fecha = fecha;
    }

    public Date getFecha() {
        return fecha;
    }
    public Object[] datos()
    {
        Object[] informacion;
        informacion=new Object[2];
        informacion[0]=DNI;
        informacion[1]=fecha;
        return informacion;
    }
}
