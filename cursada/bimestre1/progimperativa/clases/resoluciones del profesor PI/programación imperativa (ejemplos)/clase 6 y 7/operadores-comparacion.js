let numeroBajo = 2;
let numeroGrande = 100;
console.log(numeroBajo);
console.log(numeroGrande);

console.log("");
// Comparaciones con símbolos " < " y " > "
let resultado1 = numeroBajo > numeroGrande;  // es false
let resultado2 = numeroBajo < numeroGrande;  // es true


// Comparaciones con símbolos " >= " y " <= "
resultado1 = numeroBajo >= numeroGrande; // es false
resultado2 = numeroBajo <= numeroGrande; // es true


// Comparaciones con símbolos " == " y " != "
resultado1 = numeroBajo == numeroGrande;    // es false
resultado2 = numeroBajo != numeroGrande;    // es true

// Casos especiales

10 == "10" // compara el VALOR pero NO el tipo de dato (numero y texto | number, string)

10 ===  "10" // Da false porque no es el mismo tipo de dato
10 !== "10" // Este uso es igual que usar "==" 

10 != "10" // Si es DIFERENTE
