public class DepartFinanceiro implements Departamento{
    private int id;
    private String name;

    public DepartFinanceiro(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public void getName(){
        System.out.println(getClass().getSimpleName());
    }

}
