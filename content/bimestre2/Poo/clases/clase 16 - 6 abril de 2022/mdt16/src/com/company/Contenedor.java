package com.company;

public class Contenedor implements Comparable<Contenedor>{
    private Integer identificador;
    private String procedencia;
    private Boolean materialPeligroso;

    public Contenedor(Integer id,String procedencia,Boolean peligroso){
        identificador = id;
        this.procedencia = procedencia;
        materialPeligroso = peligroso;
    }
    @Override
    public int compareTo(Contenedor o) {
        if(this.identificador > o.identificador){
            return 1;
        }
        if (this.identificador < o.identificador){
            return -1;
        }
        return 0;
    }

    @Override
    public String toString() {
        return "Contenedor"+ identificador +"\n";
    }

    public Boolean getMaterialPeligroso() {
        return materialPeligroso;
    }

    public String getProcedencia() {
        return procedencia;
    }
}
