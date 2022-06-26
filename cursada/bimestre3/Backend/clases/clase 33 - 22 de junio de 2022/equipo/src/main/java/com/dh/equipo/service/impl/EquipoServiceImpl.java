@Service("EquipoServiceImpl")
public class EquipoServiceImpl implements IEquipoService {

    @Autowired
    private IEquipoRepository equipoRepository;


    @Override
    public List<Equipo> readALl() {
        return equipoRepository.findAll();
    }

    @Override
    public Optional<Equipo> readOne(Long id) {
        return equipoRepository.findById(id);
    }


    @Override
    public Optional<Equipo> insert(Equipo equipo) {
        Equipo respuesta = null;
        if(equipo.getNombre() != null && equipo.getCiudad() != null){
            respuesta = equipoRepository.save(equipo);
        }

        return Optional.ofNullable(respuesta);
    }

    @Override
    public Boolean delete(Long id){
        Boolean respuesta = false;
        if(equipoRepository.existsById(id)){
            respuesta = true;
            equipoRepository.deleteById(id);
        }
        return respuesta;
    }

    @Override
    public Boolean update(Equipo equipo) {
        Boolean respuesta = false;
        if(equipoRepository.existsById(equipo.getId()) && equipo.getNombre() != null && equipo.getCiudad() != null){
            respuesta = true;
            equipoRepository.save(equipo);
        }
        return respuesta;
    }

}