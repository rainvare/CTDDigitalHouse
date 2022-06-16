import com.company.Asteroide;
import com.company.Nave;

public class Main {

    public static void main(String[] args) {

        miNave = new Nave(10, 1, 'N', 2.0);
        Asteroide asteroide1, asteroide2, asteroide3;
        asteroide1 = new Asteroide(16, 8, 'O', 8);
        asteroide2 = new Asteroide(9, 22, 'E', 6);
        asteroide3 = new Asteroide(8, 14, 'S', 15);

        System.out.println(miNave.obtenerCoordenadas());
        miNave.girar('O');
        miNave.irA(9, 1, 'O');
        System.out.println(miNave.obtenerCoordenadas());
    }
}
