package test.com.dh.clinica;

import com.dh.clinica.DAO.config.ConfigurationJDBC;
import com.dh.clinica.DAO.impl.OdontologoDaoH2;
import com.dh.clinica.model.Odontologo;
import com.dh.clinica.service.OdontologoService;
import org.junit.Assert;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(JUnit4.class)

public class OdontologoServiceTest {


    @Test
    public void listarTodos( ) {
        OdontologoService odontologoServiceTest = new OdontologoService(new OdontologoDaoH2(new ConfigurationJDBC()));

        Odontologo odontologo1Test = new Odontologo("Lorena", "Rodriguez", 16576854);
        Odontologo odontologo2Test = new Odontologo("Mario", "Sanchéz", 5468342);
        Odontologo odontologo3Test = new Odontologo("Esteban", "Goméz", 9086851);
        Odontologo odontologo4Test = new Odontologo("Juan Pablo", "Torrijo", 76510500);
        Odontologo odontologo5Test = new Odontologo("Gianna", "Fabianni", 710854325);
        Odontologo odontologo6Test = new Odontologo("Pedro", "San Vicente", 13753540);
        Odontologo odontologo7Test = new Odontologo("Tomás", "Enriquez", 36578521);
        Odontologo odontologo8Test = new Odontologo("Dolores", "Basualdo", 36543240);
        Odontologo odontologo9Test = new Odontologo("Anna", "Kim", 2145231);
        Odontologo odontologo10Test = new Odontologo("Rodrigo", "Molina", 72572230);


        odontologoServiceTest.vaciar();


        odontologoServiceTest.guardar(odontologo1Test);
        odontologoServiceTest.guardar(odontologo2Test);
        odontologoServiceTest.guardar(odontologo3Test);
        odontologoServiceTest.guardar(odontologo4Test);
        odontologoServiceTest.guardar(odontologo5Test);
        odontologoServiceTest.guardar(odontologo6Test);
        odontologoServiceTest.guardar(odontologo7Test);
        odontologoServiceTest.guardar(odontologo8Test);
        odontologoServiceTest.guardar(odontologo9Test);
        odontologoServiceTest.guardar(odontologo10Test);


        List<Odontologo> odontologos = odontologoServiceTest.listarTodos();


        Assert.assertTrue( !odontologos.isEmpty() );
        Assert.assertTrue( odontologos.size() == 10 );
    }

}