package com.company;

import java.util.Date;

public class Paciente {
    String nombre;
    String apellido;
    String historiaClinica;
    Date fechaInternacion;
    Date fechaAlta;


    Paciente(String nombre, String apellido, String historiaClinica, Date fechaInternacion) throws PacienteException {
        this.nombre = nombre;
        this.apellido = apellido;
        this.historiaClinica = historiaClinica;
        Date hoy = new Date();
        if (fechaInternacion.after(hoy)){
            throw new PacienteException("Error, ingreso una fecha de internacion posterior al dia actual");
        }else {
            this.fechaInternacion = fechaInternacion;
        }

        fechaAlta = null;
    }


    public Date getFechaInternacion() {
        return fechaInternacion;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void darAlta(Date fechaAlta) throws PacienteException{
        if (fechaAlta.after(fechaInternacion))
            System.out.println("Ok");
        else
            throw new PacienteException("La fecha de alta no puede ser anterior a la fecha de internacion");
    }



}
