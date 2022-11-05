package com.dh.Wesped.Model;

import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;
    private String description;
    private String urlImage;
    @JsonIncludeProperties(value = {"id"})
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;

    public Image() {
    }

    public Image(String title, String description, String urlImage) {
        this.title = title;
        this.description = description;
        this.urlImage = urlImage;
    }

    @Override
    public String toString() {
        return "Image{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", urlImage='" + urlImage + '\'' +
                '}';
    }
}