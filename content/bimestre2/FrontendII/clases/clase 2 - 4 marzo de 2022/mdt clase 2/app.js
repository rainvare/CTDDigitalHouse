let juego= true;
let victoriausuario = 0;
let victoriacompu=0;

let nombreusuario=prompt("Antes de empezar. Ingresa tu nombre:");
alert(`¡Bienvenido, ${nombreusuario}!`);

while(juego)
{
    const jugador=parseInt(prompt("Ingrese un número:\n1 - Piedra\n2 - Papel\n3 - Tijera"));
    const computadora=Math.floor(Math.random()*3+1);
    if ((jugador!=null)&&(jugador!=undefined)&&(jugador>0)&&(jugador<=3)){
        if(jugador==computadora) {
            alert("¡Empate!");
    }else if((jugador==1&&computadora==2)||(jugador==2&&computadora==3)||(jugador==3&&computadora==1)){
        alert("Ganó la computadora");
        victoriacompu++;
    }else{
        alert(`¡Ganaste, ${nombreusuario}!`);
        victoriausuario++;
    }
    alert(`El marcador de esta partida es:\n${nombreusuario} - ${victoriausuario} victorias.\nComputadora - ${victoriacompu} victorias`);
}else{
    alert("Ingresa una opción válida");
}
if (victoriausuario==2||victoriacompu==2) {
    juego=false;
    alert("Fin del juego. ¡Hay un ganador!");
}
}

if(victoriausuario>victoriacompu){
    alert(`Eres el ganador con ${victoriausuario} victorias. Felicitaciones, ${nombreusuario}!`)
}else{
    alert(`Ha ganado la computadora con ${victoriacompu} victorias. ¡Sigue intentando!`)
}