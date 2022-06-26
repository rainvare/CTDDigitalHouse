package com.example.veterinaria.modelo;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

////Veterinaria:
////Nombre: String
////costo: int
////Y asociarlo con las mascotas. (la asociación deberá tener un fetchType lazy)
////Mascota:
////Nombre: String
////Tipo: String ej: Perro, gato, etc
////En el dao agregar:
////1- un método que cree una nueva Veterinaria
////2- un método para agregar mascotas a la veterinaria.
////3- un método para consultar todas las mascotas de una veterinaria
////4- un método para consultar todas las mascotas que son perro
////
////nota: Los metodos que se heredan del repositorio, solo agregar un comentario.

@Entity
@Table
public class Veterinaria {

    @Id
    @SequenceGenerator(name = "veterinaria_sequence", sequenceName = "veterinaria_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "veterinaria_sequence")
    private Long id;
    private String nombre;
    private int costo;

    @OneToMany(mappedBy = "veterinaria", fetch = FetchType.LAZY)
    private Set<Mascota> mascotas = new HashSet<>();

    public Veterinaria(String nombre, int costo) {
        this.nombre = nombre;
        this.costo = costo;
    }

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }
}
