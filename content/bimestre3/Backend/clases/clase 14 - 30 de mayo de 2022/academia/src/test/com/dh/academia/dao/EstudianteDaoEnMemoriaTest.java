package test.com.dh.academia.dao;

import main.com.dh.academia.dao.IDao;
import main.com.dh.academia.dao.impl.EstudianteDaoEnMemoria;
import main.com.dh.academia.model.Estudiante;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class EstudianteDaoEnMemoriaTest {
    private IDao<Estudiante> estudianteDao = new EstudianteDaoEnMemoria(new ArrayList());

    @Before
    public void cargarEstudiantes() {
        estudianteDao.guardar(new Estudiante(1L, "EstudianteUno", "ApellidoUno"));
        estudianteDao.guardar(new Estudiante(2L, "EstudianteDos", "ApellidoDos"));
        estudianteDao.guardar(new Estudiante(3L, "EstudianteTres", "ApellidoTres"));
        estudianteDao.guardar(new Estudiante(4L, "EstudianteCuatro", "ApellidoCuatro"));
    }

    @Test
    public void guardarYBuscarEstudiantesTest() {

        estudianteDao.guardar(new Estudiante(5L, "Tomas", "Pereyra"));
        Estudiante estudiante = estudianteDao.buscar(5L);
        Assert.assertNotNull(estudiante);
        Assert.assertEquals(estudiante.getNombre(), "Tomas");

    }

    @Test
    public void traerTodosLosEstudiantesTest() {
        List<Estudiante> estudiantes = estudianteDao.buscarTodos();
        Assert.assertEquals(estudiantes.size(), 4);
    }
    @Test
    public void eliminarEstudianteTest() {
        estudianteDao.eliminar(1L);
        Assert.assertEquals(estudianteDao.buscar(1L),null);


    }
}
