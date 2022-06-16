let array = [1, 2, 4, 8];

const total = array.reduce((acum, elem) => acum + elem);

console.log(total);

/* forEach()*/
let numeros = [1, 2, 4, 8]
let total = 0

let sumar = num => {
    total += num;
    console.log(total);
}

numeros.forEach(sumar)