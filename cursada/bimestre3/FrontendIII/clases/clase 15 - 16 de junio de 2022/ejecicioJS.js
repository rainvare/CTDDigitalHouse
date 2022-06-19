class StateFlow{
    constructor(initialValue) {
        this.data = initialValue
    }
  //1. crear un método que muestre en consola, lo que hay en this.data
mostrar=()=>{
  console.log(this.data)
}

  //2. Crear un método que reciba un valor, y lo agregue al final de los valores que contiene this.data --> evaluar si el valor existe.
agregarFinal= (num) =>{
  !this.data.includes(num) ? this.data.push(num) : console.log("el valor existe")
}

  // existe? retornar un string = el valor existe.

  //3. Crear un metodo que reciba un valor, y lo agregue al principio de los valores que contiene this.data.
agregarPrincipio =(num) =>{
  !this.data.includes(num) ? this.data.unshift(num) : console.log("el valor existe")
}
};



const arrOfValues = [1, 2, 3, 4, 5, 6];

const state = new StateFlow(arrOfValues);

state.mostrar();
state.agregarFinal(6);
state.mostrar();
state.agregarPrincipio(2);
