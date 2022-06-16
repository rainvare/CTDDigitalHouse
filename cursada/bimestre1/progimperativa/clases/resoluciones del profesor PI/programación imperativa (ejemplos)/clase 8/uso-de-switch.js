/* Para usar el Switch debemos tener en cuenta que es para casos específicos, no hay comparaciones, su lógica funciona a base de UN valor */

let comidaSeleccionada = "Milanesa"

switch(comidaSeleccionada) {
    case "Ensalada":
        console.log("Quiero una ensalada")
    break;
    case "Milanesa":
        console.log("Quiero una milanesa")
    break;
    case "Fideos":
        console.log("Quiero fideos al tuco")
    break;
    case "Hamburguesa":
        console.log("Quiero una hamburguesa")
    break;
    default:
        console.log("No se encuentra la comida que quiero")
}