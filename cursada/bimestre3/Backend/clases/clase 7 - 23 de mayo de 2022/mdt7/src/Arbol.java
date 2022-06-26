import java.util.Random;

public class Arbol {
    Random random = new Random();
    private int alto;
    private int ancho;
    private String color;
    private String tipoArbol;

    public Arbol(String tipo) {
        if(tipo.equals("Ornamental")){
            this.tipoArbol = "Ornamental";
            this.alto =  randomNumber(300,200); // 200 a 299
            this.ancho = randomNumber(500,400); // 400 a 499
            this.color = "Verde";
        }

        if(tipo.equals("Frutal Rojo")){
            this.tipoArbol = "Frutal Rojo";
            this.alto = randomNumber(600,500); // 500 a 599;;
            this.ancho = randomNumber(400,300);// 300 a 399;
            this.color = "Rojo";
        }

        if(tipo.equals("Frutal Celeste")){
            this.tipoArbol = "Frutal Celeste";
            this.alto = randomNumber(200,100); // 100 a 199;
            this.ancho = randomNumber(300,200); // 200 a 299;
            this.color = "Celeste";
        }
    }


    public double getAlto() {
        return alto;
    }

    public void setAlto(int alto) {
        this.alto = alto;
    }

    public double getAncho() {
        return ancho;
    }

    public void setAncho(int ancho) {
        this.ancho = ancho;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }


    @Override
    public String toString() {
        return "Arbol{" +
                "alto=" + alto +
                ", ancho=" + ancho +
                ", color='" + color + '\'' +
                ", tipoArbol=" + tipoArbol +
                '}';
    }

    public int randomNumber(int max, int min) {
        return (int)Math.floor(Math.random()*(max-min+1)+min);
    }

}
