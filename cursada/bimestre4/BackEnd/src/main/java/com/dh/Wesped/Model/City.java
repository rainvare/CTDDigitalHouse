package com.dh.Wesped.Model;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "cities")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String country;
    @JsonIgnore
    @OneToMany(mappedBy = "city")
    private Set<Product> products = new HashSet<>();

    public City() {
    }

    public City(String name, String country) {
        this.name = name;
        this.country = country;
    }

    @Override
    public String toString() {
        return "City{" +
                "name='" + name + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}