package test.com.dh.academia.service;

import main.com.dh.academia.dao.IDao;
import main.com.dh.academia.dao.impl.EstudianteDaoEnMemoria;
import main.com.dh.academia.dao.impl.EstudianteDaoH2;
import main.com.dh.academia.model.Estudiante;
import main.com.dh.academia.service.EstudianteService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;

public class EstudianteServiceTest {

    private IDao<Estudiante> estudianteDaoEnMemoria = new EstudianteDaoEnMemoria(new ArrayList());
    private IDao<Estudiante> estudianteDaoH2 = new EstudianteDaoH2();
    private EstudianteService estudianteService = new EstudianteService();


    @Before
    public void cargarEstudiantesCambiandoImplementacionDAO() {
        //En este caso estudianteDao estará apuntando a un objeto del tipo EstudianteDaoEnMemoria
        estudianteService.setEstudianteDao(estudianteDaoEnMemoria);
        //Siguiendo el principio de polimorfismo el método guardar se comportará de acuerdo al comportamiento indicado en la clase EstudianteDaoEnMemoria
        estudianteService.guardarEstudiante(new Estudiante(1L, "EstudianteUno", "ApellidoUno"));

        //En este caso estudianteDao estará apuntando a un objeto del tipo EstudianteDaoH2
        estudianteService.setEstudianteDao(estudianteDaoH2);
        //Siguiendo el principio de polimorfismo el método buscar se comportará de acuerdo al comportamiento indicado en la clase EstudianteDaoEnMemoria
        estudianteService.guardarEstudiante(new Estudiante(2L, "EstudianteDos", "ApellidoDos"));

        //Conclusión el método guardar se comporta diferente de acuerdo al objeto que estamos referenciando en cada momento.

    }
    @Test
    public void buscarEstudiantesCambiandoImplementacionDAO(){
        //En este caso estudianteDao estará apuntando a un objeto del tipo EstudianteDaoEnMemoria
        estudianteService.setEstudianteDao(estudianteDaoEnMemoria);
        //Siguiendo el principio de polimorfismo el método buscar se comportará de acuerdo al comportamiento indicado en la clase EstudianteDaoEnMemoria
        Estudiante estudiante = estudianteService.buscar(1L);
        Assert.assertEquals(estudiante.getNombre(),"EstudianteUno");
        Assert.assertEquals(estudiante.getApellido(),"ApellidoUno");

        //En este caso estudianteDao estará apuntando a un objeto del tipo EstudianteDaoH2
        estudianteService.setEstudianteDao(estudianteDaoH2);
        //Siguiendo el principio de polimorfismo el método buscar se comportará de acuerdo al comportamiento indicado en la clase EstudianteDaoH2
        estudiante = estudianteService.buscar(2L);
        Assert.assertEquals(estudiante.getNombre(),"EstudianteDos");
        Assert.assertEquals(estudiante.getApellido(),"ApellidoDos");

        //Conclusión el método buscar se comporta diferente de acuerdo al objeto que estamos referenciando en cada momento.

    }



}
