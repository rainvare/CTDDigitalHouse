import java.util.ArrayList;
import java.util.List;

public class DepartComposite implements Departamento {
    private int id;
    private String name;

    private List<Departamento> childDepartments;

    public DepartComposite(int id, String name) {
        this.setId(id);
        this.setName(name);
        this.childDepartments = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void getName() {
        childDepartments.forEach(Departamento::getName);
    }

    public void addDepart(Departamento department) {
        childDepartments.add(department);
    }

    public void removeDepart(Departamento department) {
        childDepartments.remove(department);
    }
}
