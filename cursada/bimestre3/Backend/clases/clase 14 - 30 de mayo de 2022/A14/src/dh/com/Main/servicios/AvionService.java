package dh.com.Main.servicios;
import dh.com.Main.dao.IDao;
import dh.com.Main.entidades.Avion;

import java.util.List;

public class AvionService {

    private IDao<Avion> avionIDao;

    public IDao<Avion> getAvionIDao() {
        return avionIDao;
    }

    public void setAvionIDao(IDao<Avion> avionIDao) {
        this.avionIDao = avionIDao;
    }

    public Avion guardar(Avion a){
        return avionIDao.guardar(a);
    }

    public void eliminar(Long id){
        avionIDao.eliminar(id);
    }

    public Avion buscar(Long id){
        return avionIDao.buscar(id);
    }

    public List<Avion> buscarTodos(){
        return avionIDao.buscarTodos();
    }

}
