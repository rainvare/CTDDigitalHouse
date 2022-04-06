package com.company;

public abstract class SistemaArmas implements Comparable {
    private Integer energia;
    public SistemaArmas(Integer energiaInicial){
        this.energia=energiaInicial;
    }
    public abstract String mostrar();

    @Override
    public String toString() {
        return this.mostrar();
    }

    @Override
    public int compareTo(Object o) {
        return this.energia-((SistemaArmas)o).getEnergia();
    }


    public Integer getEnergia(){
        return this.energia;
    }
    public void setEnergia(Integer energia){
        this.energia=energia;
    }
}
