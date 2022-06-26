import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;

@Entity
@Table(name = "jugador")
public class Jugador {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Column(name = "id_jugador")
    private Long id;

    @Column(name = "nombre", length = 50)
    @Getter
    @Setter
    private String nombre;


    @Column(name = "puesto", length = 50)
    @Getter
    @Setter
    private String puesto;


    @Column(name = "numero")
    @Getter
    @Setter
    private Integer numero;



    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_equipo", referencedColumnName = "id_equipo")
    @Getter
    @Setter
    @JsonIgnoreProperties({"jugadores"})
    private Equipo equipo;
    public Jugador() {
    }
}