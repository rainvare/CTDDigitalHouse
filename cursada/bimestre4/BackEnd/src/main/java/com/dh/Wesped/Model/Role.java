package com.dh.Wesped.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "roles")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Enumerated(EnumType.STRING)
    private RoleName name;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.MERGE)
    @JoinColumn(name = "roles_id")
    private Set<User> users = new HashSet<>();

    public Role() {
    }

    public Role(RoleName name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "name=" + name +
                '}';
    }
}