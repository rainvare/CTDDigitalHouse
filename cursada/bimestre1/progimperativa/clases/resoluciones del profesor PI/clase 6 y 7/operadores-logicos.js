// operador "Y"
/*  Con el operador AND, podemos indicar que lógicamente si por ejemplo "tengo hambre" es VERDADERO, pero "tengo comida" es FALSO, no comeré, por lo que indicará el resultado como FALSO, ya que necesito que las 2 variables sean VERDADERAS. Pero en el siguiente ejemplo, tanto "tengo hambre" y "tengo comida" es VERDADERO, entonces el resultado es VERDADERO (comeré). */
let tengoHambre = true;
let tengoComida = false;
let comoComida = tengoHambre && tengoComida;
console.log(comoComida);

/*
hambre    comida
VALOR 1 | VALOR 2 | RESULTADO
true       true       true
true       false      false
false      true       false
false     false       false
*/


// operador "O"
/* Con el operador OR, podemos pensar que con el tren O con el colectivo PUEDO llegar al trabajo, por lo que con que UNA de las 2 VARIABLES sean VERDADERAS, entonces podré ir al trabajo, SÓLO será FALSO si ambos transportes no andan. */
let andaColectivo = true;
let andaTren = false;
let llegoAlTrabajo = andaTren || andaColectivo;
console.log(llegoAlTrabajo); // Mostrará true

/*
colectivo   tren
VALOR 1 | VALOR 2 | RESULTADO
true       true       true
true       false      true
false      true       true
false     false       false
*/


// operador de negacion
/* Veremos que "cursoEnDH" es VERDADERO, pero si pongo el signo " ! " me convierte ese valor al contrario, es decir, FALSO. */
let cursoEnDH = true;
console.log(cursoEnDH);   // muestra "true" (verdadero) 
console.log(!cursoEnDH);  // muestra "false" (falso)