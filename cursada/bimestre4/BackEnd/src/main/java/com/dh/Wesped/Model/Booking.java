package com.dh.Wesped.Model;

import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Getter
@Setter
@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private LocalTime hour;
    private LocalDate checkin;
    private LocalDate checkout;
    @JsonIncludeProperties(value = "id")
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;
    @JsonIncludeProperties(value = "id")
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "users_id")
    private User user;

    public Booking() {
    }

    public Booking(LocalTime hour, LocalDate checkin, LocalDate checkout) {
        this.hour = hour;
        this.checkin = checkin;
        this.checkout = checkout;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "hour=" + hour +
                ", checkin=" + checkin +
                ", checkout=" + checkout +
                '}';
    }
}