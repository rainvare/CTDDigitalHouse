public class App {
    public static void main(String[] args) throws Exception {
        Departamento vendas = new DepartVendas(
            1, "Departamento de Vendas");
        Departamento financeiro = new DepartFinanceiro(
            2, "Departamento Financiero");
  
        DepartComposite composite = new DepartComposite(
            3, "Composite");
  
          composite.addDepart(vendas);
          composite.addDepart(financeiro);
  
          composite.getName();
    }
}
