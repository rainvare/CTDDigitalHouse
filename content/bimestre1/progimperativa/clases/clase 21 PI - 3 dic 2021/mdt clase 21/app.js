//1 
//departamentos.json contiene la información necesaria
// lecturaEscritura.js un módulo con él que nos facilitará leer y escribir en él archivo departamentos.json
// app.js, esta vez será un archivo vacío nuestro trabajo será desarrollar nuestro código en él mismo
const archivos = require("./lecturaEscritura");
const departamentos = archivos.leerJson("departamentos");

//2
const inmobiliaria ={
//a
departamentos,
//b 
buscarPorId: function(id){
    return this.departamentos.find(dept=> dept.id === id)
},
//c
departamentosNoDisponibles: function (){
    const alquilados = this.departamentos.filter(dept => dept.disponible === false);
    return alquilados;
},
//d
departamentosDisponibles: function (){
    const diponibles = this.departamentos.filter(dept => dept.disponible === true);
    return disponibles;
},
// e
filtrarPorAmbientes: function(ambientes) {
    return this.departamentos.filter(depto => depto.ambientes >= ambientes);
},
//f
filtrarPorPrecio: function(){
    const filtrados = this.departamentos();
    return filtrados.filter(dept=> dept.precioAlquiler <= precioAlquiler);
},
//g
rebajarPrecioAlquiler: function(descuento) {
    const disponibles = this.departamentosDisponibles()
    disponibles.forEach((depto) => {
        depto.precioAlquiler -= depto.precioAlquiler * (descuento / 100)
    })
    archivos.escribirJson('departamentos', this.departamentos)
    return disponibles;
},
//h
calcularRecaudación: function() {
    const alquilados = this.departamentosNoDisponibles();
    return alquilados.reduce((acc, alquilado) => acc + alquilado.precioAlquiler, 0)
},
//i
ordenarPorPrecio: function(arrayDepartamentos) {
    return arrayDepartamentos.sort((a, b) => a.precioAlquiler - b.precioAlquiler)
}
}