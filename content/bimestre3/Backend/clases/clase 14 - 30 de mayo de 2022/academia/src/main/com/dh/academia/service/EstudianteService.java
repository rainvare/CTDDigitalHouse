package main.com.dh.academia.service;

import main.com.dh.academia.dao.IDao;
import main.com.dh.academia.model.Estudiante;

import java.util.List;

public class EstudianteService {

    private IDao<Estudiante> estudianteDao;

    public EstudianteService() {

    }

    public EstudianteService( IDao<Estudiante> estudianteDao) {
        this.estudianteDao = estudianteDao;
    }

    public void setEstudianteDao( IDao<Estudiante> estudianteDao) {
        this.estudianteDao = estudianteDao;
    }

    public Estudiante guardarEstudiante(Estudiante estudiante){
        estudianteDao.guardar(estudiante);
        return estudiante;
    }

    public void eliminarEstudiante(Long id){
        estudianteDao.eliminar(id);
    }
    public Estudiante buscar(Long id){
        return estudianteDao.buscar(id);
    }

    public List<Estudiante> buscarTodos(){
        return estudianteDao.buscarTodos();
    }

}
