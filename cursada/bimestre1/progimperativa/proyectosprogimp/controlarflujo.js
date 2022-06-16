/*Agregá Caminos
Revisá el siguiente código y asegúrate de entenderlo para poder avanzar con el
ejercicio.

        let edad=20 //(el número es a modo de ejemplo, podes cambiarlo o crear otras
        para tener varias pruebas)
        if(edad<18) {
        console.log("No puede pasar al bar.")
        }
        else if(edad<21){
        console.log("Puede pasar al bar, pero no puede tomar alcohol.")
        }
        else{
        console.log("Puede pasar al bar y tomar alcohol.")
        }

Sin repetirte, modificá tu código de forma tal que cumpla con estas consignas:
● Si la edad es negativa, que se muestre en la consola este mensaje: 
"Error, edad inválida. Por favor ingrese un número válido."
Importante: No se deberá mostrar ningún otro mensaje.
● Si tiene 21 años, además de darle la bienvenida, felicitarlo por haber llegado a
la mayoría de edad.
● Si su edad es impar decile en cualquiera de los mensajes: "¿Sabías que tu edad
es impar?".*/

let edad=43 //(el número es a modo de ejemplo, podes cambiarlo o crear otraspara tener varias pruebas)
if(edad<0){
  console.log("Error, edad inválida. Por favor ingrese un número válido.")
}
        else if(edad<18) {
        console.log("No puede pasar al bar.")
        }
else if(edad==21){
  console.log("Felicidades! eres mayor de edad.Puedes pasar al bar y tomar alcohol")
}
        else if(edad<21){
        console.log("Puede pasar al bar, pero no puede tomar alcohol.")
        }
else if(edad%2==0 && edad>18){
  console.log("¿Sabías que tu edad es impar? Puedes pasar al bar y tomar alcohol.");
}
        else{
        console.log("Puede pasar al bar y tomar alcohol.")
        }

/*totalAPagar()
Declarar una función llamada totalAPagar() que reciba como parametros, vehiculo y
litrosConsumidos.
A continuación, defina y realice los cálculos para obtener el total a pagar, teniendo en
cuenta las siguientes consideraciones.
● Si el vehículo es “coche”, el precio por litro es de $86,
● Si es “moto” ha de ser $70.
● Si es “autobús” ha de ser $55.
● Si los litros consumidos están entre 0 y 25 se ha de añadir $50 al total a pagar.
● Si los litros consumidos es mayor a 25 se ha de añadir $25 al total a pagar.
*/
