

import java.util.List;
import java.util.Optional;

@Controller
@RestController
@RequestMapping("/equipo")
public class EquipoController {

    @Autowired
    @Qualifier("EquipoServiceImpl")
    private IEquipoService equipoService;


    @GetMapping("/")
    public ResponseEntity<List<Equipo>> readAll(){
        return new ResponseEntity<>(equipoService.readALl(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Equipo> readOne(@PathVariable("id") Long id){
        Optional<Equipo> respuesta = equipoService.readOne(id);
        if(respuesta.isPresent())
            return new ResponseEntity<>(respuesta.get(), HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta.get(), HttpStatus.valueOf(406));
    }


    @PostMapping("/insertar")
    public ResponseEntity<?> insert(@RequestBody Equipo equipo){
        Optional<Equipo> respuesta = equipoService.insert(equipo);
        if(respuesta.isPresent())
            return new ResponseEntity<>(respuesta.get() , HttpStatus.OK);
        else
            return ResponseEntity.status(406).body("datos incompletos del equipo");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable("id") Long id){
        Boolean respuesta = equipoService.delete(id);
        if(respuesta)
            return new ResponseEntity<>(respuesta, HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta, HttpStatus.valueOf(406));
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Boolean> update(@RequestBody Equipo equipo){
        Boolean respuesta = equipoService.update(equipo);
        if(respuesta)
            return new ResponseEntity<>(respuesta, HttpStatus.OK);
        else
            return new ResponseEntity<>(respuesta, HttpStatus.valueOf(406));
    }
}