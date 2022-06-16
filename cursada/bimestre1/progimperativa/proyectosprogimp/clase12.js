/*Nos contactan desde un teatro donde hace falta determinar el ganador de un concurso de stand up que consta de 3 presentaciones por participante. Nos piden que armemos el programa que determine al ganador y —a continuación— nos explican el funcionamiento del concurso para que lo tengamos en cuenta a la hora de realizar nuestro programa:
El público, máximo 100 personas, votó quién considera que estuvo mejor al terminar cada etapa. Por ejemplo, sube Alicia, se presenta y baja; sube Bob, se presenta y baja.
Terminada la presentación, el público vota indicando quién cree que ganó esa tanda.
Luego, continúa la siguiente tanda, igual que la primera. Y finalmente, una tercera.
¿Cómo representarías en una tabla tipo planilla de cálculos este problema? 

Participante
votos etapa 1
ganador v1
vot etapa 2
G v2
v etapa 3
G v3
Resultado


Como estos concursos se dan online, ocurren miles cada día. Nos llega a nuestro servidor la información por cada concurso en formato de arrays, uno por cada participante. Por lo tanto, los recibimos así:

El array de Alicia es: alicia = [ 23, 82, 46 ]
El array de Bob es: bob = [ 45, 8, 32]


Vayan planteando en código mientras piensan cómo realizar la comparación de cada etapa. 

La tarea consiste en enfrentar estas votaciones comparando a[0] con b[0], a[1] con b[1] y a[2] con b[2].


	Si a[i] > b[i], entonces, Alicia recibe 1 punto.
	Si a[i] < b[i], entonces, Bob recibe 1 punto.
	Si a[i] === b[i], ninguna persona recibe un punto.


*/



const alicia = [23, 69, 32];
const bob = [12, 67, 43];

 function encontrarGanador(a, b) {
    //su solución aquí
    let puntajeA = 0;
    let puntajeB = 0;
    for(let i = 0; i < a.length; i++)
    {
        if(a[i] > b[i])
        {
            puntajeA++;
        }
        else if(a[i] < b[i])
        {
            puntajeB++;
        }
    }
    if(puntajeA > puntajeB)
    {
        return "Alicia es el ganador";
    }
    else if(puntajeA < puntajeB){
        return "Bob es el ganador";
    }
    else
    {
        return "Empate";
    }
 }
console.log(encontrarGanador(alicia, bob)
)
