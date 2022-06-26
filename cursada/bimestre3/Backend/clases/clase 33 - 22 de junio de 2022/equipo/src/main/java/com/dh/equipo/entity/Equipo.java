import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "equipo")
public class Equipo{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Column(name = "id_equipo")
    private Long id;

    @Column(name = "nombre", length = 50)
    @Getter
    @Setter
    private String nombre;

    @Column(name = "ciudad", length = 50)
    @Getter
    @Setter
    private String ciudad;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL,mappedBy = "equipo")
    @Getter
    @Setter
    @JsonIgnoreProperties({ "equipo"})
    private Set<Jugador> jugadores = new HashSet<>();

    public Equipo() {
    }

}