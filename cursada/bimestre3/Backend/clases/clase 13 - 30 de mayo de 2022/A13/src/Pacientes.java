

public class Pacientes {
    public static class Paciente {
        private Long id;
        private String nombre;
        private String apellido;
        private String domicilio;
        private Integer DNI;
        private String fechaDeAlta;
        private String usuario;
        private String password;

        public Paciente(String nombre, String apellido, String domicilio, Integer DNI, String usuario, String password, String fechaDeAlta) {
            this.nombre = nombre;
            this.apellido = apellido;
            this.domicilio = domicilio;
            this.DNI = DNI;
            this.usuario = usuario;
            this.password = password;
            this.fechaDeAlta = fechaDeAlta;
        }

        public Long getId() {
            return id;
        }

        public String getNombre() {
            return nombre;
        }

        public String getApellido() {
            return apellido;
        }

        public String getDomicilio() {
            return domicilio;
        }

        public Integer getDNI() {
            return DNI;
        }

        public String getFechaDeAlta() {
            return fechaDeAlta;
        }

        public String getUsuario() {
            return usuario;
        }

        public String getPassword() {
            return password;
        }

        public String setDomicilio(String domicilio) {
            return this.domicilio = domicilio;
        }

        public void setFechaDeAlta(String fechaDeAlta) {
            this.fechaDeAlta = fechaDeAlta;
        }

        public String setPassword(String password) {
            this.password = password;
            return password;
        }
    }
}
