
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/jugador")
public class JugadorController {

    @Autowired
    @Qualifier("JugadorServiceImpl")
    private IJugadorService jugadorService;


    @GetMapping("/")
    public ResponseEntity<List<Jugador>> readAll(){
        return new ResponseEntity<>(jugadorService.readALl(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jugador> readOne(@PathVariable("id") Long id){
        Optional<Jugador> respuesta = jugadorService.readOne(id);
        if(respuesta.isPresent())
            return new ResponseEntity<>(respuesta.get(), HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta.get(), HttpStatus.valueOf(406));
    }


    @PostMapping("/insertar")
    public ResponseEntity<?> insert(@RequestBody Jugador jugador){
        System.out.println(jugador.getNombre());
        System.out.println(jugador.getEquipo().getId());
        Optional<Jugador> respuesta = jugadorService.insert(jugador);
        if(respuesta.isPresent())
            return new ResponseEntity<>(respuesta.get() , HttpStatus.OK);
        else
            return ResponseEntity.status(406).body("datos incompletos del jugador");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable("id") Long id){

        Boolean respuesta = jugadorService.delete(id);
        if(respuesta)
            return new ResponseEntity<>(respuesta, HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta, HttpStatus.valueOf(406));
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Boolean> update(@RequestBody Jugador jugador){
        Boolean respuesta = jugadorService.update(jugador);
        if(respuesta)
            return new ResponseEntity<>(respuesta, HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta, HttpStatus.valueOf(406));
    }

}