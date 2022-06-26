package com.example.tecnico.modelo;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import java.util.Set;

@Entity
@Table(name = "tecnicos")
public class Tecnico {

    @Id
    /*@SequenceGenerator(name = "tecnico_sequence", sequenceName = "tecnico_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tecnico_sequence")*/
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nombre;
    private int edad;

    @OneToMany(mappedBy = "tecnico", fetch = FetchType.LAZY)
    private Set<Jugador> jugadores;

    public Tecnico() {
    }

    public Tecnico(String nombre, int edad, Set<Jugador> jugadores) {
        this.nombre = nombre;
        this.edad = edad;
        this.jugadores = jugadores;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Set<Jugador> getJugadores() {
        return jugadores;
    }

    public void setJugadores(Set<Jugador> jugadores) {
        this.jugadores = jugadores;
    }
}
