/* --------------------------- NO TOCAR DESDE ACÁ --------------------------- */
let datosPersona = {
  nombre: "",
  edad: 0,
  ciudad: "",
  interesPorJs: "",
};

const listado = [{
    imgUrl: "https://huguidugui.files.wordpress.com/2015/03/html1.png",
    lenguajes: "HTML y CSS",
    bimestre: "1er bimestre",
  },
  {
    imgUrl: "https://jherax.files.wordpress.com/2018/08/javascript_logo.png",
    lenguajes: "Javascript",
    bimestre: "2do bimestre",
  },
  {
    imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/React.svg/1200px-React.svg.png",
    lenguajes: "React JS",
    bimestre: "3er bimestre",
  },
];

const profileBtn = document.querySelector("#completar-perfil");
const materiasBtn = document.querySelector("#obtener-materias");
const verMasBtn = document.querySelector("#ver-mas");
const cambiarTema = document.querySelector('#cambiar-tema');

profileBtn.addEventListener("click", renderizarDatosUsuario);
materiasBtn.addEventListener("click", recorrerListadoYRenderizarTarjetas);
cambiarTema.addEventListener("click", alternarColorTema);
/* --------------------------- NO TOCAR HASTA ACÁ --------------------------- */

function obtenerDatosDelUsuario() {
  /* --------------- PUNTO 1: Escribe tu codigo a partir de aqui --------------- */
 alert("A continuación, le solicitaremos algunos datos personales.");

  let nombreDeUsuario = prompt("Ingresa tu nombre: ");
 datosPersona.nombre = nombreDeUsuario;

 let anioNacimientoUsuario = prompt("Ingresa el año en que naciste: ");
 datosPersona.edad = 2022 -  parseInt(anioNacimientoUsuario);

 let ciudadUsuario = prompt("Ingresa la ciudad donde vives: ");
 datosPersona.ciudad= ciudadUsuario;

 let interesPorJsUsuario = confirm("¿Te interesa el lenguaje Javascript?");
 datosPersona.interesPorJs= interesPorJsUsuario;

}

function renderizarDatosUsuario() {
  /* ------------------- NO TOCAR NI ELIMINAR ESTA FUNCION. ------------------- */
  obtenerDatosDelUsuario();
  /* --------------- PUNTO 2: Escribe tu codigo a partir de aqui --------------- */
  
document.querySelector("#nombre").innerHTML=datosPersona.nombre;
document.querySelector("#edad").innerHTML=datosPersona.edad;
document.querySelector("#ciudad").innerHTML=datosPersona.ciudad;
document.querySelector("#javascript").innerHTML= (datosPersona.interesPorJs ? "Si" : "No");
}


function recorrerListadoYRenderizarTarjetas() {
  /* ------------------ PUNTO 3: Escribe tu codigo desde aqui ------------------ */

const tarjeta = document.querySelector("#fila");

if (tarjeta.innerHTML === "") {
  listado.forEach((materia) => {
    tarjeta.innerHTML += `<div class="caja">
        <img src="${materia.imgUrl}" alt="Logo ${materia.lenguajes}">
        <p class = "lenguajes">Lenguajes: ${materia.lenguajes}<p>
        <p class = "bimestre">Bimestre: ${materia.bimestre}</p>
    </div>`;
  });
} else {
  alert("Tus materias ya están disponibles");
}

}


function alternarColorTema() {
  /* --------------------- PUNTO 4: Escribe tu codigo aqui --------------------- */
 
  const temaOscuro = document.querySelector('#sitio')
  temaOscuro.classList.toggle('dark');
  

}

/* --------------------- PUNTO 5: Escribe tu codigo aqui --------------------- */

document.addEventListener('keypress', function(e) {
  if(e.key == 'f'|| e.key == "F") {
    document.querySelector('#sobre-mi').removeAttribute('class');
  }
})