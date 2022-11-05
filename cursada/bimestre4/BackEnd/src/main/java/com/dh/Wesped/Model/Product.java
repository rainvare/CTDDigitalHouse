package com.dh.Wesped.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    private String description;
    private Double longitude;
    private Double latitude;
    private Double rating;
    private Boolean availability;
    @JsonIncludeProperties(value = {"id", "title"})
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "categories_id")
    private Category category;
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "cities_id")
    private City city;
    @JsonIncludeProperties(value = {"id", "urlImage"})
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinColumn(name = "product_id")
    private Set<Image> images = new HashSet<>();
    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(name = "product_has_features",
            joinColumns = {@JoinColumn(name = "product_id")},
            inverseJoinColumns = {@JoinColumn(name = "features_id")})
    private Set<Feature> features = new HashSet<>();
    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(name = "product_has_policy",
            joinColumns = {@JoinColumn(name = "product_id")},
            inverseJoinColumns = {@JoinColumn(name = "policy_id")})
    private Set<Policy> policies = new HashSet<>();
    @JsonIgnore
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinColumn(name = "product_id")
    private Set<Booking> bookings = new HashSet<>();

    public Product() {
    }

    public Product(String title, String description, Double longitude, Double latitude, Double rating, Boolean availability) {
        this.title = title;
        this.description = description;
        this.longitude = longitude;
        this.latitude = latitude;
        this.rating = rating;
        this.availability = availability;
    }

    @Override
    public String toString() {
        return "Product{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", rating=" + rating +
                ", availability=" + availability +
                '}';
    }
}