import java.util.Arrays;

public class IP {
    private int[] nro = new int[4];

    public IP(int nro1, int nro2, int nro3, int nro4) {
        this.nro[0] = nro1;
        this.nro[1] = nro2;
        this.nro[2] = nro3;
        this.nro[3] = nro4;
    }

    @Override
    public String toString() {
        return "IP{" +this.nro[0]+"."+this.nro[1]+"."+this.nro[2]+"."+this.nro[3]+'}';
    }

  String getPais(){
        String pais="" ;
        if (nro[0]<=49) {
            pais = "argentina";
        }
        if ((nro[0]<=99) && (nro[0]>=50)) {
            pais = "brasil";
        }
        if ((nro[0]<=149) && (nro[0]>=100)) {
            pais = "colombia";
        }
    return pais;
    }
 }
