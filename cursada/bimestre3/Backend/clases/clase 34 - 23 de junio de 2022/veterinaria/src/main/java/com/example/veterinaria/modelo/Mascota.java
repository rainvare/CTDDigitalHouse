package com.example.veterinaria.modelo;


import javax.persistence.*;


@Entity
@Table
public class Mascota {
    @Id
    @SequenceGenerator(name = "mascota_sequence", sequenceName = "mascota_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mascota_sequence")
    private Long id;
    private String nombre;
    private String tipo;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "veterinaria_id")
    private Veterinaria veterinaria;

    public Mascota() {
    }

    public Mascota(String nombre, String tipo) {
        this.nombre = nombre;
        this.tipo = tipo;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
